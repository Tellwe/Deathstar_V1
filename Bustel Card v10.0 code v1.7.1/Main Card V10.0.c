#include <htc.h>
#include "MRF89XA.h"
#include <string.h>
/***********CHANGELOG*****************************************

2016-01-30
Work with the RPS-values to get the transiver to work in a better way. 
Arrays with values calculated in MathLAB and added to the software
The functionallity is compiled and downloaded but still problems remain with units not starting

2016-01-31	NEW SW.V V1.7.2
New array valuse added to have the same frequency for all different values
Change made do the handling of versions. Code name no longer contains the version name, it is written in the comments
Project backups always stored on the hard drive from MPLAB with the version in the project name

2016-02-06 (No code change, just changelog update of the previous work)
Channel find added with the arrays of values calculated in matlab.
All values can be found in the file "RSP Calculator"

//****************************************************************/

//Configline for initial configuration of registers in the PIC

__CONFIG(DEBUG_OFF & LVP_OFF & FCMEN_OFF & IESO_OFF & BOREN_OFF & CPD_ON & CP_ON & MCLRE_OFF & PWRTE_OFF & WDTE_OFF & FOSC_INTRC_NOCLKOUT);

//Definition needed to be able to use the delay-function from the htc.h
#define _XTAL_FREQ 4000000 

//IO of the card v10.0
//Inputs
#define iButton 		RB5
#define iPIR 			RA1
#define iPotentiometer	RA3 	//AN3
#define iLightSensor 	RA0 	//AN0
#define iBracket1 		RB0
#define iBracket2 		RB1
#define iBracket3 		RB2
//Outputs
#define oAnalogInputsON	RC0
#define oLEDBlink 		RC1
#define oLEDLight 		RC2
//Connections to the transiver
#define trRESET 		RA2 	//DO
#define trCSCON 		RA4 	//DO
#define trIRQ0 			RB3 	//DI
#define trIRQ1 			RB4 	//DI
#define trSDI 			RC5 	//DO
#define trSDO 			RC4 	//DI
#define trSCK 			RC3 	//DO
#define trCSDATA 		RA5 	//DO

//Global variables
unsigned char ReceivedData[40];
int intBlinkCycle;
int intBlinkCounter;
int intHalfSecondCounter;			//Counts half seconds in interruptroutine
int intSecondCounter;				//Counts seconds in interruptroutine
int intMinuteCounter;				//Counts minutes in interruptroutine
BOOL bDark;							//Bit is set when it's dark
int intDarkCheckIntervall;			//The set time beween controls of the light sensor in minutes
int intClockTimer[5];				//Timers made by Seb
BOOL bTimerComplete[5];				//Flag for timer complete by Seb
int intNumberOfBlinks = 600;		//Number of blinks for a blinkcycle
BOOL bTransiverModeReceive = FALSE;	//Active state of the transiver for receive
unsigned char TransmittedString[30];//Char containing the data received from the transiver
BOOL bValueFromPot = TRUE;			//TODO
int addressDarknessValue = 0;
BOOL btnPush = FALSE;
int intLightOnTime = 120;

//Used in function for channel find
//Values in arrays calculated from matlab for 868,32MHZ
const unsigned char ChannelR[13] = {79,89,99,109,119,149,159,159,169,169,69,129,139};
const unsigned char ChannelP[13] = {63,71,79,87,95,119,126,127,134,135,55,103,111};
const unsigned char ChannelS[13] = {24,27,30,33,36,45,123,48,126,51,21,39,42};

BOOL bChannelFound = 0;				//Used in the function FindChannel, if the PLL-lock is ok the bit will be set
int channelFound;					//Used in the function FindChannel, if the channel is OK the variable indicates the array position.

//Functions used
void init();
void DelayDs(int);
void WriteSPI(unsigned char);
unsigned char ReadSPI(void);
void TransiverInitReceiving(void); 
void TransiverInitTransmitter(void);
void TransiverInit(void);
void WriteControlRegTransiver(unsigned char , unsigned char);
void Blink(int);
void TransiverSleep(void);
void TransiverRX(void);
void TransiverTX(void);
void TransiverStandBy(void);
void SendPacket(char);
void SetRFMode(BYTE);
unsigned char RegisterRead(unsigned char);
void RegisterSet(unsigned char address, unsigned char value);
unsigned char ReadFIFO(void);
void WriteFIFO(unsigned char);
unsigned char AnalogValue(unsigned char);
void DarknessCheck(void);
unsigned char OperationMode(void);
void LightWithSensController(void);
unsigned char timerFunction(int intTimerNumber, int intSetSeconds );
void Mode_0();
void Mode_1();
void Mode_2();
void Mode_3();
void Mode_4();
void Mode_5();
void Mode_6();
void Mode_7();
void TransiverToReceive();
void TransiverReadFIFO();
void TransmittedDataHandler();
void TransmittString(unsigned char dataString[]);
char FindChannel(void);

//*************************************************************************************

void main()
{ 
	//Initiation of hardware...
	init();
	//Variable initiation
	if(OperationMode() == 3){
		intNumberOfBlinks = 300;	//Blinkcycle is 3 minutes, XTrafik req.
		intLightOnTime = 300;		//Lightcycle is 3 minutes, XTrafik req.
	}
	__delay_ms(800);
	TransiverInit();
		
	while(1)
	{
		if(OperationMode() == 0)
		{
			Mode_0();			
		}
		if(OperationMode() == 1)
		{
			Mode_1();
		} 
		//Mode without blink, oLedBlink set to same sequence as oLEDLight
		if(OperationMode() == 2)
		{
			Mode_2();
		}
		if(OperationMode() == 3)
		{
			Mode_3();
		}
		//Transmittsequence
		if(OperationMode() == 4)
		{
			Mode_4();
		}
		//Transmittsequence
		if(OperationMode() == 5)
		{
			Mode_5();
		}

		//The functionallity for receiveing data over the wireless communication
		
		if(!bTransiverModeReceive)
			TransiverToReceive();
		if(trIRQ1 && bTransiverModeReceive)										
			TransiverReadFIFO();			

	}

}
//*************************************************************************************
/****************Function description**********************
Function sets the transiver to receive mode
*******************************************************/
void TransiverToReceive()
{
	timerFunction(2, 5); //Set a timeout timer on five seconds for problem with the transiver


	//Cycle for going into RX-mode
	SetRFMode(RF_STANDBY);								//Transiver into Standby
	__delay_ms(10);										//Wait for oscillator to wake up
	RegisterSet(FTPRIREG,(RegisterRead(FTPRIREG)|0x02));//Clear the bit for detection for the PLL Lock
	SetRFMode(RF_SYNTHESIZER);							//Transiver into syntesize
	while((RegisterRead(FTPRIREG) & 0b00000010) == 0)	//PLL Lock
	{
		if(bTimerComplete[2])
		{
			FindChannel();								//If no PLL-lock, find new values for the frequency
			break;
		}
	}
			
	SetRFMode(RF_RECEIVER);
	__delay_us(500);
	bTransiverModeReceive = 1;						
}
/****************Function description**********************
Function reads the fifo from the transiver, and returns the sent data package.
*******************************************************/
void TransiverReadFIFO()
{
	timerFunction(3, 5); //Set a timeout timer on five seconds for problem with the transiver
	
	SetRFMode(RF_STANDBY);
	bTransiverModeReceive = 0;
	int i = 0;
	for (int j = 0; j < 30; ++j)
	{
		TransmittedString[j] = 0;
	}
	while((trIRQ0)&&(!bTimerComplete[3]))										//Read the FIFO from the transiver until the FIFO is empty 
	{
		TransmittedString[i] = ReadFIFO();				//Place bytes in the string for received data
		i++;
	}

	__delay_ms(10);	
	SetRFMode(RF_SLEEP);								//Set the transiver into sleep-mode		
	TransmittedDataHandler();
}
void TransmittedDataHandler()
{
	//Check data to se what command that has been sent
	if((strstr(TransmittedString, "N1BLINK")) && (OperationMode() == 6))					//Requsted node == 1
	{
		intBlinkCycle = 1;
		intBlinkCounter = 0;
		//DelayDs(10);			//Delay between succesfull recived commands
		TransmittString("N1STARTED");
	}
	else if((strstr(TransmittedString, "N2BLINK")) && (OperationMode() == 7))				//Requested node == 2
	{
		intBlinkCycle = 1;
		intBlinkCounter = 0;
		//DelayDs(10);			//Delay between succesfull recived commands
		TransmittString("N2STARTED");
	}
	else if((strstr(TransmittedString, "N1STARTED")) && (OperationMode() == 4))			
	{
		intBlinkCycle = 1;
		intBlinkCounter = 0;
		//DelayDs(1);			//Delay between succesfull recived commands
	}
	else if((strstr(TransmittedString, "N2STARTED")) && (OperationMode() == 5))			
	{
		intBlinkCycle = 1;
		intBlinkCounter = 0;
		//DelayDs(1);			//Delay between succesfull recived commands
	}
	else if((strstr(TransmittedString,"FLASHL")))
	{
		oLEDLight = 1;
		DelayDs(10);
		oLEDLight = 0;
		DelayDs(5);
	}
	else if((strstr(TransmittedString,"FLASHB")))
	{
		oLEDBlink = 1;
		DelayDs(10);
		oLEDBlink = 0;
		DelayDs(5);
	}
	else if((strstr(TransmittedString,"SENSVAL")))
	{
		unsigned char slask[8];
		slask[0] = AnalogValue(0);
		TransmittString(slask);
	}
	else if((strstr(TransmittedString,"POTVAL")))
	{
		unsigned char slask[8];
		slask[0] = AnalogValue(3);
		TransmittString(slask);
	}
	else if((strstr(TransmittedString,"DARKCALC")))
	{
		DarknessCheck();
		if(bDark)	
			TransmittString("It's Dark    ");
		else
			TransmittString("Not Dark     ");
	}
	else if((strstr(TransmittedString,"STATE?")))
	{
		if(bValueFromPot == TRUE)
			TransmittString("Pot");
		else
			TransmittString("PIC");

	}
	else if((strstr(TransmittedString,"CHSTATE")))
	{
		if(bValueFromPot== TRUE)
			bValueFromPot= FALSE;
		else
			bValueFromPot=TRUE;
	}
	// RMDV: Read Manual Darkness Value.
	else if((strstr(TransmittedString,"RMDV")))
	{
		unsigned char slask[8];
		slask[0] = eeprom_read(addressDarknessValue);
		TransmittString(slask);

	}
	// 
	else if((strstr(TransmittedString,"SETDV")))
	{
		//The format of the received string should be: "SETDV nnn" where nnn is the value to be set as the new darkness value
		int value;
		unsigned char slask[8];		
		value = atoi(&TransmittedString[6]);
		slask[0] = (unsigned char)value;
		TransmittString(slask);
		eeprom_write(addressDarknessValue,(unsigned char)value);		

	}
}
/*********************************************************************
 * void TransmittString(unsigned char dataString)
 *
 * Overview:        
 *              Sends the variable "dataString" through the transiver
 *
 * PreCondition:    
 *              Hardware initiated
 *
 * Input:       
 *              The string to be sent
 *				
 *
 * Output:      
 *
 * Side Effects:    
 *              
 *
 ********************************************************************/
void TransmittString(unsigned char dataString[])
{
	timerFunction(4, 5); //Set a timeout timer on five seconds for problem with the transiver
	//Local variables
	int i = 0;

	//Initiation of transmitt sequence
		SetRFMode(RF_STANDBY);								//Transiver into Standby
		__delay_ms(10);										//Wait for oscillator to wake up
		RegisterSet(FTPRIREG,(RegisterRead(FTPRIREG)|0x02));//Clear the bit for detection for the PLL Lock
		SetRFMode(RF_SYNTHESIZER);							//Transiver into syntesize
		while((RegisterRead(FTPRIREG) & 0b00000010) == 0)	//Wait for the PLL to lock
		{
			if(bTimerComplete[4])
			{
				FindChannel();
				break;	
			}
			
		}
		SetRFMode(RF_TRANSMITTER);							//Set the transiver into tranmitt mode
		__delay_us(500);									//Transmitter wake-up time


		WriteFIFO('S');
		WriteFIFO('Y');
		WriteFIFO('N');
		WriteFIFO('C');

	//Transmitt data
		while(dataString[i] != 0)
		{
			WriteFIFO(dataString[i]);
			i++;
		}

	//wait for transmitt done, set the transiver back to sleep
		while(!trIRQ1)
		{
			if(bTimerComplete[4])
			break;
		}
		__delay_us(10);
		SetRFMode(RF_SLEEP);
		__delay_ms(1);

}
//Separate functions for each of the operation modes, for the functionallity connected to the mode.

/****************Mode description**********************
Light with PIR and light sensor
Blink by button
*******************************************************/
void Mode_0()
{
	LightWithSensController();
}
/****************Mode description**********************
Light with button and lightsensor
Blink by button
*******************************************************/
void Mode_1()
{
	//Do a check of wheter it's dark or not, when the second counter has a certain value to get a sleepfunction
	if((intSecondCounter == 30)&&(!oLEDLight))
		DarknessCheck();
	if((intBlinkCycle == 1)&&(bDark == 1))
		oLEDLight = 1;
	else
		oLEDLight = 0;
}
/****************Mode description**********************
Light with PIR and lightsensor 
Blink not used, blink same function as the light so that two light outputs are available.
*******************************************************/
void Mode_2()
{
	LightWithSensController();
	if(oLEDLight)
		oLEDBlink = 1;
	else
		oLEDBlink = 0;
}
/****************Mode description**********************
Not used
*******************************************************/
void Mode_3()
{
	LightWithSensController();
	if(bDark && iPIR && intBlinkCycle == 0)
	{
		intBlinkCycle = 1;
		intBlinkCounter = 0;
	}
}
/****************Mode description**********************
Transmitter node 1
Light with PIR and lightsensor
*******************************************************/
void Mode_4()
{
	if(btnPush)
	{
		TransmittString("N1BLINK");
        TransiverToReceive();
        btnPush=FALSE;
	}
     
	LightWithSensController();
}
/****************Mode description**********************
Transmitter node 2
Light with PIR and lightsensor
*******************************************************/
void Mode_5()
{
	if(btnPush)
		{
			TransmittString("N2BLINK");
            TransiverToReceive();
            btnPush=FALSE;
		}
     
		LightWithSensController();
}
/****************Function description**********************
Function for the light with both pir and light sensor. 
Handles the darkness check and motion supervision.
The function uses timers
*******************************************************/
void LightWithSensController(void)
{

			//Do a check of wheter it's dark or not, when the second counter has a certain value to get a sleepfunction
		if((intSecondCounter == 30)&&(!oLEDLight))
			DarknessCheck();

		//If it's dark, check the motion sensor and turn on the light
		//Set the time when the system should recheck the conditions for having the light on
		if((bDark == 1)&&(iPIR)&&(!oLEDLight))
		{
			//Set the light to ON
			oLEDLight = 1;
			//Initiate timer
			timerFunction(0,intLightOnTime);
		}

		//Check if the time limit is reached
		if(bTimerComplete[0])
		{
			DarknessCheck();
			if((bDark)&&(iPIR))
			{
				timerFunction(0,intLightOnTime);
			}
			else
				oLEDLight = 0;
			
		}

}
/*********************************************************************
 * unsigned char timerFunction(int intTimerNumber, bool bInitiate, intSetSeconds )
 *
 * Overview:        
 *              Handler of timer functions
 *
 * PreCondition:    
 *              Global timer variables initiated
 *
 * Input:       
 *              intTimerNumber	-	ID if the used timer
 *				intSeconds 		-	The seconds of the timer
 *
 * Output:      1 	-	Timer initiated and started correctly
 *				0 	-	Timer not initiated and started correctly
 *
 * Side Effects:    
 *              Toggel of the global status bits of the timer
 *
 ********************************************************************/
unsigned char timerFunction(int intTimerNumber, int intSetSeconds )
{
	intClockTimer[intTimerNumber] = intSetSeconds;			//Set the timer to the desired time
	bTimerComplete[intTimerNumber] = 0;
	return 1;
}
/*********************************************************************
 * void TimerCounter()
 *
 * Overview:        
 *              Handler of timer counting
 *
 * PreCondition:    
 *              Global timer variables initiated
 *
 * Input:       
 *
 * Output:      
 * Side Effects:    
 *              Counting of timers
 *
 ********************************************************************/
void TimerCounter()
{
	for (int i = 0; i < 5; i++)
	{
		if(intClockTimer[i]>0)
			intClockTimer[i]--;
		else
			bTimerComplete[i] = 1;
	}
}
//**************************************************************************************
// Initiation dof the PIC Microconoller
//**************************************************************************************
void init()
{
	// set up oscillator control register
    OSCCONbits.IRCF2 = 1; //set OSCCON IRCF bits to select OSC frequency=4Mhz
    OSCCONbits.IRCF1 = 1; //set OSCCON IRCF bits to select OSC frequency=4Mhz
    OSCCONbits.IRCF0 = 0; //set OSCCON IRCF bits to select OSC frequency=4Mhz
    OSCCONbits.SCS = 1; //set the SCS bits to select internal oscillator block

	//Init port configuration
	PORTA = 0x00;
	PORTB = 0x00;
	PORTC = 0x00;
	TRISA = 0b00001011; //RA0 and RA1 inputs, RA2, RA4 and RA5 DI on transmitter
	TRISB = 0b00111111; //RB5, RB2, RB1 and RB0 inputs, RB3 and RB4 connected to transiver 
	TRISC = 0b00010000; //RC4 connected to transiver
	ANSEL = 0b00000000; //Analog select
	ANSELH = 0b00000000; //Analog Select
	ANSELbits.ANS0 = 1;	//RA0 = analog input
	ANSELbits.ANS3 = 1;	//RA3 = analog input
	OPTION_REGbits.nRBPU = 0; //For enabling of pull-ups
	WPUBbits.WPUB5 = 0; //Weak pull-up enabled RB5
	while(!RB5);		//Wait for the input to stabilize

	//Configuration of the SPI communication
	SSPCONbits.SSPM=0x00;       // SPI Master mode, clock = Fosc/4 (1000 Khz)
    SSPCONbits.CKP=0;           // Idle state for clock is low
    SSPSTATbits.CKE=1;          // Transmit occurs on transition from active to idle clock state
    SSPSTATbits.SMP=0;          // Data is sampled at middle of data output time
    SSPCONbits.SSPEN=0x01;      // Enable SPI Port
	SSPIE = 0; //Dectivates the SPI-interrupt

	//Initial values to transiver
	trCSDATA = 1; //initial value of CSDATA
	trCSCON = 1; //initial value of CSCON

	//Configuration of interrupt handler
	INTCONbits.RBIE = 1;	//Enable interrupt when change on PORTB
	INTCONbits.PEIE = 1;	//Enable peripheal interrupts
	PIE1bits.TMR1IE = 1;	//Enable overflow interrupt TMR1
	INTCONbits.GIE = 1;  	//Enable all unmasked interrupts
	IOCBbits.IOCB5 = 1;		//Enable interrupt on change for input RB5

	//Configuration of timers
	T1CON = 0b00110000;
	TMR1H = 0x0B;
	TMR1L = 0xDB;
	T1CONbits.TMR1ON = 1;

	//Initiation of ADC Conversion
	ADCON0bits.ADCS0 = 0;		//ADC Clock source
	ADCON0bits.ADCS1 = 0;		//ADC Clock source
	ADCON1bits.ADFM = 0;		//ADC result left justified
	ADCON1bits.VCFG1 = 0;		//ADC Ref voltage at VSS
	ADCON1bits.VCFG0 = 0;		//ADC Ref voltage at VDD

	//Initiation of variables
	intSecondCounter = 0;
	intHalfSecondCounter = 0;
	intMinuteCounter = 0;
}
//**************************************************************************************
// Delay function for setting delay in 0.1 sec steps
//**************************************************************************************
void DelayDs(int cnt){
	int i;
	for(i=0;i<cnt;i++){
		__delay_ms(100);
	}
}
//**************************************************************************************
// Send one byte on the SPI
//**************************************************************************************
void WriteSPI(unsigned char databyte)
{
    unsigned char buffer;
    buffer = SSPBUF;            // Read the buffer to clear any remaining data and clear the buffer full bit
	PIR1bits.SSPIF=0;           // clear SSP interrupt bit
    SSPBUF = databyte;          // Write data byte to the buffer to initiate transmission  	
 	while(PIR1bits.SSPIF == 0);
 	PIR1bits.SSPIF = 0;
}
//**************************************************************************************
// Read one byte on the SPI
//**************************************************************************************
unsigned char ReadSPI(void)
{
 	WriteSPI(0x00);
    return SSPBUF; 
}
//**************************************************************************************
// Initiate the transiver
//**************************************************************************************
void TransiverInit(void)
{  
	
	RegisterSet(GCONREG, 0x30);					//Set to the right frequency 
	RegisterSet(DMODREG,(0xA8)); 				//Set transiver into buffer mode
	RegisterSet(FDEVREG, 0x09);	//0x09				//Set the frequency deeviation to 40KHz
	RegisterSet(BRSREG, 0x07);	//0x09				//Set the bitrate to 25kbps	
	RegisterSet(FIFOCREG,(0x0A));				//Set the FIFO-size to 16 bytes and the treshhold for interrupts to 10
	RegisterSet(FTXRXIREG,(0x00|0xB0|0x09));	//IRQ0RX = nFIFOEmpty, IRQ1RX = FIFO_THRESHOLD, IRQ0TX = nFIFOEMPTY, IRQ1TX = TXDONE
	RegisterSet(FTPRIREG,(0x01|0x10|0x01));	//	//Start to till FIFO when sync word is detected, start transmission when FIFO_not_full
	RegisterSet(FILCREG, 0xA3);					//FIltersetting for the transiver
	RegisterSet(SYNCREG,(0x18|0x20|0x06));		//SYNC-word enabled, 32 bit size, 3 errors allowed
	RegisterSet(SYNCV31REG,('S'));				//
	RegisterSet(SYNCV23REG,('Y'));				//
	RegisterSet(SYNCV15REG,('N'));				//
	RegisterSet(SYNCV07REG,('C'));				//
	RegisterSet(TXCONREG, 0x72);			 		//Transmitt parameters
	RegisterSet(CLKOUTREG, 0x3C);					//Dissable CLKOUT
	RegisterSet(FCRCREG, 0x80);
	RegisterSet(GCONREG, (RegisterRead(GCONREG)|0x01));

	if(FindChannel() == 1)
		Blink(1);
	SetRFMode(RF_SLEEP);

}
/*********************************************************************
 * WORD FindChannel()
 *
 * Overview:        
 *              The function uses the arrays of valuse calculated for the RPS-valuse in the transiver
 *				and tests these to get the PLL-lock bit OK
 *
 * PreCondition:    
 *              Arrays OK
 *
 * Input:       
 *          None
 *
 * Output:  1 - if OK
 *			0 if NOK    
 *
 * Side Effects: Communication with the transiver   
 *
 ********************************************************************/
char FindChannel(void)
{
	int cnt = 0;
	bChannelFound = 0;
	channelFound = 0;
	
	__delay_ms(1000);
	for (int i = 0; i < 13; i++)
	{	
		RegisterSet(R1CREG,ChannelR[i]);					//R-value 
		RegisterSet(P1CREG,ChannelP[i]);					//P-value 
		RegisterSet(S1CREG,ChannelS[i]);					//S-value 
		RegisterSet(R2CREG,ChannelR[i]);					//R-value 
		RegisterSet(P2CREG,ChannelP[i]);					//P-value 
		RegisterSet(S2CREG,ChannelS[i]);					//S-value 
		RegisterSet(FTPRIREG,(RegisterRead(FTPRIREG)|0x02));//Clear PLL_LOCK-flag so we can see it restore on the new frequency
		SetRFMode(RF_SYNTHESIZER);							//Set the transiver to syntesize
		cnt = 0;
		while(cnt < 5)
		{
			
			if((RegisterRead(FTPRIREG) & 0b00000010) != 0)
			{
				bChannelFound = 1;
				channelFound = i;
				return 1;
			}
			cnt++;
			__delay_us(1000);			
		}
		
		
	}
return 0;	

}
/*********************************************************************
 * void SetRFMode(mode)
 *
 * Overview:        
 *              Sets the transiver to the desired mode
 *
 * PreCondition:    
 *              Hardware initiated
 *
 * Input:       
 *              the desired mode of the transiver
 *				
 *
 * Output:      
 *
 * Side Effects:    
 *              
 *
 ********************************************************************/
void SetRFMode(BYTE mode)
{
	trCSCON = 0;
	BYTE	mcparam0_read;
	mcparam0_read = RegisterRead(REG_MCPARAM0);
	switch (mode) {
		case RF_TRANSMITTER:
			RegisterSet(REG_MCPARAM0, (mcparam0_read & 0x1F) | RF_TRANSMITTER);
			//RF_Mode = RF_TRANSMITTER;				//RF in TX mode
			break;
		case RF_RECEIVER:
			RegisterSet(REG_MCPARAM0, (mcparam0_read & 0x1F) | RF_RECEIVER);
			//RF_Mode = RF_RECEIVER;					//RF in RX mode
			break;
		case RF_SYNTHESIZER:
			RegisterSet(REG_MCPARAM0, (mcparam0_read & 0x1F) | RF_SYNTHESIZER);
			//RF_Mode = RF_SYNTHESIZER;				//RF in Synthesizer mode
			break;
		case RF_STANDBY:
			RegisterSet(REG_MCPARAM0, (mcparam0_read & 0x1F) | RF_STANDBY);
			//RF_Mode = RF_STANDBY;					//RF in standby mode
			break;
		case RF_SLEEP:
			RegisterSet(REG_MCPARAM0, (mcparam0_read & 0x1F) | RF_SLEEP);
			//RF_Mode = RF_SLEEP;						//RF in sleep mode
			break;
	} /* end switch (mode) */
	trCSCON = 1;
}
/*********************************************************************
 * void Blink(n)
 *
 * Overview:        
 *              flashes the blink output "n" times
 *
 * PreCondition:    
 *              Hardware initiated
 *
 * Input:       
 *              number of flashes
 *				
 *
 * Output:      
 *
 * Side Effects:    
 *              
 *
 ********************************************************************/
void Blink(int n)
{
	for(int i = 1;i<=n;i++)
	{
		oLEDBlink = 1;
		DelayDs(2);
		oLEDBlink = 0;
		DelayDs(6);	
	}
	
}
/*********************************************************************
 * WORD RegisterRead()
 *
 * Overview:        
 *              This function access the control register of MRF89XA.
 *              The register address and the register settings are
 *              the input
 *
 * PreCondition:    
 *              None
 *
 * Input:       
 *          WORD    setting     The address of the register and its
 *                              corresponding settings
 *
 * Output:  None    
 *
 * Side Effects:    Register settings have been modified
 *
 ********************************************************************/
unsigned char RegisterRead(unsigned char adress)
{
	BYTE value;
    trCSCON = 0;
    adress = ((adress<<1)|0x40);
    WriteSPI(adress); 
	value = ReadSPI();
    trCSCON = 1;
	return value;
}
/*********************************************************************
 * void RegisterSet(BYTE address, BYTE value)
 *
 * Overview:        
 *              This function access the control register of MRF89XA.
 *              The register address and the register settings are
 *              the input
 *
 * PreCondition:    
 *            	 None
 *
 * Input:       
 *          WORD    setting     The address of the register and its
 *                              corresponding settings
 *
 * Output:  None    
 *
 * Side Effects:    Register settings have been modified
 *
 ********************************************************************/
void RegisterSet(unsigned char adress, unsigned char value)
{
    trCSCON = 0;
    adress = (adress<<1);
    WriteSPI(adress);
    WriteSPI(value);
    trCSCON = 1;
}
/*********************************************************************
 * BYTE ReadFIFO(void)
 *
 * Overview:        
 *              The function reads one byte from the FIFO
 *
 * PreCondition:    
 *              MRF89XA transceiver has been properly initialized
 *
 * Input:       
 *              None
 *
 * Output:      Data from FIFO
 *
 * Side Effects:    
 *              The packet has been sent out
 *
 ********************************************************************/
unsigned char ReadFIFO(void)
{
	BYTE value;
    trCSDATA = 0;
	value = ReadSPI();
    trCSDATA = 1;
	return value;
	
}
/*********************************************************************
 * void WriteFIFO(BYTE Data)
 *
 * Overview:        
 *              This function fills the FIFO
 *
 * PreCondition:    
 *              MRF89XA transceiver has been properly initialized
 *
 * Input:       
 *              BYTE   Data - Data to be sent to FIFO.
 *
 * Output:      None
 *
 * Side Effects:    
 *              The packet has been sent out
 *
 ********************************************************************/
void WriteFIFO(unsigned char Data)
{
    trCSDATA = 0;
    WriteSPI(Data);
    trCSDATA = 1;
}
/*********************************************************************
 * void interrupt tc_int(void)
 *
 * Overview:        
 *              This function controlls the interrupt routine generated in the controller
 *
 * PreCondition:    
 *              
 *
 * Input:       
 *             
 * Output:      None
 *
 * Side Effects:    
 *              
 *
 ********************************************************************/

void interrupt tc_int(void){

	
	//Make sure that the application is without wireless
	if((iButton == 0)&&(intBlinkCycle == 0)&&(OperationMode() < 2)){
		intBlinkCycle = 1;
		intBlinkCounter = 0;

	}else if(iButton==0)
        btnPush=TRUE;
        
	if(TMR1IF ==1){
		TMR1ON = 0;
		TMR1H = 0x0B;
		TMR1L = 0xDB;
		//Control of the blinkcycle 
		if((intBlinkCycle == 1)&&(intBlinkCounter<intNumberOfBlinks*2)){
			intBlinkCounter++;
			
			if(oLEDBlink == 0){
				//Check if the mode is for receiver, then operate both LEDs
				if(OperationMode() >= 6){
					oLEDLight = 1;
				}
				oLEDBlink = 1;
			}
			else if(oLEDBlink == 1){
				//Check if the mode is for receiver, then operate both LEDs
				if(OperationMode() >= 6){
					oLEDLight = 1;
				}
				oLEDBlink = 0;
			}
		}
		
		else if((intBlinkCycle == 1)&&(intBlinkCounter >=intNumberOfBlinks*2)){
			intBlinkCycle = 0;
			oLEDBlink = 0;
		}

		//Control of the counter counting seconds for the application
		intHalfSecondCounter++;
		if(intHalfSecondCounter>=2)
		{
			intHalfSecondCounter = 0;
			intSecondCounter++;
			TimerCounter();
		}
		if(intSecondCounter >=60)
		{
			intSecondCounter = 0;
			intMinuteCounter++;
		}
		if(intMinuteCounter >= 60)
		{
			intMinuteCounter = 0;
		}

		//Start Timer again
		TMR1ON = 1;	
}
	TMR1IF = 0;
	RBIF = 0;
    GIE = 1;						//Re-enable all interrupts
return;
}
/*********************************************************************
 * unsigned char AnalogValue(int channel)
 *
 * Overview:        
 *              Reads and returns the analog value from the requested channel
 *
 * PreCondition:    
 *              The channel need to be configured as an analog input
 *
 * Input:       Requested input channel
 *             
 * Output:      Analog value of the input
 *
 * Side Effects:    
 *             
 ********************************************************************/

unsigned char AnalogValue(unsigned char channel)
{
	ADCON0bits.CHS = channel;
	ADCON0bits.ADON = 1;
	DelayDs(1);
	ADCON0bits.GO = 1;
	DelayDs(1);
	while(ADCON0bits.GO);
	ADCON0bits.ADON = 0;
	return ADRESH;

}
/*********************************************************************
 * unsigned char DarknessCheck(void)
 *
 * Overview:        
 *              Reads and returns the status whether it's dark or not
 *
 * PreCondition:    
 *              
 * Input:       
 *             
 * Output:      1 if dark, 0 if not
 *
 * Side Effects  :    
 *             
 ********************************************************************/
void DarknessCheck(void)
{
	unsigned char darknessValue;
	oAnalogInputsON = 0;
	// determine whether we use valuie from pic or potentiometer.
	if(bValueFromPot == TRUE)
		darknessValue= AnalogValue(3);
	else
		darknessValue=eeprom_read(addressDarknessValue);

	if(AnalogValue(0)>darknessValue)
		bDark = 1;
	else
		bDark = 0;
	oAnalogInputsON = 0; 
		
}
/*********************************************************************
 * unsigned char OperationMode(void);
 *
 * Overview:        
 *              Reads and returns the operation mode from reading the bracketsetting 
 *				on the board
 *
 * PreCondition:    
 *              
 * Input:       
 *             
 * Output:      0 	-	Blink by button, Light by pir and lightsens, solarpanel
 *				1 	-	Blink by button, Light by button, no pir or lightsens, solarpanel
 *
 * Side Effects:    
 *             
 ********************************************************************/
unsigned char OperationMode(void)
{
	unsigned char bracketStatus;
	bracketStatus = ((~PORTB) & 0b00000111) ;		//Read the status of PORTB, remove the unread bits, invert and remove bit 3-7 again.

	return bracketStatus;
}
