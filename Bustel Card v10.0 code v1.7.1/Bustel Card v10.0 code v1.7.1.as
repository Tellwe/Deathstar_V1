opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 10920"

opt pagewidth 120

	opt lm

	processor	16F886
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 20 "C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	psect config,class=CONFIG,delta=2 ;#
# 20 "C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	dw 0xFFFF & 0xEFFF & 0xF7FF & 0xFBFF & 0xFCFF & 0xFF7F & 0xFFBF & 0xFFDF & 0xFFFF & 0xFFF7 & 0xFFFC ;#
	FNCALL	_main,_init
	FNCALL	_main,_TransiverInit
	FNCALL	_main,_OperationMode
	FNCALL	_main,_Mode_0
	FNCALL	_main,_Mode_1
	FNCALL	_main,_Mode_2
	FNCALL	_main,_Mode_4
	FNCALL	_main,_Mode_5
	FNCALL	_main,_TransiverToReceive
	FNCALL	_main,_TransiverReadFIFO
	FNCALL	_TransiverReadFIFO,_timerFunction
	FNCALL	_TransiverReadFIFO,_SetRFMode
	FNCALL	_TransiverReadFIFO,_ReadFIFO
	FNCALL	_TransiverReadFIFO,_TransmittedDataHandler
	FNCALL	_TransmittedDataHandler,_strstr
	FNCALL	_TransmittedDataHandler,_OperationMode
	FNCALL	_TransmittedDataHandler,_DelayDs
	FNCALL	_TransmittedDataHandler,_AnalogValue
	FNCALL	_TransmittedDataHandler,_TransmittString
	FNCALL	_TransmittedDataHandler,_DarknessCheck
	FNCALL	_Mode_5,_TransmittString
	FNCALL	_Mode_5,_LightWithSensController
	FNCALL	_Mode_4,_TransmittString
	FNCALL	_Mode_4,_LightWithSensController
	FNCALL	_TransmittString,_timerFunction
	FNCALL	_TransmittString,_SetRFMode
	FNCALL	_TransmittString,_RegisterRead
	FNCALL	_TransmittString,_RegisterSet
	FNCALL	_TransmittString,_FindChannel
	FNCALL	_TransmittString,_WriteFIFO
	FNCALL	_TransiverToReceive,_timerFunction
	FNCALL	_TransiverToReceive,_SetRFMode
	FNCALL	_TransiverToReceive,_RegisterRead
	FNCALL	_TransiverToReceive,_RegisterSet
	FNCALL	_TransiverToReceive,_FindChannel
	FNCALL	_Mode_2,_LightWithSensController
	FNCALL	_Mode_0,_LightWithSensController
	FNCALL	_TransiverInit,_RegisterSet
	FNCALL	_TransiverInit,_RegisterRead
	FNCALL	_TransiverInit,_FindChannel
	FNCALL	_TransiverInit,_Blink
	FNCALL	_TransiverInit,_SetRFMode
	FNCALL	_LightWithSensController,_DarknessCheck
	FNCALL	_LightWithSensController,_timerFunction
	FNCALL	_FindChannel,_RegisterSet
	FNCALL	_FindChannel,_RegisterRead
	FNCALL	_FindChannel,_SetRFMode
	FNCALL	_Mode_1,_DarknessCheck
	FNCALL	_DarknessCheck,_AnalogValue
	FNCALL	_SetRFMode,_RegisterRead
	FNCALL	_SetRFMode,_RegisterSet
	FNCALL	_Blink,_DelayDs
	FNCALL	_AnalogValue,_DelayDs
	FNCALL	_ReadFIFO,_ReadSPI
	FNCALL	_RegisterRead,_WriteSPI
	FNCALL	_RegisterRead,_ReadSPI
	FNCALL	_ReadSPI,_WriteSPI
	FNCALL	_WriteFIFO,_WriteSPI
	FNCALL	_strstr,_strlen
	FNCALL	_strstr,_strncmp
	FNCALL	_strstr,_strchr
	FNCALL	_RegisterSet,_WriteSPI
	FNROOT	_main
	FNCALL	_tc_int,i1_OperationMode
	FNCALL	_tc_int,_TimerCounter
	FNCALL	intlevel1,_tc_int
	global	intlevel1
	FNROOT	intlevel1
	global	_intNumberOfBlinks
	global	_bValueFromPot
	global	_chManualDarknessValue
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	59

;initializer for _intNumberOfBlinks
	retlw	058h
	retlw	02h

	line	62

;initializer for _bValueFromPot
	retlw	01h
	line	63

;initializer for _chManualDarknessValue
	retlw	080h
	global	_ChannelP
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
	btfsc	(btemp+1),7
	ljmp	stringcode
	bcf	status,7
	btfsc	(btemp+1),0
	bsf	status,7
	movf	indf,w
	incf fsr
skipnz
incf btemp+1
	return
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	70
_ChannelP:
	retlw	03Fh
	retlw	047h
	retlw	04Fh
	retlw	057h
	retlw	05Fh
	retlw	077h
	retlw	07Eh
	retlw	07Fh
	retlw	086h
	retlw	087h
	retlw	037h
	retlw	067h
	retlw	06Fh
	global	_ChannelR
psect	strings
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	69
_ChannelR:
	retlw	04Fh
	retlw	059h
	retlw	063h
	retlw	06Dh
	retlw	077h
	retlw	095h
	retlw	09Fh
	retlw	09Fh
	retlw	0A9h
	retlw	0A9h
	retlw	045h
	retlw	081h
	retlw	08Bh
	global	_ChannelS
psect	strings
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	71
_ChannelS:
	retlw	018h
	retlw	01Bh
	retlw	01Eh
	retlw	021h
	retlw	024h
	retlw	02Dh
	retlw	07Bh
	retlw	030h
	retlw	07Eh
	retlw	033h
	retlw	015h
	retlw	027h
	retlw	02Ah
	global	_ChannelP
	global	_ChannelR
	global	_ChannelS
	global	_channelFound
	global	_intBlinkCycle
	global	_intDarkCheckIntervall
	global	_intHalfSecondCounter
	global	_intMinuteCounter
	global	_intSecondCounter
	global	_bChannelFound
	global	_bDark
	global	_bTransiverModeReceive
	global	_ReceivedData
	global	_intBlinkCounter
	global	_intClockTimer
	global	_bTimerComplete
	global	_TransmittedString
	global	_ADCON0bits
_ADCON0bits	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_INTCONbits
_INTCONbits	set	11
	global	_PIR1bits
_PIR1bits	set	12
	global	_PORTA
_PORTA	set	5
	global	_PORTAbits
_PORTAbits	set	5
	global	_PORTB
_PORTB	set	6
	global	_PORTBbits
_PORTBbits	set	6
	global	_PORTC
_PORTC	set	7
	global	_PORTCbits
_PORTCbits	set	7
	global	_SSPBUF
_SSPBUF	set	19
	global	_SSPCONbits
_SSPCONbits	set	20
	global	_T1CON
_T1CON	set	16
	global	_T1CONbits
_T1CONbits	set	16
	global	_TMR1H
_TMR1H	set	15
	global	_TMR1L
_TMR1L	set	14
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_RBIF
_RBIF	set	88
	global	_TMR1IF
_TMR1IF	set	96
	global	_TMR1ON
_TMR1ON	set	128
	global	_ADCON1bits
_ADCON1bits	set	159
	global	_IOCBbits
_IOCBbits	set	150
	global	_OPTION_REGbits
_OPTION_REGbits	set	129
	global	_OSCCONbits
_OSCCONbits	set	143
	global	_PIE1bits
_PIE1bits	set	140
	global	_SSPSTATbits
_SSPSTATbits	set	148
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_WPUBbits
_WPUBbits	set	149
	global	_SSPIE
_SSPIE	set	1123
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
	global	_ANSEL
_ANSEL	set	392
	global	_ANSELH
_ANSELH	set	393
	global	_ANSELbits
_ANSELbits	set	392
	global	_EECON1
_EECON1	set	396
	global	_EECON2
_EECON2	set	397
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
	
STR_9:	
	retlw	78	;'N'
	retlw	111	;'o'
	retlw	116	;'t'
	retlw	32	;' '
	retlw	68	;'D'
	retlw	97	;'a'
	retlw	114	;'r'
	retlw	107	;'k'
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	0
psect	strings
	
STR_8:	
	retlw	73	;'I'
	retlw	116	;'t'
	retlw	39	;'''
	retlw	115	;'s'
	retlw	32	;' '
	retlw	68	;'D'
	retlw	97	;'a'
	retlw	114	;'r'
	retlw	107	;'k'
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	0
psect	strings
	
STR_7:	
	retlw	68	;'D'
	retlw	65	;'A'
	retlw	82	;'R'
	retlw	75	;'K'
	retlw	67	;'C'
	retlw	65	;'A'
	retlw	76	;'L'
	retlw	67	;'C'
	retlw	0
psect	strings
	
STR_13:	
	retlw	67	;'C'
	retlw	72	;'H'
	retlw	83	;'S'
	retlw	84	;'T'
	retlw	65	;'A'
	retlw	84	;'T'
	retlw	69	;'E'
	retlw	0
psect	strings
	
STR_1:	
	retlw	78	;'N'
	retlw	49	;'1'
	retlw	66	;'B'
	retlw	76	;'L'
	retlw	73	;'I'
	retlw	78	;'N'
	retlw	75	;'K'
	retlw	0
psect	strings
	
STR_2:	
	retlw	78	;'N'
	retlw	50	;'2'
	retlw	66	;'B'
	retlw	76	;'L'
	retlw	73	;'I'
	retlw	78	;'N'
	retlw	75	;'K'
	retlw	0
psect	strings
	
STR_5:	
	retlw	83	;'S'
	retlw	69	;'E'
	retlw	78	;'N'
	retlw	83	;'S'
	retlw	86	;'V'
	retlw	65	;'A'
	retlw	76	;'L'
	retlw	0
psect	strings
	
STR_10:	
	retlw	83	;'S'
	retlw	84	;'T'
	retlw	65	;'A'
	retlw	84	;'T'
	retlw	69	;'E'
	retlw	63	;'?'
	retlw	0
psect	strings
	
STR_4:	
	retlw	70	;'F'
	retlw	76	;'L'
	retlw	65	;'A'
	retlw	83	;'S'
	retlw	72	;'H'
	retlw	66	;'B'
	retlw	0
psect	strings
	
STR_6:	
	retlw	80	;'P'
	retlw	79	;'O'
	retlw	84	;'T'
	retlw	86	;'V'
	retlw	65	;'A'
	retlw	76	;'L'
	retlw	0
psect	strings
	
STR_3:	
	retlw	70	;'F'
	retlw	76	;'L'
	retlw	65	;'A'
	retlw	83	;'S'
	retlw	72	;'H'
	retlw	76	;'L'
	retlw	0
psect	strings
	
STR_15:	
	retlw	68	;'D'
	retlw	69	;'E'
	retlw	67	;'C'
	retlw	68	;'D'
	retlw	86	;'V'
	retlw	0
psect	strings
	
STR_14:	
	retlw	73	;'I'
	retlw	78	;'N'
	retlw	67	;'C'
	retlw	68	;'D'
	retlw	86	;'V'
	retlw	0
psect	strings
	
STR_16:	
	retlw	82	;'R'
	retlw	77	;'M'
	retlw	68	;'D'
	retlw	86	;'V'
	retlw	0
psect	strings
	
STR_12:	
	retlw	80	;'P'
	retlw	73	;'I'
	retlw	67	;'C'
	retlw	0
psect	strings
	
STR_11:	
	retlw	80	;'P'
	retlw	111	;'o'
	retlw	116	;'t'
	retlw	0
psect	strings
STR_18	equ	STR_2+0
STR_17	equ	STR_1+0
	file	"Bustel Card v10.0 code v1.7.1.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_intBlinkCounter:
       ds      2

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_channelFound:
       ds      2

_intBlinkCycle:
       ds      2

_intDarkCheckIntervall:
       ds      2

_intHalfSecondCounter:
       ds      2

_intMinuteCounter:
       ds      2

_intSecondCounter:
       ds      2

_bChannelFound:
       ds      1

_bDark:
       ds      1

_bTransiverModeReceive:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	59
_intNumberOfBlinks:
       ds      2

psect	dataBANK0
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	62
_bValueFromPot:
       ds      1

psect	dataBANK0
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	63
_chManualDarknessValue:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_intClockTimer:
       ds      10

_bTimerComplete:
       ds      5

_TransmittedString:
       ds      30

psect	bssBANK3,class=BANK3,space=1
global __pbssBANK3
__pbssBANK3:
_ReceivedData:
       ds      40

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+0Fh)
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+02Dh)
	fcall	clear_ram
; Clear objects allocated to BANK3
psect cinit,class=CODE,delta=2
	bsf	status, 7	;select IRP bank2
	movlw	low(__pbssBANK3)
	movwf	fsr
	movlw	low((__pbssBANK3)+028h)
	fcall	clear_ram
; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
	fcall	__pidataBANK0+1		;fetch initializer
	movwf	__pdataBANK0+1&07fh		
	fcall	__pidataBANK0+2		;fetch initializer
	movwf	__pdataBANK0+2&07fh		
	fcall	__pidataBANK0+3		;fetch initializer
	movwf	__pdataBANK0+3&07fh		
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_init
?_init:	; 0 bytes @ 0x0
	global	?_TransiverInit
?_TransiverInit:	; 0 bytes @ 0x0
	global	?_Mode_0
?_Mode_0:	; 0 bytes @ 0x0
	global	?_Mode_1
?_Mode_1:	; 0 bytes @ 0x0
	global	?_Mode_2
?_Mode_2:	; 0 bytes @ 0x0
	global	?_Mode_4
?_Mode_4:	; 0 bytes @ 0x0
	global	?_Mode_5
?_Mode_5:	; 0 bytes @ 0x0
	global	?_TransiverToReceive
?_TransiverToReceive:	; 0 bytes @ 0x0
	global	?_TransiverReadFIFO
?_TransiverReadFIFO:	; 0 bytes @ 0x0
	global	?_SetRFMode
?_SetRFMode:	; 0 bytes @ 0x0
	global	?_TransmittedDataHandler
?_TransmittedDataHandler:	; 0 bytes @ 0x0
	global	?_DarknessCheck
?_DarknessCheck:	; 0 bytes @ 0x0
	global	?_WriteFIFO
?_WriteFIFO:	; 0 bytes @ 0x0
	global	?_LightWithSensController
?_LightWithSensController:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_TimerCounter
?_TimerCounter:	; 0 bytes @ 0x0
	global	??_TimerCounter
??_TimerCounter:	; 0 bytes @ 0x0
	global	?_WriteSPI
?_WriteSPI:	; 0 bytes @ 0x0
	global	?_tc_int
?_tc_int:	; 0 bytes @ 0x0
	global	??i1_OperationMode
??i1_OperationMode:	; 0 bytes @ 0x0
	global	?_OperationMode
?_OperationMode:	; 1 bytes @ 0x0
	global	?_RegisterRead
?_RegisterRead:	; 1 bytes @ 0x0
	global	?_FindChannel
?_FindChannel:	; 1 bytes @ 0x0
	global	?_ReadFIFO
?_ReadFIFO:	; 1 bytes @ 0x0
	global	?_AnalogValue
?_AnalogValue:	; 1 bytes @ 0x0
	global	?_ReadSPI
?_ReadSPI:	; 1 bytes @ 0x0
	global	?i1_OperationMode
?i1_OperationMode:	; 1 bytes @ 0x0
	ds	1
	global	i1OperationMode@bracketStatus
i1OperationMode@bracketStatus:	; 1 bytes @ 0x1
	ds	2
	global	TimerCounter@i
TimerCounter@i:	; 2 bytes @ 0x3
	ds	2
	global	??_tc_int
??_tc_int:	; 0 bytes @ 0x5
	ds	7
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_init
??_init:	; 0 bytes @ 0x0
	global	??_OperationMode
??_OperationMode:	; 0 bytes @ 0x0
	global	?_DelayDs
?_DelayDs:	; 0 bytes @ 0x0
	global	??_WriteSPI
??_WriteSPI:	; 0 bytes @ 0x0
	global	?_timerFunction
?_timerFunction:	; 1 bytes @ 0x0
	global	?_strchr
?_strchr:	; 1 bytes @ 0x0
	global	?_strlen
?_strlen:	; 2 bytes @ 0x0
	global	timerFunction@intTimerNumber
timerFunction@intTimerNumber:	; 2 bytes @ 0x0
	global	DelayDs@cnt
DelayDs@cnt:	; 2 bytes @ 0x0
	global	strchr@chr
strchr@chr:	; 2 bytes @ 0x0
	ds	1
	global	WriteSPI@buffer
WriteSPI@buffer:	; 1 bytes @ 0x1
	global	OperationMode@bracketStatus
OperationMode@bracketStatus:	; 1 bytes @ 0x1
	ds	1
	global	??_DelayDs
??_DelayDs:	; 0 bytes @ 0x2
	global	??_strlen
??_strlen:	; 0 bytes @ 0x2
	global	??_strchr
??_strchr:	; 0 bytes @ 0x2
	global	WriteSPI@databyte
WriteSPI@databyte:	; 1 bytes @ 0x2
	global	strchr@ptr
strchr@ptr:	; 1 bytes @ 0x2
	global	timerFunction@intSetSeconds
timerFunction@intSetSeconds:	; 2 bytes @ 0x2
	ds	1
	global	?_RegisterSet
?_RegisterSet:	; 0 bytes @ 0x3
	global	??_ReadFIFO
??_ReadFIFO:	; 0 bytes @ 0x3
	global	??_WriteFIFO
??_WriteFIFO:	; 0 bytes @ 0x3
	global	??_ReadSPI
??_ReadSPI:	; 0 bytes @ 0x3
	global	RegisterSet@value
RegisterSet@value:	; 1 bytes @ 0x3
	global	WriteFIFO@Data
WriteFIFO@Data:	; 1 bytes @ 0x3
	ds	1
	global	??_timerFunction
??_timerFunction:	; 0 bytes @ 0x4
	global	??_RegisterSet
??_RegisterSet:	; 0 bytes @ 0x4
	global	ReadFIFO@value
ReadFIFO@value:	; 1 bytes @ 0x4
	global	DelayDs@i
DelayDs@i:	; 2 bytes @ 0x4
	ds	2
	global	??_AnalogValue
??_AnalogValue:	; 0 bytes @ 0x6
	global	?_Blink
?_Blink:	; 0 bytes @ 0x6
	global	RegisterSet@adress
RegisterSet@adress:	; 1 bytes @ 0x6
	global	Blink@n
Blink@n:	; 2 bytes @ 0x6
	ds	1
	global	??_RegisterRead
??_RegisterRead:	; 0 bytes @ 0x7
	global	AnalogValue@channel
AnalogValue@channel:	; 1 bytes @ 0x7
	ds	1
	global	??_DarknessCheck
??_DarknessCheck:	; 0 bytes @ 0x8
	global	??_Blink
??_Blink:	; 0 bytes @ 0x8
	global	strlen@s
strlen@s:	; 1 bytes @ 0x8
	ds	1
	global	RegisterRead@value
RegisterRead@value:	; 1 bytes @ 0x9
	global	DarknessCheck@darknessValue
DarknessCheck@darknessValue:	; 1 bytes @ 0x9
	global	strlen@cp
strlen@cp:	; 1 bytes @ 0x9
	global	Blink@i
Blink@i:	; 2 bytes @ 0x9
	ds	1
	global	??_Mode_0
??_Mode_0:	; 0 bytes @ 0xA
	global	??_Mode_1
??_Mode_1:	; 0 bytes @ 0xA
	global	??_Mode_2
??_Mode_2:	; 0 bytes @ 0xA
	global	??_LightWithSensController
??_LightWithSensController:	; 0 bytes @ 0xA
	global	?_strncmp
?_strncmp:	; 2 bytes @ 0xA
	global	RegisterRead@adress
RegisterRead@adress:	; 1 bytes @ 0xA
	global	strncmp@s2
strncmp@s2:	; 1 bytes @ 0xA
	ds	1
	global	??_SetRFMode
??_SetRFMode:	; 0 bytes @ 0xB
	global	strncmp@len
strncmp@len:	; 2 bytes @ 0xB
	ds	1
	global	SetRFMode@mode
SetRFMode@mode:	; 1 bytes @ 0xC
	ds	1
	global	??_strncmp
??_strncmp:	; 0 bytes @ 0xD
	global	SetRFMode@mcparam0_read
SetRFMode@mcparam0_read:	; 1 bytes @ 0xD
	ds	1
	global	??_FindChannel
??_FindChannel:	; 0 bytes @ 0xE
	ds	1
	global	strncmp@s1
strncmp@s1:	; 1 bytes @ 0xF
	ds	1
	global	?_strstr
?_strstr:	; 1 bytes @ 0x10
	global	strstr@s2
strstr@s2:	; 1 bytes @ 0x10
	ds	1
	global	??_strstr
??_strstr:	; 0 bytes @ 0x11
	global	FindChannel@cnt
FindChannel@cnt:	; 2 bytes @ 0x11
	ds	2
	global	FindChannel@i
FindChannel@i:	; 2 bytes @ 0x13
	ds	1
	global	strstr@s1
strstr@s1:	; 1 bytes @ 0x14
	ds	1
	global	??_TransiverInit
??_TransiverInit:	; 0 bytes @ 0x15
	global	??_TransiverToReceive
??_TransiverToReceive:	; 0 bytes @ 0x15
	global	?_TransmittString
?_TransmittString:	; 0 bytes @ 0x15
	global	TransmittString@dataString
TransmittString@dataString:	; 2 bytes @ 0x15
	ds	2
	global	??_TransmittString
??_TransmittString:	; 0 bytes @ 0x17
	ds	2
	global	TransmittString@i
TransmittString@i:	; 2 bytes @ 0x19
	ds	2
	global	??_Mode_4
??_Mode_4:	; 0 bytes @ 0x1B
	global	??_Mode_5
??_Mode_5:	; 0 bytes @ 0x1B
	global	??_TransmittedDataHandler
??_TransmittedDataHandler:	; 0 bytes @ 0x1B
	ds	1
	global	TransmittedDataHandler@slask
TransmittedDataHandler@slask:	; 8 bytes @ 0x1C
	ds	8
	global	TransmittedDataHandler@slask_1866
TransmittedDataHandler@slask_1866:	; 8 bytes @ 0x24
	ds	8
	global	TransmittedDataHandler@slask_1877
TransmittedDataHandler@slask_1877:	; 8 bytes @ 0x2C
	ds	8
	global	??_TransiverReadFIFO
??_TransiverReadFIFO:	; 0 bytes @ 0x34
	ds	2
	global	TransiverReadFIFO@i
TransiverReadFIFO@i:	; 2 bytes @ 0x36
	ds	2
	global	TransiverReadFIFO@j
TransiverReadFIFO@j:	; 2 bytes @ 0x38
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x3A
	ds	3
;;Data sizes: Strings 122, constant 39, data 4, bss 102, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     12      14
;; BANK0           80     61      80
;; BANK1           80      0      45
;; BANK3           96      0      40
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?_strchr	PTR unsigned char  size(1) Largest target is 30
;;		 -> NULL(NULL[0]), TransmittedString(BANK1[30]), 
;;
;; ?_strncmp	int  size(1) Largest target is 0
;;
;; ?_strlen	unsigned int  size(1) Largest target is 9
;;		 -> STR_16(CODE[5]), STR_15(CODE[6]), STR_14(CODE[6]), STR_13(CODE[8]), 
;;		 -> STR_10(CODE[7]), STR_7(CODE[9]), STR_6(CODE[7]), STR_5(CODE[8]), 
;;		 -> STR_4(CODE[7]), STR_3(CODE[7]), STR_2(CODE[8]), STR_1(CODE[8]), 
;;
;; ?_strstr	PTR unsigned char  size(1) Largest target is 30
;;		 -> NULL(NULL[0]), TransmittedString(BANK1[30]), 
;;
;; strncmp@s2	PTR const unsigned char  size(1) Largest target is 9
;;		 -> STR_16(CODE[5]), STR_15(CODE[6]), STR_14(CODE[6]), STR_13(CODE[8]), 
;;		 -> STR_10(CODE[7]), STR_7(CODE[9]), STR_6(CODE[7]), STR_5(CODE[8]), 
;;		 -> STR_4(CODE[7]), STR_3(CODE[7]), STR_2(CODE[8]), STR_1(CODE[8]), 
;;
;; strncmp@s1	PTR const unsigned char  size(1) Largest target is 30
;;		 -> NULL(NULL[0]), TransmittedString(BANK1[30]), 
;;
;; strlen@s	PTR const unsigned char  size(1) Largest target is 9
;;		 -> STR_16(CODE[5]), STR_15(CODE[6]), STR_14(CODE[6]), STR_13(CODE[8]), 
;;		 -> STR_10(CODE[7]), STR_7(CODE[9]), STR_6(CODE[7]), STR_5(CODE[8]), 
;;		 -> STR_4(CODE[7]), STR_3(CODE[7]), STR_2(CODE[8]), STR_1(CODE[8]), 
;;
;; strlen@cp	PTR const unsigned char  size(1) Largest target is 9
;;		 -> STR_16(CODE[5]), STR_15(CODE[6]), STR_14(CODE[6]), STR_13(CODE[8]), 
;;		 -> STR_10(CODE[7]), STR_7(CODE[9]), STR_6(CODE[7]), STR_5(CODE[8]), 
;;		 -> STR_4(CODE[7]), STR_3(CODE[7]), STR_2(CODE[8]), STR_1(CODE[8]), 
;;
;; strchr@ptr	PTR const unsigned char  size(1) Largest target is 30
;;		 -> NULL(NULL[0]), TransmittedString(BANK1[30]), 
;;
;; sp__strchr	PTR unsigned char  size(1) Largest target is 30
;;		 -> NULL(NULL[0]), TransmittedString(BANK1[30]), 
;;
;; strstr@s2	PTR const unsigned char  size(1) Largest target is 9
;;		 -> STR_16(CODE[5]), STR_15(CODE[6]), STR_14(CODE[6]), STR_13(CODE[8]), 
;;		 -> STR_10(CODE[7]), STR_7(CODE[9]), STR_6(CODE[7]), STR_5(CODE[8]), 
;;		 -> STR_4(CODE[7]), STR_3(CODE[7]), STR_2(CODE[8]), STR_1(CODE[8]), 
;;
;; strstr@s1	PTR const unsigned char  size(1) Largest target is 30
;;		 -> NULL(NULL[0]), TransmittedString(BANK1[30]), 
;;
;; TransmittString@dataString	PTR unsigned char  size(2) Largest target is 14
;;		 -> STR_18(CODE[8]), STR_17(CODE[8]), TransmittedDataHandler@slask_1877(BANK0[8]), STR_12(CODE[4]), 
;;		 -> STR_11(CODE[4]), STR_9(CODE[14]), STR_8(CODE[14]), TransmittedDataHandler@slask_1866(BANK0[8]), 
;;		 -> TransmittedDataHandler@slask(BANK0[8]), 
;;
;; sp__strstr	PTR unsigned char  size(1) Largest target is 30
;;		 -> NULL(NULL[0]), TransmittedString(BANK1[30]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _tc_int in COMMON
;;
;;   _tc_int->_TimerCounter
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_TransiverReadFIFO
;;   _TransiverReadFIFO->_TransmittedDataHandler
;;   _TransmittedDataHandler->_TransmittString
;;   _Mode_5->_TransmittString
;;   _Mode_4->_TransmittString
;;   _TransmittString->_FindChannel
;;   _TransiverToReceive->_FindChannel
;;   _TransiverInit->_FindChannel
;;   _LightWithSensController->_DarknessCheck
;;   _FindChannel->_SetRFMode
;;   _Mode_1->_DarknessCheck
;;   _DarknessCheck->_AnalogValue
;;   _SetRFMode->_RegisterRead
;;   _Blink->_DelayDs
;;   _AnalogValue->_DelayDs
;;   _RegisterRead->_RegisterSet
;;   _ReadSPI->_WriteSPI
;;   _WriteFIFO->_WriteSPI
;;   _strstr->_strncmp
;;   _RegisterSet->_WriteSPI
;;   _strncmp->_strlen
;;
;; Critical Paths under _tc_int in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _tc_int in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _tc_int in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _tc_int in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 3     3      0    9376
;;                                             58 BANK0      3     3      0
;;                               _init
;;                      _TransiverInit
;;                      _OperationMode
;;                             _Mode_0
;;                             _Mode_1
;;                             _Mode_2
;;                             _Mode_4
;;                             _Mode_5
;;                 _TransiverToReceive
;;                  _TransiverReadFIFO
;; ---------------------------------------------------------------------------------
;; (1) _TransiverReadFIFO                                    6     6      0    2841
;;                                             52 BANK0      6     6      0
;;                      _timerFunction
;;                          _SetRFMode
;;                           _ReadFIFO
;;             _TransmittedDataHandler
;; ---------------------------------------------------------------------------------
;; (2) _TransmittedDataHandler                              25    25      0    2300
;;                                             27 BANK0     25    25      0
;;                             _strstr
;;                      _OperationMode
;;                            _DelayDs
;;                        _AnalogValue
;;                    _TransmittString
;;                      _DarknessCheck
;; ---------------------------------------------------------------------------------
;; (1) _Mode_5                                               0     0      0    1666
;;                    _TransmittString
;;            _LightWithSensController
;; ---------------------------------------------------------------------------------
;; (1) _Mode_4                                               0     0      0    1666
;;                    _TransmittString
;;            _LightWithSensController
;; ---------------------------------------------------------------------------------
;; (3) _TransmittString                                      6     4      2    1508
;;                                             21 BANK0      6     4      2
;;                      _timerFunction
;;                          _SetRFMode
;;                       _RegisterRead
;;                        _RegisterSet
;;                        _FindChannel
;;                          _WriteFIFO
;; ---------------------------------------------------------------------------------
;; (1) _TransiverToReceive                                   2     2      0    1373
;;                                             21 BANK0      2     2      0
;;                      _timerFunction
;;                          _SetRFMode
;;                       _RegisterRead
;;                        _RegisterSet
;;                        _FindChannel
;; ---------------------------------------------------------------------------------
;; (1) _Mode_2                                               0     0      0     158
;;            _LightWithSensController
;; ---------------------------------------------------------------------------------
;; (1) _Mode_0                                               0     0      0     158
;;            _LightWithSensController
;; ---------------------------------------------------------------------------------
;; (1) _TransiverInit                                        1     1      0    1399
;;                                             21 BANK0      1     1      0
;;                        _RegisterSet
;;                       _RegisterRead
;;                        _FindChannel
;;                              _Blink
;;                          _SetRFMode
;; ---------------------------------------------------------------------------------
;; (2) _LightWithSensController                              0     0      0     158
;;                      _DarknessCheck
;;                      _timerFunction
;; ---------------------------------------------------------------------------------
;; (4) _FindChannel                                          7     7      0     766
;;                                             14 BANK0      7     7      0
;;                        _RegisterSet
;;                       _RegisterRead
;;                          _SetRFMode
;; ---------------------------------------------------------------------------------
;; (1) _Mode_1                                               0     0      0      92
;;                      _DarknessCheck
;; ---------------------------------------------------------------------------------
;; (3) _DarknessCheck                                        2     2      0      92
;;                                              8 BANK0      2     2      0
;;                        _AnalogValue
;; ---------------------------------------------------------------------------------
;; (5) _SetRFMode                                            3     3      0     337
;;                                             11 BANK0      3     3      0
;;                       _RegisterRead
;;                        _RegisterSet
;; ---------------------------------------------------------------------------------
;; (2) _Blink                                                5     3      2      92
;;                                              6 BANK0      5     3      2
;;                            _DelayDs
;; ---------------------------------------------------------------------------------
;; (4) _AnalogValue                                          2     2      0      68
;;                                              6 BANK0      2     2      0
;;                            _DelayDs
;; ---------------------------------------------------------------------------------
;; (2) _ReadFIFO                                             2     2      0      46
;;                                              3 BANK0      2     2      0
;;                            _ReadSPI
;; ---------------------------------------------------------------------------------
;; (6) _RegisterRead                                         4     4      0     114
;;                                              7 BANK0      4     4      0
;;                           _WriteSPI
;;                            _ReadSPI
;;                        _RegisterSet (ARG)
;; ---------------------------------------------------------------------------------
;; (7) _ReadSPI                                              0     0      0      23
;;                           _WriteSPI
;; ---------------------------------------------------------------------------------
;; (4) _WriteFIFO                                            1     1      0      45
;;                                              3 BANK0      1     1      0
;;                           _WriteSPI
;; ---------------------------------------------------------------------------------
;; (5) _DelayDs                                              6     4      2      46
;;                                              0 BANK0      6     4      2
;; ---------------------------------------------------------------------------------
;; (3) _strstr                                               5     4      1     488
;;                                             16 BANK0      5     4      1
;;                             _strlen
;;                            _strncmp
;;                             _strchr
;; ---------------------------------------------------------------------------------
;; (6) _RegisterSet                                          4     3      1      90
;;                                              3 BANK0      4     3      1
;;                           _WriteSPI
;;                            _ReadSPI (ARG)
;; ---------------------------------------------------------------------------------
;; (4) _strchr                                               3     1      2      88
;;                                              0 BANK0      3     1      2
;; ---------------------------------------------------------------------------------
;; (4) _strncmp                                              6     3      3     134
;;                                             10 BANK0      6     3      3
;;                             _strlen (ARG)
;; ---------------------------------------------------------------------------------
;; (4) _strlen                                              10     8      2      89
;;                                              0 BANK0     10     8      2
;; ---------------------------------------------------------------------------------
;; (5) _WriteSPI                                             3     3      0      23
;;                                              0 BANK0      3     3      0
;; ---------------------------------------------------------------------------------
;; (4) _timerFunction                                        5     1      4      66
;;                                              0 BANK0      5     1      4
;; ---------------------------------------------------------------------------------
;; (3) _OperationMode                                        2     2      0      23
;;                                              0 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _init                                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 7
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (9) _tc_int                                               7     7      0     187
;;                                              5 COMMON     7     7      0
;;                    i1_OperationMode
;;                       _TimerCounter
;; ---------------------------------------------------------------------------------
;; (10) i1_OperationMode                                     2     2      0      75
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (10) _TimerCounter                                        5     5      0     112
;;                                              0 COMMON     5     5      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 10
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _init
;;   _TransiverInit
;;     _RegisterSet
;;       _WriteSPI
;;       _ReadSPI (ARG)
;;         _WriteSPI
;;     _RegisterRead
;;       _WriteSPI
;;       _ReadSPI
;;         _WriteSPI
;;       _RegisterSet (ARG)
;;         _WriteSPI
;;         _ReadSPI (ARG)
;;           _WriteSPI
;;     _FindChannel
;;       _RegisterSet
;;         _WriteSPI
;;         _ReadSPI (ARG)
;;           _WriteSPI
;;       _RegisterRead
;;         _WriteSPI
;;         _ReadSPI
;;           _WriteSPI
;;         _RegisterSet (ARG)
;;           _WriteSPI
;;           _ReadSPI (ARG)
;;             _WriteSPI
;;       _SetRFMode
;;         _RegisterRead
;;           _WriteSPI
;;           _ReadSPI
;;             _WriteSPI
;;           _RegisterSet (ARG)
;;             _WriteSPI
;;             _ReadSPI (ARG)
;;               _WriteSPI
;;         _RegisterSet
;;           _WriteSPI
;;           _ReadSPI (ARG)
;;             _WriteSPI
;;     _Blink
;;       _DelayDs
;;     _SetRFMode
;;       _RegisterRead
;;         _WriteSPI
;;         _ReadSPI
;;           _WriteSPI
;;         _RegisterSet (ARG)
;;           _WriteSPI
;;           _ReadSPI (ARG)
;;             _WriteSPI
;;       _RegisterSet
;;         _WriteSPI
;;         _ReadSPI (ARG)
;;           _WriteSPI
;;   _OperationMode
;;   _Mode_0
;;     _LightWithSensController
;;       _DarknessCheck
;;         _AnalogValue
;;           _DelayDs
;;       _timerFunction
;;   _Mode_1
;;     _DarknessCheck
;;       _AnalogValue
;;         _DelayDs
;;   _Mode_2
;;     _LightWithSensController
;;       _DarknessCheck
;;         _AnalogValue
;;           _DelayDs
;;       _timerFunction
;;   _Mode_4
;;     _TransmittString
;;       _timerFunction
;;       _SetRFMode
;;         _RegisterRead
;;           _WriteSPI
;;           _ReadSPI
;;             _WriteSPI
;;           _RegisterSet (ARG)
;;             _WriteSPI
;;             _ReadSPI (ARG)
;;               _WriteSPI
;;         _RegisterSet
;;           _WriteSPI
;;           _ReadSPI (ARG)
;;             _WriteSPI
;;       _RegisterRead
;;         _WriteSPI
;;         _ReadSPI
;;           _WriteSPI
;;         _RegisterSet (ARG)
;;           _WriteSPI
;;           _ReadSPI (ARG)
;;             _WriteSPI
;;       _RegisterSet
;;         _WriteSPI
;;         _ReadSPI (ARG)
;;           _WriteSPI
;;       _FindChannel
;;         _RegisterSet
;;           _WriteSPI
;;           _ReadSPI (ARG)
;;             _WriteSPI
;;         _RegisterRead
;;           _WriteSPI
;;           _ReadSPI
;;             _WriteSPI
;;           _RegisterSet (ARG)
;;             _WriteSPI
;;             _ReadSPI (ARG)
;;               _WriteSPI
;;         _SetRFMode
;;           _RegisterRead
;;             _WriteSPI
;;             _ReadSPI
;;               _WriteSPI
;;             _RegisterSet (ARG)
;;               _WriteSPI
;;               _ReadSPI (ARG)
;;                 _WriteSPI
;;           _RegisterSet
;;             _WriteSPI
;;             _ReadSPI (ARG)
;;               _WriteSPI
;;       _WriteFIFO
;;         _WriteSPI
;;     _LightWithSensController
;;       _DarknessCheck
;;         _AnalogValue
;;           _DelayDs
;;       _timerFunction
;;   _Mode_5
;;     _TransmittString
;;       _timerFunction
;;       _SetRFMode
;;         _RegisterRead
;;           _WriteSPI
;;           _ReadSPI
;;             _WriteSPI
;;           _RegisterSet (ARG)
;;             _WriteSPI
;;             _ReadSPI (ARG)
;;               _WriteSPI
;;         _RegisterSet
;;           _WriteSPI
;;           _ReadSPI (ARG)
;;             _WriteSPI
;;       _RegisterRead
;;         _WriteSPI
;;         _ReadSPI
;;           _WriteSPI
;;         _RegisterSet (ARG)
;;           _WriteSPI
;;           _ReadSPI (ARG)
;;             _WriteSPI
;;       _RegisterSet
;;         _WriteSPI
;;         _ReadSPI (ARG)
;;           _WriteSPI
;;       _FindChannel
;;         _RegisterSet
;;           _WriteSPI
;;           _ReadSPI (ARG)
;;             _WriteSPI
;;         _RegisterRead
;;           _WriteSPI
;;           _ReadSPI
;;             _WriteSPI
;;           _RegisterSet (ARG)
;;             _WriteSPI
;;             _ReadSPI (ARG)
;;               _WriteSPI
;;         _SetRFMode
;;           _RegisterRead
;;             _WriteSPI
;;             _ReadSPI
;;               _WriteSPI
;;             _RegisterSet (ARG)
;;               _WriteSPI
;;               _ReadSPI (ARG)
;;                 _WriteSPI
;;           _RegisterSet
;;             _WriteSPI
;;             _ReadSPI (ARG)
;;               _WriteSPI
;;       _WriteFIFO
;;         _WriteSPI
;;     _LightWithSensController
;;       _DarknessCheck
;;         _AnalogValue
;;           _DelayDs
;;       _timerFunction
;;   _TransiverToReceive
;;     _timerFunction
;;     _SetRFMode
;;       _RegisterRead
;;         _WriteSPI
;;         _ReadSPI
;;           _WriteSPI
;;         _RegisterSet (ARG)
;;           _WriteSPI
;;           _ReadSPI (ARG)
;;             _WriteSPI
;;       _RegisterSet
;;         _WriteSPI
;;         _ReadSPI (ARG)
;;           _WriteSPI
;;     _RegisterRead
;;       _WriteSPI
;;       _ReadSPI
;;         _WriteSPI
;;       _RegisterSet (ARG)
;;         _WriteSPI
;;         _ReadSPI (ARG)
;;           _WriteSPI
;;     _RegisterSet
;;       _WriteSPI
;;       _ReadSPI (ARG)
;;         _WriteSPI
;;     _FindChannel
;;       _RegisterSet
;;         _WriteSPI
;;         _ReadSPI (ARG)
;;           _WriteSPI
;;       _RegisterRead
;;         _WriteSPI
;;         _ReadSPI
;;           _WriteSPI
;;         _RegisterSet (ARG)
;;           _WriteSPI
;;           _ReadSPI (ARG)
;;             _WriteSPI
;;       _SetRFMode
;;         _RegisterRead
;;           _WriteSPI
;;           _ReadSPI
;;             _WriteSPI
;;           _RegisterSet (ARG)
;;             _WriteSPI
;;             _ReadSPI (ARG)
;;               _WriteSPI
;;         _RegisterSet
;;           _WriteSPI
;;           _ReadSPI (ARG)
;;             _WriteSPI
;;   _TransiverReadFIFO
;;     _timerFunction
;;     _SetRFMode
;;       _RegisterRead
;;         _WriteSPI
;;         _ReadSPI
;;           _WriteSPI
;;         _RegisterSet (ARG)
;;           _WriteSPI
;;           _ReadSPI (ARG)
;;             _WriteSPI
;;       _RegisterSet
;;         _WriteSPI
;;         _ReadSPI (ARG)
;;           _WriteSPI
;;     _ReadFIFO
;;       _ReadSPI
;;         _WriteSPI
;;     _TransmittedDataHandler
;;       _strstr
;;         _strlen
;;         _strncmp
;;           _strlen (ARG)
;;         _strchr
;;       _OperationMode
;;       _DelayDs
;;       _AnalogValue
;;         _DelayDs
;;       _TransmittString
;;         _timerFunction
;;         _SetRFMode
;;           _RegisterRead
;;             _WriteSPI
;;             _ReadSPI
;;               _WriteSPI
;;             _RegisterSet (ARG)
;;               _WriteSPI
;;               _ReadSPI (ARG)
;;                 _WriteSPI
;;           _RegisterSet
;;             _WriteSPI
;;             _ReadSPI (ARG)
;;               _WriteSPI
;;         _RegisterRead
;;           _WriteSPI
;;           _ReadSPI
;;             _WriteSPI
;;           _RegisterSet (ARG)
;;             _WriteSPI
;;             _ReadSPI (ARG)
;;               _WriteSPI
;;         _RegisterSet
;;           _WriteSPI
;;           _ReadSPI (ARG)
;;             _WriteSPI
;;         _FindChannel
;;           _RegisterSet
;;             _WriteSPI
;;             _ReadSPI (ARG)
;;               _WriteSPI
;;           _RegisterRead
;;             _WriteSPI
;;             _ReadSPI
;;               _WriteSPI
;;             _RegisterSet (ARG)
;;               _WriteSPI
;;               _ReadSPI (ARG)
;;                 _WriteSPI
;;           _SetRFMode
;;             _RegisterRead
;;               _WriteSPI
;;               _ReadSPI
;;                 _WriteSPI
;;               _RegisterSet (ARG)
;;                 _WriteSPI
;;                 _ReadSPI (ARG)
;;                   _WriteSPI
;;             _RegisterSet
;;               _WriteSPI
;;               _ReadSPI (ARG)
;;                 _WriteSPI
;;         _WriteFIFO
;;           _WriteSPI
;;       _DarknessCheck
;;         _AnalogValue
;;           _DelayDs
;;
;; _tc_int (ROOT)
;;   i1_OperationMode
;;   _TimerCounter
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0      28       9       41.7%
;;BITBANK3            60      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      11        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0      2D       7       56.3%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      BF      12        0.0%
;;ABS                  0      0      B3       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       C       2        0.0%
;;BANK0               50     3D      50       5      100.0%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      C       E       1      100.0%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 117 in file "C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels required when called:   10
;; This function calls:
;;		_init
;;		_TransiverInit
;;		_OperationMode
;;		_Mode_0
;;		_Mode_1
;;		_Mode_2
;;		_Mode_4
;;		_Mode_5
;;		_TransiverToReceive
;;		_TransiverReadFIFO
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	117
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	119
	
l4768:	
;Main Card V10.0.c: 119: init();
	fcall	_init
	line	120
	
l4770:	
;Main Card V10.0.c: 120: _delay((unsigned long)((800)*(4000000/4000.0)));
	opt asmopt_off
movlw  5
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	15
movwf	((??_main+0)+0+1),f
	movlw	244
movwf	((??_main+0)+0),f
u4027:
	decfsz	((??_main+0)+0),f
	goto	u4027
	decfsz	((??_main+0)+0+1),f
	goto	u4027
	decfsz	((??_main+0)+0+2),f
	goto	u4027
opt asmopt_on

	line	121
	
l4772:	
;Main Card V10.0.c: 121: TransiverInit();
	fcall	_TransiverInit
	goto	l4774
	line	123
;Main Card V10.0.c: 123: while(1)
	
l1059:	
	line	125
	
l4774:	
;Main Card V10.0.c: 124: {
;Main Card V10.0.c: 125: if(OperationMode() == 0)
	fcall	_OperationMode
	iorlw	0
	skipz
	goto	u3941
	goto	u3940
u3941:
	goto	l4778
u3940:
	line	127
	
l4776:	
;Main Card V10.0.c: 126: {
;Main Card V10.0.c: 127: Mode_0();
	fcall	_Mode_0
	goto	l4778
	line	128
	
l1060:	
	line	129
	
l4778:	
;Main Card V10.0.c: 128: }
;Main Card V10.0.c: 129: if(OperationMode() == 1)
	fcall	_OperationMode
	xorlw	01h
	skipz
	goto	u3951
	goto	u3950
u3951:
	goto	l4782
u3950:
	line	131
	
l4780:	
;Main Card V10.0.c: 130: {
;Main Card V10.0.c: 131: Mode_1();
	fcall	_Mode_1
	goto	l4782
	line	132
	
l1061:	
	line	134
	
l4782:	
;Main Card V10.0.c: 132: }
;Main Card V10.0.c: 134: if(OperationMode() == 2)
	fcall	_OperationMode
	xorlw	02h
	skipz
	goto	u3961
	goto	u3960
u3961:
	goto	l4786
u3960:
	line	136
	
l4784:	
;Main Card V10.0.c: 135: {
;Main Card V10.0.c: 136: Mode_2();
	fcall	_Mode_2
	goto	l4786
	line	137
	
l1062:	
	line	139
	
l4786:	
;Main Card V10.0.c: 137: }
;Main Card V10.0.c: 139: if(OperationMode() == 4)
	fcall	_OperationMode
	xorlw	04h
	skipz
	goto	u3971
	goto	u3970
u3971:
	goto	l4790
u3970:
	line	141
	
l4788:	
;Main Card V10.0.c: 140: {
;Main Card V10.0.c: 141: Mode_4();
	fcall	_Mode_4
	goto	l4790
	line	142
	
l1063:	
	line	144
	
l4790:	
;Main Card V10.0.c: 142: }
;Main Card V10.0.c: 144: if(OperationMode() == 5)
	fcall	_OperationMode
	xorlw	05h
	skipz
	goto	u3981
	goto	u3980
u3981:
	goto	l4794
u3980:
	line	146
	
l4792:	
;Main Card V10.0.c: 145: {
;Main Card V10.0.c: 146: Mode_5();
	fcall	_Mode_5
	goto	l4794
	line	147
	
l1064:	
	line	151
	
l4794:	
;Main Card V10.0.c: 147: }
;Main Card V10.0.c: 151: if(!bTransiverModeReceive)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_bTransiverModeReceive),f
	skipz
	goto	u3991
	goto	u3990
u3991:
	goto	l4798
u3990:
	line	152
	
l4796:	
;Main Card V10.0.c: 152: TransiverToReceive();
	fcall	_TransiverToReceive
	goto	l4798
	
l1065:	
	line	153
	
l4798:	
;Main Card V10.0.c: 153: if(PORTBbits.RB4 && bTransiverModeReceive)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(6),4	;volatile
	goto	u4001
	goto	u4000
u4001:
	goto	l4774
u4000:
	
l4800:	
	movf	(_bTransiverModeReceive),w
	skipz
	goto	u4010
	goto	l4774
u4010:
	line	154
	
l4802:	
;Main Card V10.0.c: 154: TransiverReadFIFO();
	fcall	_TransiverReadFIFO
	goto	l4774
	
l1066:	
	goto	l4774
	line	156
	
l1067:	
	line	123
	goto	l4774
	
l1068:	
	line	158
	
l1069:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_TransiverReadFIFO
psect	text812,local,class=CODE,delta=2
global __ptext812
__ptext812:

;; *************** function _TransiverReadFIFO *****************
;; Defined at:
;;		line 190 in file "C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  j               2   56[BANK0 ] int 
;;  i               2   54[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    9
;; This function calls:
;;		_timerFunction
;;		_SetRFMode
;;		_ReadFIFO
;;		_TransmittedDataHandler
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text812
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	190
	global	__size_of_TransiverReadFIFO
	__size_of_TransiverReadFIFO	equ	__end_of_TransiverReadFIFO-_TransiverReadFIFO
	
_TransiverReadFIFO:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in _TransiverReadFIFO: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	191
	
l4736:	
;Main Card V10.0.c: 191: timerFunction(3, 5);
	movlw	low(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_timerFunction)
	movlw	high(03h)
	movwf	((?_timerFunction))+1
	movlw	low(05h)
	movwf	0+(?_timerFunction)+02h
	movlw	high(05h)
	movwf	(0+(?_timerFunction)+02h)+1
	fcall	_timerFunction
	line	193
;Main Card V10.0.c: 193: SetRFMode(0x20);
	movlw	(020h)
	fcall	_SetRFMode
	line	194
	
l4738:	
;Main Card V10.0.c: 194: bTransiverModeReceive = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_bTransiverModeReceive)
	line	195
	
l4740:	
;Main Card V10.0.c: 195: int i = 0;
	clrf	(TransiverReadFIFO@i)
	clrf	(TransiverReadFIFO@i+1)
	line	196
	
l4742:	
;Main Card V10.0.c: 196: for (int j = 0; j < 30; ++j)
	clrf	(TransiverReadFIFO@j)
	clrf	(TransiverReadFIFO@j+1)
	
l4744:	
	movf	(TransiverReadFIFO@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01Eh))^80h
	subwf	btemp+1,w
	skipz
	goto	u3905
	movlw	low(01Eh)
	subwf	(TransiverReadFIFO@j),w
u3905:

	skipc
	goto	u3901
	goto	u3900
u3901:
	goto	l4748
u3900:
	goto	l4758
	
l4746:	
	goto	l4758
	line	197
	
l1079:	
	line	198
	
l4748:	
;Main Card V10.0.c: 197: {
;Main Card V10.0.c: 198: TransmittedString[j] = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(TransiverReadFIFO@j),w
	addlw	_TransmittedString&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	clrf	indf
	line	196
	
l4750:	
	movlw	low(01h)
	addwf	(TransiverReadFIFO@j),f
	skipnc
	incf	(TransiverReadFIFO@j+1),f
	movlw	high(01h)
	addwf	(TransiverReadFIFO@j+1),f
	
l4752:	
	movf	(TransiverReadFIFO@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01Eh))^80h
	subwf	btemp+1,w
	skipz
	goto	u3915
	movlw	low(01Eh)
	subwf	(TransiverReadFIFO@j),w
u3915:

	skipc
	goto	u3911
	goto	u3910
u3911:
	goto	l4748
u3910:
	goto	l4758
	
l1080:	
	line	200
;Main Card V10.0.c: 199: }
;Main Card V10.0.c: 200: while((PORTBbits.RB3)&&(!bTimerComplete[3]))
	goto	l4758
	
l1082:	
	line	202
	
l4754:	
;Main Card V10.0.c: 201: {
;Main Card V10.0.c: 202: TransmittedString[i] = ReadFIFO();
	fcall	_ReadFIFO
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransiverReadFIFO+0)+0
	movf	(TransiverReadFIFO@i),w
	addlw	_TransmittedString&0ffh
	movwf	fsr0
	movf	(??_TransiverReadFIFO+0)+0,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	line	203
	
l4756:	
;Main Card V10.0.c: 203: i++;
	movlw	low(01h)
	addwf	(TransiverReadFIFO@i),f
	skipnc
	incf	(TransiverReadFIFO@i+1),f
	movlw	high(01h)
	addwf	(TransiverReadFIFO@i+1),f
	goto	l4758
	line	204
	
l1081:	
	line	200
	
l4758:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(6),3	;volatile
	goto	u3921
	goto	u3920
u3921:
	goto	l4762
u3920:
	
l4760:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	0+(_bTimerComplete)^080h+03h,w
	skipz
	goto	u3930
	goto	l4754
u3930:
	goto	l4762
	
l1084:	
	goto	l4762
	
l1085:	
	line	206
	
l4762:	
;Main Card V10.0.c: 204: }
;Main Card V10.0.c: 206: _delay((unsigned long)((10)*(4000000/4000.0)));
	opt asmopt_off
movlw	13
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_TransiverReadFIFO+0)+0+1),f
	movlw	251
movwf	((??_TransiverReadFIFO+0)+0),f
u4037:
	decfsz	((??_TransiverReadFIFO+0)+0),f
	goto	u4037
	decfsz	((??_TransiverReadFIFO+0)+0+1),f
	goto	u4037
	nop2
opt asmopt_on

	line	207
	
l4764:	
;Main Card V10.0.c: 207: SetRFMode(0x00);
	movlw	(0)
	fcall	_SetRFMode
	line	208
	
l4766:	
;Main Card V10.0.c: 208: TransmittedDataHandler();
	fcall	_TransmittedDataHandler
	line	209
	
l1086:	
	return
	opt stack 0
GLOBAL	__end_of_TransiverReadFIFO
	__end_of_TransiverReadFIFO:
;; =============== function _TransiverReadFIFO ends ============

	signat	_TransiverReadFIFO,88
	global	_TransmittedDataHandler
psect	text813,local,class=CODE,delta=2
global __ptext813
__ptext813:

;; *************** function _TransmittedDataHandler *****************
;; Defined at:
;;		line 211 in file "C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  slask           8   44[BANK0 ] unsigned char [8]
;;  slask           8   36[BANK0 ] unsigned char [8]
;;  slask           8   28[BANK0 ] unsigned char [8]
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0      24       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0      25       0       0       0
;;Total ram usage:       25 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    8
;; This function calls:
;;		_strstr
;;		_OperationMode
;;		_DelayDs
;;		_AnalogValue
;;		_TransmittString
;;		_DarknessCheck
;; This function is called by:
;;		_TransiverReadFIFO
;; This function uses a non-reentrant model
;;
psect	text813
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	211
	global	__size_of_TransmittedDataHandler
	__size_of_TransmittedDataHandler	equ	__end_of_TransmittedDataHandler-_TransmittedDataHandler
	
_TransmittedDataHandler:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in _TransmittedDataHandler: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	213
	
l4644:	
;Main Card V10.0.c: 213: if((strstr(TransmittedString, "N1BLINK")) && (OperationMode() == 6))
	movlw	((STR_1-__stringbase))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransmittedDataHandler+0)+0
	movf	(??_TransmittedDataHandler+0)+0,w
	movwf	(?_strstr)
	movlw	(_TransmittedString)&0ffh
	fcall	_strstr
	xorlw	0
	skipnz
	goto	u3731
	goto	u3730
u3731:
	goto	l4654
u3730:
	
l4646:	
	fcall	_OperationMode
	xorlw	06h
	skipz
	goto	u3741
	goto	u3740
u3741:
	goto	l4654
u3740:
	line	215
	
l4648:	
;Main Card V10.0.c: 214: {
;Main Card V10.0.c: 215: intBlinkCycle = 1;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_intBlinkCycle)
	movlw	high(01h)
	movwf	((_intBlinkCycle))+1
	line	216
	
l4650:	
;Main Card V10.0.c: 216: intBlinkCounter = 0;
	clrf	(_intBlinkCounter)
	clrf	(_intBlinkCounter+1)
	line	217
	
l4652:	
;Main Card V10.0.c: 217: DelayDs(100);
	movlw	low(064h)
	movwf	(?_DelayDs)
	movlw	high(064h)
	movwf	((?_DelayDs))+1
	fcall	_DelayDs
	line	218
;Main Card V10.0.c: 218: }
	goto	l1120
	line	219
	
l1089:	
	
l4654:	
;Main Card V10.0.c: 219: else if((strstr(TransmittedString, "N2BLINK")) && (OperationMode() == 7))
	movlw	((STR_2-__stringbase))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransmittedDataHandler+0)+0
	movf	(??_TransmittedDataHandler+0)+0,w
	movwf	(?_strstr)
	movlw	(_TransmittedString)&0ffh
	fcall	_strstr
	xorlw	0
	skipnz
	goto	u3751
	goto	u3750
u3751:
	goto	l4664
u3750:
	
l4656:	
	fcall	_OperationMode
	xorlw	07h
	skipz
	goto	u3761
	goto	u3760
u3761:
	goto	l4664
u3760:
	line	221
	
l4658:	
;Main Card V10.0.c: 220: {
;Main Card V10.0.c: 221: intBlinkCycle = 1;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_intBlinkCycle)
	movlw	high(01h)
	movwf	((_intBlinkCycle))+1
	line	222
	
l4660:	
;Main Card V10.0.c: 222: intBlinkCounter = 0;
	clrf	(_intBlinkCounter)
	clrf	(_intBlinkCounter+1)
	line	223
	
l4662:	
;Main Card V10.0.c: 223: DelayDs(100);
	movlw	low(064h)
	movwf	(?_DelayDs)
	movlw	high(064h)
	movwf	((?_DelayDs))+1
	fcall	_DelayDs
	line	224
;Main Card V10.0.c: 224: }
	goto	l1120
	line	225
	
l1091:	
	
l4664:	
;Main Card V10.0.c: 225: else if((strstr(TransmittedString,"FLASHL")))
	movlw	((STR_3-__stringbase))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransmittedDataHandler+0)+0
	movf	(??_TransmittedDataHandler+0)+0,w
	movwf	(?_strstr)
	movlw	(_TransmittedString)&0ffh
	fcall	_strstr
	xorlw	0
	skipnz
	goto	u3771
	goto	u3770
u3771:
	goto	l4672
u3770:
	line	227
	
l4666:	
;Main Card V10.0.c: 226: {
;Main Card V10.0.c: 227: PORTCbits.RC2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(7),2	;volatile
	line	228
	
l4668:	
;Main Card V10.0.c: 228: DelayDs(10);
	movlw	low(0Ah)
	movwf	(?_DelayDs)
	movlw	high(0Ah)
	movwf	((?_DelayDs))+1
	fcall	_DelayDs
	line	229
	
l4670:	
;Main Card V10.0.c: 229: PORTCbits.RC2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(7),2	;volatile
	line	230
;Main Card V10.0.c: 230: DelayDs(5);
	movlw	low(05h)
	movwf	(?_DelayDs)
	movlw	high(05h)
	movwf	((?_DelayDs))+1
	fcall	_DelayDs
	line	231
;Main Card V10.0.c: 231: }
	goto	l1120
	line	232
	
l1093:	
	
l4672:	
;Main Card V10.0.c: 232: else if((strstr(TransmittedString,"FLASHB")))
	movlw	((STR_4-__stringbase))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransmittedDataHandler+0)+0
	movf	(??_TransmittedDataHandler+0)+0,w
	movwf	(?_strstr)
	movlw	(_TransmittedString)&0ffh
	fcall	_strstr
	xorlw	0
	skipnz
	goto	u3781
	goto	u3780
u3781:
	goto	l4680
u3780:
	line	234
	
l4674:	
;Main Card V10.0.c: 233: {
;Main Card V10.0.c: 234: PORTCbits.RC1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(7),1	;volatile
	line	235
	
l4676:	
;Main Card V10.0.c: 235: DelayDs(10);
	movlw	low(0Ah)
	movwf	(?_DelayDs)
	movlw	high(0Ah)
	movwf	((?_DelayDs))+1
	fcall	_DelayDs
	line	236
	
l4678:	
;Main Card V10.0.c: 236: PORTCbits.RC1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(7),1	;volatile
	line	237
;Main Card V10.0.c: 237: DelayDs(5);
	movlw	low(05h)
	movwf	(?_DelayDs)
	movlw	high(05h)
	movwf	((?_DelayDs))+1
	fcall	_DelayDs
	line	238
;Main Card V10.0.c: 238: }
	goto	l1120
	line	239
	
l1095:	
	
l4680:	
;Main Card V10.0.c: 239: else if((strstr(TransmittedString,"SENSVAL")))
	movlw	((STR_5-__stringbase))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransmittedDataHandler+0)+0
	movf	(??_TransmittedDataHandler+0)+0,w
	movwf	(?_strstr)
	movlw	(_TransmittedString)&0ffh
	fcall	_strstr
	xorlw	0
	skipnz
	goto	u3791
	goto	u3790
u3791:
	goto	l4686
u3790:
	line	242
	
l4682:	
;Main Card V10.0.c: 240: {
;Main Card V10.0.c: 241: unsigned char slask[8];
;Main Card V10.0.c: 242: slask[0] = AnalogValue(0);
	movlw	(0)
	fcall	_AnalogValue
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransmittedDataHandler+0)+0
	movf	(??_TransmittedDataHandler+0)+0,w
	movwf	(TransmittedDataHandler@slask)
	line	243
	
l4684:	
;Main Card V10.0.c: 243: TransmittString(slask);
	movlw	(TransmittedDataHandler@slask&0ffh)
	movwf	(?_TransmittString)
	movlw	(0x0/2)
	movwf	(?_TransmittString+1)
	fcall	_TransmittString
	line	244
;Main Card V10.0.c: 244: }
	goto	l1120
	line	245
	
l1097:	
	
l4686:	
;Main Card V10.0.c: 245: else if((strstr(TransmittedString,"POTVAL")))
	movlw	((STR_6-__stringbase))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransmittedDataHandler+0)+0
	movf	(??_TransmittedDataHandler+0)+0,w
	movwf	(?_strstr)
	movlw	(_TransmittedString)&0ffh
	fcall	_strstr
	xorlw	0
	skipnz
	goto	u3801
	goto	u3800
u3801:
	goto	l4692
u3800:
	line	248
	
l4688:	
;Main Card V10.0.c: 246: {
;Main Card V10.0.c: 247: unsigned char slask[8];
;Main Card V10.0.c: 248: slask[0] = AnalogValue(3);
	movlw	(03h)
	fcall	_AnalogValue
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransmittedDataHandler+0)+0
	movf	(??_TransmittedDataHandler+0)+0,w
	movwf	(TransmittedDataHandler@slask_1866)
	line	249
	
l4690:	
;Main Card V10.0.c: 249: TransmittString(slask);
	movlw	(TransmittedDataHandler@slask_1866&0ffh)
	movwf	(?_TransmittString)
	movlw	(0x0/2)
	movwf	(?_TransmittString+1)
	fcall	_TransmittString
	line	250
;Main Card V10.0.c: 250: }
	goto	l1120
	line	251
	
l1099:	
	
l4692:	
;Main Card V10.0.c: 251: else if((strstr(TransmittedString,"DARKCALC")))
	movlw	((STR_7-__stringbase))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransmittedDataHandler+0)+0
	movf	(??_TransmittedDataHandler+0)+0,w
	movwf	(?_strstr)
	movlw	(_TransmittedString)&0ffh
	fcall	_strstr
	xorlw	0
	skipnz
	goto	u3811
	goto	u3810
u3811:
	goto	l4702
u3810:
	line	253
	
l4694:	
;Main Card V10.0.c: 252: {
;Main Card V10.0.c: 253: DarknessCheck();
	fcall	_DarknessCheck
	line	254
	
l4696:	
;Main Card V10.0.c: 254: if(bDark)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_bDark),w
	skipz
	goto	u3820
	goto	l4700
u3820:
	line	255
	
l4698:	
;Main Card V10.0.c: 255: TransmittString("It's Dark    ");
	movlw	low((STR_8-__stringbase))
	movwf	(?_TransmittString)
	movlw	80h
	movwf	(?_TransmittString+1)
	fcall	_TransmittString
	goto	l1120
	line	256
	
l1102:	
	line	257
	
l4700:	
;Main Card V10.0.c: 256: else
;Main Card V10.0.c: 257: TransmittString("Not Dark     ");
	movlw	low((STR_9-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_TransmittString)
	movlw	80h
	movwf	(?_TransmittString+1)
	fcall	_TransmittString
	goto	l1120
	
l1103:	
	line	258
;Main Card V10.0.c: 258: }
	goto	l1120
	line	259
	
l1101:	
	
l4702:	
;Main Card V10.0.c: 259: else if((strstr(TransmittedString,"STATE?")))
	movlw	((STR_10-__stringbase))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransmittedDataHandler+0)+0
	movf	(??_TransmittedDataHandler+0)+0,w
	movwf	(?_strstr)
	movlw	(_TransmittedString)&0ffh
	fcall	_strstr
	xorlw	0
	skipnz
	goto	u3831
	goto	u3830
u3831:
	goto	l4710
u3830:
	line	261
	
l4704:	
;Main Card V10.0.c: 260: {
;Main Card V10.0.c: 261: if(bValueFromPot == TRUE)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_bValueFromPot),w
	xorlw	01h
	skipz
	goto	u3841
	goto	u3840
u3841:
	goto	l4708
u3840:
	line	262
	
l4706:	
;Main Card V10.0.c: 262: TransmittString("Pot");
	movlw	low((STR_11-__stringbase))
	movwf	(?_TransmittString)
	movlw	80h
	movwf	(?_TransmittString+1)
	fcall	_TransmittString
	goto	l1120
	line	263
	
l1106:	
	line	264
	
l4708:	
;Main Card V10.0.c: 263: else
;Main Card V10.0.c: 264: TransmittString("PIC");
	movlw	low((STR_12-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_TransmittString)
	movlw	80h
	movwf	(?_TransmittString+1)
	fcall	_TransmittString
	goto	l1120
	
l1107:	
	line	266
;Main Card V10.0.c: 266: }
	goto	l1120
	line	267
	
l1105:	
	
l4710:	
;Main Card V10.0.c: 267: else if((strstr(TransmittedString,"CHSTATE")))
	movlw	((STR_13-__stringbase))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransmittedDataHandler+0)+0
	movf	(??_TransmittedDataHandler+0)+0,w
	movwf	(?_strstr)
	movlw	(_TransmittedString)&0ffh
	fcall	_strstr
	xorlw	0
	skipnz
	goto	u3851
	goto	u3850
u3851:
	goto	l4718
u3850:
	line	269
	
l4712:	
;Main Card V10.0.c: 268: {
;Main Card V10.0.c: 269: if(bValueFromPot== TRUE)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_bValueFromPot),w
	xorlw	01h
	skipz
	goto	u3861
	goto	u3860
u3861:
	goto	l4716
u3860:
	line	270
	
l4714:	
;Main Card V10.0.c: 270: bValueFromPot= FALSE;
	clrf	(_bValueFromPot)
	goto	l1120
	line	271
	
l1110:	
	line	272
	
l4716:	
;Main Card V10.0.c: 271: else
;Main Card V10.0.c: 272: bValueFromPot=TRUE;
	clrf	(_bValueFromPot)
	bsf	status,0
	rlf	(_bValueFromPot),f
	goto	l1120
	
l1111:	
	line	273
;Main Card V10.0.c: 273: }
	goto	l1120
	line	275
	
l1109:	
	
l4718:	
;Main Card V10.0.c: 275: else if((strstr(TransmittedString,"INCDV")))
	movlw	((STR_14-__stringbase))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransmittedDataHandler+0)+0
	movf	(??_TransmittedDataHandler+0)+0,w
	movwf	(?_strstr)
	movlw	(_TransmittedString)&0ffh
	fcall	_strstr
	xorlw	0
	skipnz
	goto	u3871
	goto	u3870
u3871:
	goto	l4724
u3870:
	line	277
	
l4720:	
;Main Card V10.0.c: 276: {
;Main Card V10.0.c: 277: if((chManualDarknessValue++) >255)
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransmittedDataHandler+0)+0
	movf	(??_TransmittedDataHandler+0)+0,w
	addwf	(_chManualDarknessValue),f
	goto	l1120
	line	278
	
l4722:	
;Main Card V10.0.c: 278: chManualDarknessValue=255;
	movlw	(0FFh)
	movwf	(??_TransmittedDataHandler+0)+0
	movf	(??_TransmittedDataHandler+0)+0,w
	movwf	(_chManualDarknessValue)
	goto	l1120
	
l1114:	
	line	280
;Main Card V10.0.c: 280: }
	goto	l1120
	line	282
	
l1113:	
	
l4724:	
;Main Card V10.0.c: 282: else if((strstr(TransmittedString,"DECDV")))
	movlw	((STR_15-__stringbase))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransmittedDataHandler+0)+0
	movf	(??_TransmittedDataHandler+0)+0,w
	movwf	(?_strstr)
	movlw	(_TransmittedString)&0ffh
	fcall	_strstr
	xorlw	0
	skipnz
	goto	u3881
	goto	u3880
u3881:
	goto	l4730
u3880:
	line	284
	
l4726:	
;Main Card V10.0.c: 283: {
;Main Card V10.0.c: 284: if((chManualDarknessValue--)<0 )
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_chManualDarknessValue),f
	goto	l1120
	line	285
	
l4728:	
;Main Card V10.0.c: 285: chManualDarknessValue=0;
	clrf	(_chManualDarknessValue)
	goto	l1120
	
l1117:	
	line	287
;Main Card V10.0.c: 287: }
	goto	l1120
	line	289
	
l1116:	
	
l4730:	
;Main Card V10.0.c: 289: else if((strstr(TransmittedString,"RMDV")))
	movlw	((STR_16-__stringbase))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransmittedDataHandler+0)+0
	movf	(??_TransmittedDataHandler+0)+0,w
	movwf	(?_strstr)
	movlw	(_TransmittedString)&0ffh
	fcall	_strstr
	xorlw	0
	skipnz
	goto	u3891
	goto	u3890
u3891:
	goto	l1120
u3890:
	line	292
	
l4732:	
;Main Card V10.0.c: 290: {
;Main Card V10.0.c: 291: unsigned char slask[8];
;Main Card V10.0.c: 292: slask[0] = chManualDarknessValue;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_chManualDarknessValue),w
	movwf	(??_TransmittedDataHandler+0)+0
	movf	(??_TransmittedDataHandler+0)+0,w
	movwf	(TransmittedDataHandler@slask_1877)
	line	293
	
l4734:	
;Main Card V10.0.c: 293: TransmittString(slask);
	movlw	(TransmittedDataHandler@slask_1877&0ffh)
	movwf	(?_TransmittString)
	movlw	(0x0/2)
	movwf	(?_TransmittString+1)
	fcall	_TransmittString
	goto	l1120
	line	295
	
l1119:	
	goto	l1120
	line	296
	
l1118:	
	goto	l1120
	
l1115:	
	goto	l1120
	
l1112:	
	goto	l1120
	
l1108:	
	goto	l1120
	
l1104:	
	goto	l1120
	
l1100:	
	goto	l1120
	
l1098:	
	goto	l1120
	
l1096:	
	goto	l1120
	
l1094:	
	goto	l1120
	
l1092:	
	goto	l1120
	
l1090:	
	
l1120:	
	return
	opt stack 0
GLOBAL	__end_of_TransmittedDataHandler
	__end_of_TransmittedDataHandler:
;; =============== function _TransmittedDataHandler ends ============

	signat	_TransmittedDataHandler,88
	global	_Mode_5
psect	text814,local,class=CODE,delta=2
global __ptext814
__ptext814:

;; *************** function _Mode_5 *****************
;; Defined at:
;;		line 404 in file "C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    8
;; This function calls:
;;		_TransmittString
;;		_LightWithSensController
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text814
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	404
	global	__size_of_Mode_5
	__size_of_Mode_5	equ	__end_of_Mode_5-_Mode_5
	
_Mode_5:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in _Mode_5: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	405
	
l4638:	
;Main Card V10.0.c: 405: if(!PORTBbits.RB5)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(6),5	;volatile
	goto	u3721
	goto	u3720
u3721:
	goto	l4642
u3720:
	line	407
	
l4640:	
;Main Card V10.0.c: 406: {
;Main Card V10.0.c: 407: TransmittString("N2BLINK");
	movlw	low((STR_18-__stringbase))
	movwf	(?_TransmittString)
	movlw	80h
	movwf	(?_TransmittString+1)
	fcall	_TransmittString
	goto	l4642
	line	408
	
l1158:	
	line	409
	
l4642:	
;Main Card V10.0.c: 408: }
;Main Card V10.0.c: 409: LightWithSensController();
	fcall	_LightWithSensController
	line	410
	
l1159:	
	return
	opt stack 0
GLOBAL	__end_of_Mode_5
	__end_of_Mode_5:
;; =============== function _Mode_5 ends ============

	signat	_Mode_5,88
	global	_Mode_4
psect	text815,local,class=CODE,delta=2
global __ptext815
__ptext815:

;; *************** function _Mode_4 *****************
;; Defined at:
;;		line 392 in file "C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    8
;; This function calls:
;;		_TransmittString
;;		_LightWithSensController
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text815
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	392
	global	__size_of_Mode_4
	__size_of_Mode_4	equ	__end_of_Mode_4-_Mode_4
	
_Mode_4:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in _Mode_4: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	393
	
l4632:	
;Main Card V10.0.c: 393: if(!PORTBbits.RB5)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(6),5	;volatile
	goto	u3711
	goto	u3710
u3711:
	goto	l4636
u3710:
	line	395
	
l4634:	
;Main Card V10.0.c: 394: {
;Main Card V10.0.c: 395: TransmittString("N1BLINK");
	movlw	low((STR_17-__stringbase))
	movwf	(?_TransmittString)
	movlw	80h
	movwf	(?_TransmittString+1)
	fcall	_TransmittString
	goto	l4636
	line	396
	
l1154:	
	line	397
	
l4636:	
;Main Card V10.0.c: 396: }
;Main Card V10.0.c: 397: LightWithSensController();
	fcall	_LightWithSensController
	line	398
	
l1155:	
	return
	opt stack 0
GLOBAL	__end_of_Mode_4
	__end_of_Mode_4:
;; =============== function _Mode_4 ends ============

	signat	_Mode_4,88
	global	_TransmittString
psect	text816,local,class=CODE,delta=2
global __ptext816
__ptext816:

;; *************** function _TransmittString *****************
;; Defined at:
;;		line 298 in file "C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
;; Parameters:    Size  Location     Type
;;  dataString      2   21[BANK0 ] PTR unsigned char 
;;		 -> STR_18(8), STR_17(8), TransmittedDataHandler@slask_1877(8), STR_12(4), 
;;		 -> STR_11(4), STR_9(14), STR_8(14), TransmittedDataHandler@slask_1866(8), 
;;		 -> TransmittedDataHandler@slask(8), 
;; Auto vars:     Size  Location     Type
;;  i               2   25[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_timerFunction
;;		_SetRFMode
;;		_RegisterRead
;;		_RegisterSet
;;		_FindChannel
;;		_WriteFIFO
;; This function is called by:
;;		_TransmittedDataHandler
;;		_Mode_4
;;		_Mode_5
;; This function uses a non-reentrant model
;;
psect	text816
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	298
	global	__size_of_TransmittString
	__size_of_TransmittString	equ	__end_of_TransmittString-_TransmittString
	
_TransmittString:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in _TransmittString: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	299
	
l4586:	
;Main Card V10.0.c: 299: timerFunction(4, 5);
	movlw	low(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_timerFunction)
	movlw	high(04h)
	movwf	((?_timerFunction))+1
	movlw	low(05h)
	movwf	0+(?_timerFunction)+02h
	movlw	high(05h)
	movwf	(0+(?_timerFunction)+02h)+1
	fcall	_timerFunction
	line	301
	
l4588:	
;Main Card V10.0.c: 301: int i = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(TransmittString@i)
	clrf	(TransmittString@i+1)
	line	304
	
l4590:	
;Main Card V10.0.c: 304: SetRFMode(0x20);
	movlw	(020h)
	fcall	_SetRFMode
	line	305
	
l4592:	
;Main Card V10.0.c: 305: _delay((unsigned long)((10)*(4000000/4000.0)));
	opt asmopt_off
movlw	13
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_TransmittString+0)+0+1),f
	movlw	251
movwf	((??_TransmittString+0)+0),f
u4047:
	decfsz	((??_TransmittString+0)+0),f
	goto	u4047
	decfsz	((??_TransmittString+0)+0+1),f
	goto	u4047
	nop2
opt asmopt_on

	line	306
	
l4594:	
;Main Card V10.0.c: 306: RegisterSet(0x0E,(RegisterRead(0x0E)|0x02));
	movlw	(0Eh)
	fcall	_RegisterRead
	iorlw	02h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransmittString+0)+0
	movf	(??_TransmittString+0)+0,w
	movwf	(?_RegisterSet)
	movlw	(0Eh)
	fcall	_RegisterSet
	line	307
	
l4596:	
;Main Card V10.0.c: 307: SetRFMode(0x40);
	movlw	(040h)
	fcall	_SetRFMode
	line	308
;Main Card V10.0.c: 308: while((RegisterRead(0x0E) & 0b00000010) == 0)
	goto	l4602
	
l1124:	
	line	310
	
l4598:	
;Main Card V10.0.c: 309: {
;Main Card V10.0.c: 310: if(bTimerComplete[4])
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	0+(_bTimerComplete)^080h+04h,w
	skipz
	goto	u3660
	goto	l4602
u3660:
	line	312
	
l4600:	
;Main Card V10.0.c: 311: {
;Main Card V10.0.c: 312: FindChannel();
	fcall	_FindChannel
	line	313
;Main Card V10.0.c: 313: break;
	goto	l4604
	line	314
	
l1125:	
	goto	l4602
	line	316
	
l1123:	
	line	308
	
l4602:	
	movlw	(0Eh)
	fcall	_RegisterRead
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransmittString+0)+0
	btfss	0+(??_TransmittString+0)+0,(1)&7
	goto	u3671
	goto	u3670
u3671:
	goto	l4598
u3670:
	goto	l4604
	
l1126:	
	line	317
	
l4604:	
;Main Card V10.0.c: 314: }
;Main Card V10.0.c: 316: }
;Main Card V10.0.c: 317: SetRFMode(0x80);
	movlw	(080h)
	fcall	_SetRFMode
	line	318
	
l4606:	
;Main Card V10.0.c: 318: _delay((unsigned long)((500)*(4000000/4000000.0)));
	opt asmopt_off
movlw	166
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	(??_TransmittString+0)+0,f
u4057:
decfsz	(??_TransmittString+0)+0,f
	goto	u4057
	clrwdt
opt asmopt_on

	line	321
	
l4608:	
;Main Card V10.0.c: 321: WriteFIFO('S');
	movlw	(053h)
	fcall	_WriteFIFO
	line	322
	
l4610:	
;Main Card V10.0.c: 322: WriteFIFO('Y');
	movlw	(059h)
	fcall	_WriteFIFO
	line	323
	
l4612:	
;Main Card V10.0.c: 323: WriteFIFO('N');
	movlw	(04Eh)
	fcall	_WriteFIFO
	line	324
	
l4614:	
;Main Card V10.0.c: 324: WriteFIFO('C');
	movlw	(043h)
	fcall	_WriteFIFO
	line	327
;Main Card V10.0.c: 327: while(dataString[i] != 0)
	goto	l4620
	
l1128:	
	line	329
	
l4616:	
;Main Card V10.0.c: 328: {
;Main Card V10.0.c: 329: WriteFIFO(dataString[i]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(TransmittString@i),w
	addwf	(TransmittString@dataString),w
	movwf	fsr0
	movf	(TransmittString@dataString+1),w
	skipnc
	incf	(TransmittString@dataString+1),w
	movwf	btemp+1
	fcall	stringtab
	fcall	_WriteFIFO
	line	330
	
l4618:	
;Main Card V10.0.c: 330: i++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(TransmittString@i),f
	skipnc
	incf	(TransmittString@i+1),f
	movlw	high(01h)
	addwf	(TransmittString@i+1),f
	goto	l4620
	line	331
	
l1127:	
	line	327
	
l4620:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(TransmittString@i),w
	addwf	(TransmittString@dataString),w
	movwf	fsr0
	movf	(TransmittString@dataString+1),w
	skipnc
	incf	(TransmittString@dataString+1),w
	movwf	btemp+1
	fcall	stringtab
	iorlw	0
	skipz
	goto	u3681
	goto	u3680
u3681:
	goto	l4616
u3680:
	goto	l1130
	
l1129:	
	line	334
;Main Card V10.0.c: 331: }
;Main Card V10.0.c: 334: while(!PORTBbits.RB4)
	goto	l1130
	
l1131:	
	line	336
	
l4622:	
;Main Card V10.0.c: 335: {
;Main Card V10.0.c: 336: if(bTimerComplete[4])
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	0+(_bTimerComplete)^080h+04h,w
	skipz
	goto	u3690
	goto	l1130
u3690:
	goto	l4626
	line	337
	
l4624:	
;Main Card V10.0.c: 337: break;
	goto	l4626
	
l1132:	
	line	338
	
l1130:	
	line	334
	bcf	status, 5	;RP0=0, select bank0
	btfss	(6),4	;volatile
	goto	u3701
	goto	u3700
u3701:
	goto	l4622
u3700:
	goto	l4626
	
l1133:	
	line	339
	
l4626:	
;Main Card V10.0.c: 338: }
;Main Card V10.0.c: 339: _delay((unsigned long)((10)*(4000000/4000000.0)));
	opt asmopt_off
movlw	3
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_TransmittString+0)+0,f
u4067:
decfsz	(??_TransmittString+0)+0,f
	goto	u4067
opt asmopt_on

	line	340
	
l4628:	
;Main Card V10.0.c: 340: SetRFMode(0x00);
	movlw	(0)
	fcall	_SetRFMode
	line	341
	
l4630:	
;Main Card V10.0.c: 341: _delay((unsigned long)((1)*(4000000/4000.0)));
	opt asmopt_off
movlw	249
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	(??_TransmittString+0)+0,f
u4077:
	clrwdt
decfsz	(??_TransmittString+0)+0,f
	goto	u4077
	nop2	;nop
	clrwdt
opt asmopt_on

	line	343
	
l1134:	
	return
	opt stack 0
GLOBAL	__end_of_TransmittString
	__end_of_TransmittString:
;; =============== function _TransmittString ends ============

	signat	_TransmittString,4216
	global	_TransiverToReceive
psect	text817,local,class=CODE,delta=2
global __ptext817
__ptext817:

;; *************** function _TransiverToReceive *****************
;; Defined at:
;;		line 164 in file "C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_timerFunction
;;		_SetRFMode
;;		_RegisterRead
;;		_RegisterSet
;;		_FindChannel
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text817
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	164
	global	__size_of_TransiverToReceive
	__size_of_TransiverToReceive	equ	__end_of_TransiverToReceive-_TransiverToReceive
	
_TransiverToReceive:	
	opt	stack 0
; Regs used in _TransiverToReceive: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	165
	
l4566:	
;Main Card V10.0.c: 165: timerFunction(2, 5);
	movlw	low(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_timerFunction)
	movlw	high(02h)
	movwf	((?_timerFunction))+1
	movlw	low(05h)
	movwf	0+(?_timerFunction)+02h
	movlw	high(05h)
	movwf	(0+(?_timerFunction)+02h)+1
	fcall	_timerFunction
	line	169
;Main Card V10.0.c: 169: SetRFMode(0x20);
	movlw	(020h)
	fcall	_SetRFMode
	line	170
	
l4568:	
;Main Card V10.0.c: 170: _delay((unsigned long)((10)*(4000000/4000.0)));
	opt asmopt_off
movlw	13
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_TransiverToReceive+0)+0+1),f
	movlw	251
movwf	((??_TransiverToReceive+0)+0),f
u4087:
	decfsz	((??_TransiverToReceive+0)+0),f
	goto	u4087
	decfsz	((??_TransiverToReceive+0)+0+1),f
	goto	u4087
	nop2
opt asmopt_on

	line	171
	
l4570:	
;Main Card V10.0.c: 171: RegisterSet(0x0E,(RegisterRead(0x0E)|0x02));
	movlw	(0Eh)
	fcall	_RegisterRead
	iorlw	02h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransiverToReceive+0)+0
	movf	(??_TransiverToReceive+0)+0,w
	movwf	(?_RegisterSet)
	movlw	(0Eh)
	fcall	_RegisterSet
	line	172
	
l4572:	
;Main Card V10.0.c: 172: SetRFMode(0x40);
	movlw	(040h)
	fcall	_SetRFMode
	line	173
;Main Card V10.0.c: 173: while((RegisterRead(0x0E) & 0b00000010) == 0)
	goto	l4578
	
l1073:	
	line	175
	
l4574:	
;Main Card V10.0.c: 174: {
;Main Card V10.0.c: 175: if(bTimerComplete[2])
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	0+(_bTimerComplete)^080h+02h,w
	skipz
	goto	u3640
	goto	l4578
u3640:
	line	177
	
l4576:	
;Main Card V10.0.c: 176: {
;Main Card V10.0.c: 177: FindChannel();
	fcall	_FindChannel
	line	178
;Main Card V10.0.c: 178: break;
	goto	l4580
	line	179
	
l1074:	
	goto	l4578
	line	180
	
l1072:	
	line	173
	
l4578:	
	movlw	(0Eh)
	fcall	_RegisterRead
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransiverToReceive+0)+0
	btfss	0+(??_TransiverToReceive+0)+0,(1)&7
	goto	u3651
	goto	u3650
u3651:
	goto	l4574
u3650:
	goto	l4580
	
l1075:	
	line	182
	
l4580:	
;Main Card V10.0.c: 179: }
;Main Card V10.0.c: 180: }
;Main Card V10.0.c: 182: SetRFMode(0x60);
	movlw	(060h)
	fcall	_SetRFMode
	line	183
	
l4582:	
;Main Card V10.0.c: 183: _delay((unsigned long)((500)*(4000000/4000000.0)));
	opt asmopt_off
movlw	166
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	(??_TransiverToReceive+0)+0,f
u4097:
decfsz	(??_TransiverToReceive+0)+0,f
	goto	u4097
	clrwdt
opt asmopt_on

	line	184
	
l4584:	
;Main Card V10.0.c: 184: bTransiverModeReceive = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_bTransiverModeReceive)
	bsf	status,0
	rlf	(_bTransiverModeReceive),f
	line	185
	
l1076:	
	return
	opt stack 0
GLOBAL	__end_of_TransiverToReceive
	__end_of_TransiverToReceive:
;; =============== function _TransiverToReceive ends ============

	signat	_TransiverToReceive,88
	global	_Mode_2
psect	text818,local,class=CODE,delta=2
global __ptext818
__ptext818:

;; *************** function _Mode_2 *****************
;; Defined at:
;;		line 373 in file "C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_LightWithSensController
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text818
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	373
	global	__size_of_Mode_2
	__size_of_Mode_2	equ	__end_of_Mode_2-_Mode_2
	
_Mode_2:	
	opt	stack 1
; Regs used in _Mode_2: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	374
	
l4560:	
;Main Card V10.0.c: 374: LightWithSensController();
	fcall	_LightWithSensController
	line	375
	
l4562:	
;Main Card V10.0.c: 375: if(PORTCbits.RC2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(7),2	;volatile
	goto	u3631
	goto	u3630
u3631:
	goto	l1146
u3630:
	line	376
	
l4564:	
;Main Card V10.0.c: 376: PORTCbits.RC1 = 1;
	bsf	(7),1	;volatile
	goto	l1148
	line	377
	
l1146:	
	line	378
;Main Card V10.0.c: 377: else
;Main Card V10.0.c: 378: PORTCbits.RC1 = 0;
	bcf	(7),1	;volatile
	goto	l1148
	
l1147:	
	line	379
	
l1148:	
	return
	opt stack 0
GLOBAL	__end_of_Mode_2
	__end_of_Mode_2:
;; =============== function _Mode_2 ends ============

	signat	_Mode_2,88
	global	_Mode_0
psect	text819,local,class=CODE,delta=2
global __ptext819
__ptext819:

;; *************** function _Mode_0 *****************
;; Defined at:
;;		line 351 in file "C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_LightWithSensController
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text819
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	351
	global	__size_of_Mode_0
	__size_of_Mode_0	equ	__end_of_Mode_0-_Mode_0
	
_Mode_0:	
	opt	stack 1
; Regs used in _Mode_0: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	352
	
l4558:	
;Main Card V10.0.c: 352: LightWithSensController();
	fcall	_LightWithSensController
	line	353
	
l1137:	
	return
	opt stack 0
GLOBAL	__end_of_Mode_0
	__end_of_Mode_0:
;; =============== function _Mode_0 ends ============

	signat	_Mode_0,88
	global	_TransiverInit
psect	text820,local,class=CODE,delta=2
global __ptext820
__ptext820:

;; *************** function _TransiverInit *****************
;; Defined at:
;;		line 595 in file "C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_RegisterSet
;;		_RegisterRead
;;		_FindChannel
;;		_Blink
;;		_SetRFMode
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text820
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	595
	global	__size_of_TransiverInit
	__size_of_TransiverInit	equ	__end_of_TransiverInit-_TransiverInit
	
_TransiverInit:	
	opt	stack 0
; Regs used in _TransiverInit: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	597
	
l4550:	
;Main Card V10.0.c: 597: RegisterSet(0x00, 0x30);
	movlw	(030h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransiverInit+0)+0
	movf	(??_TransiverInit+0)+0,w
	movwf	(?_RegisterSet)
	movlw	(0)
	fcall	_RegisterSet
	line	598
;Main Card V10.0.c: 598: RegisterSet(0x01,(0xA8));
	movlw	(0A8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransiverInit+0)+0
	movf	(??_TransiverInit+0)+0,w
	movwf	(?_RegisterSet)
	movlw	(01h)
	fcall	_RegisterSet
	line	599
;Main Card V10.0.c: 599: RegisterSet(0x02, 0x09);
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransiverInit+0)+0
	movf	(??_TransiverInit+0)+0,w
	movwf	(?_RegisterSet)
	movlw	(02h)
	fcall	_RegisterSet
	line	600
;Main Card V10.0.c: 600: RegisterSet(0x03, 0x07);
	movlw	(07h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransiverInit+0)+0
	movf	(??_TransiverInit+0)+0,w
	movwf	(?_RegisterSet)
	movlw	(03h)
	fcall	_RegisterSet
	line	601
;Main Card V10.0.c: 601: RegisterSet(0x05,(0x0A));
	movlw	(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransiverInit+0)+0
	movf	(??_TransiverInit+0)+0,w
	movwf	(?_RegisterSet)
	movlw	(05h)
	fcall	_RegisterSet
	line	602
;Main Card V10.0.c: 602: RegisterSet(0x0D,(0x00|0xB0|0x09));
	movlw	(0B9h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransiverInit+0)+0
	movf	(??_TransiverInit+0)+0,w
	movwf	(?_RegisterSet)
	movlw	(0Dh)
	fcall	_RegisterSet
	line	603
;Main Card V10.0.c: 603: RegisterSet(0x0E,(0x01|0x10|0x01));
	movlw	(011h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransiverInit+0)+0
	movf	(??_TransiverInit+0)+0,w
	movwf	(?_RegisterSet)
	movlw	(0Eh)
	fcall	_RegisterSet
	line	604
;Main Card V10.0.c: 604: RegisterSet(0x10, 0xA3);
	movlw	(0A3h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransiverInit+0)+0
	movf	(??_TransiverInit+0)+0,w
	movwf	(?_RegisterSet)
	movlw	(010h)
	fcall	_RegisterSet
	line	605
;Main Card V10.0.c: 605: RegisterSet(0x12,(0x18|0x20|0x06));
	movlw	(03Eh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransiverInit+0)+0
	movf	(??_TransiverInit+0)+0,w
	movwf	(?_RegisterSet)
	movlw	(012h)
	fcall	_RegisterSet
	line	606
;Main Card V10.0.c: 606: RegisterSet(0x16,('S'));
	movlw	(053h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransiverInit+0)+0
	movf	(??_TransiverInit+0)+0,w
	movwf	(?_RegisterSet)
	movlw	(016h)
	fcall	_RegisterSet
	line	607
;Main Card V10.0.c: 607: RegisterSet(0x17,('Y'));
	movlw	(059h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransiverInit+0)+0
	movf	(??_TransiverInit+0)+0,w
	movwf	(?_RegisterSet)
	movlw	(017h)
	fcall	_RegisterSet
	line	608
;Main Card V10.0.c: 608: RegisterSet(0x18,('N'));
	movlw	(04Eh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransiverInit+0)+0
	movf	(??_TransiverInit+0)+0,w
	movwf	(?_RegisterSet)
	movlw	(018h)
	fcall	_RegisterSet
	line	609
;Main Card V10.0.c: 609: RegisterSet(0x19,('C'));
	movlw	(043h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransiverInit+0)+0
	movf	(??_TransiverInit+0)+0,w
	movwf	(?_RegisterSet)
	movlw	(019h)
	fcall	_RegisterSet
	line	610
;Main Card V10.0.c: 610: RegisterSet(0x1A, 0x72);
	movlw	(072h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransiverInit+0)+0
	movf	(??_TransiverInit+0)+0,w
	movwf	(?_RegisterSet)
	movlw	(01Ah)
	fcall	_RegisterSet
	line	611
;Main Card V10.0.c: 611: RegisterSet(0x1B, 0x3C);
	movlw	(03Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransiverInit+0)+0
	movf	(??_TransiverInit+0)+0,w
	movwf	(?_RegisterSet)
	movlw	(01Bh)
	fcall	_RegisterSet
	line	612
;Main Card V10.0.c: 612: RegisterSet(0x1F, 0x80);
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransiverInit+0)+0
	movf	(??_TransiverInit+0)+0,w
	movwf	(?_RegisterSet)
	movlw	(01Fh)
	fcall	_RegisterSet
	line	613
;Main Card V10.0.c: 613: RegisterSet(0x00, (RegisterRead(0x00)|0x01));
	movlw	(0)
	fcall	_RegisterRead
	iorlw	01h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_TransiverInit+0)+0
	movf	(??_TransiverInit+0)+0,w
	movwf	(?_RegisterSet)
	movlw	(0)
	fcall	_RegisterSet
	line	615
	
l4552:	
;Main Card V10.0.c: 615: if(FindChannel() == 1)
	fcall	_FindChannel
	xorlw	01h
	skipz
	goto	u3621
	goto	u3620
u3621:
	goto	l4556
u3620:
	line	616
	
l4554:	
;Main Card V10.0.c: 616: Blink(1);
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_Blink)
	movlw	high(01h)
	movwf	((?_Blink))+1
	fcall	_Blink
	goto	l4556
	
l1201:	
	line	617
	
l4556:	
;Main Card V10.0.c: 617: SetRFMode(0x00);
	movlw	(0)
	fcall	_SetRFMode
	line	619
	
l1202:	
	return
	opt stack 0
GLOBAL	__end_of_TransiverInit
	__end_of_TransiverInit:
;; =============== function _TransiverInit ends ============

	signat	_TransiverInit,88
	global	_LightWithSensController
psect	text821,local,class=CODE,delta=2
global __ptext821
__ptext821:

;; *************** function _LightWithSensController *****************
;; Defined at:
;;		line 417 in file "C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_DarknessCheck
;;		_timerFunction
;; This function is called by:
;;		_Mode_0
;;		_Mode_2
;;		_Mode_4
;;		_Mode_5
;; This function uses a non-reentrant model
;;
psect	text821
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	417
	global	__size_of_LightWithSensController
	__size_of_LightWithSensController	equ	__end_of_LightWithSensController-_LightWithSensController
	
_LightWithSensController:	
	opt	stack 1
; Regs used in _LightWithSensController: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	420
	
l4524:	
;Main Card V10.0.c: 420: if((intSecondCounter == 30)&&(!PORTCbits.RC2))
	movlw	01Eh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(_intSecondCounter),w
	iorwf	(_intSecondCounter+1),w
	skipz
	goto	u3541
	goto	u3540
u3541:
	goto	l4530
u3540:
	
l4526:	
	btfsc	(7),2	;volatile
	goto	u3551
	goto	u3550
u3551:
	goto	l4530
u3550:
	line	421
	
l4528:	
;Main Card V10.0.c: 421: DarknessCheck();
	fcall	_DarknessCheck
	goto	l4530
	
l1162:	
	line	425
	
l4530:	
;Main Card V10.0.c: 425: if((bDark == 1)&&(PORTAbits.RA1)&&(!PORTCbits.RC2))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_bDark),w
	xorlw	01h
	skipz
	goto	u3561
	goto	u3560
u3561:
	goto	l4540
u3560:
	
l4532:	
	btfss	(5),1	;volatile
	goto	u3571
	goto	u3570
u3571:
	goto	l4540
u3570:
	
l4534:	
	btfsc	(7),2	;volatile
	goto	u3581
	goto	u3580
u3581:
	goto	l4540
u3580:
	line	428
	
l4536:	
;Main Card V10.0.c: 426: {
;Main Card V10.0.c: 428: PORTCbits.RC2 = 1;
	bsf	(7),2	;volatile
	line	430
	
l4538:	
;Main Card V10.0.c: 430: timerFunction(0,120);
	movlw	low(0)
	movwf	(?_timerFunction)
	movlw	high(0)
	movwf	((?_timerFunction))+1
	movlw	low(078h)
	movwf	0+(?_timerFunction)+02h
	movlw	high(078h)
	movwf	(0+(?_timerFunction)+02h)+1
	fcall	_timerFunction
	goto	l4540
	line	431
	
l1163:	
	line	434
	
l4540:	
;Main Card V10.0.c: 431: }
;Main Card V10.0.c: 434: if(bTimerComplete[0])
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_bTimerComplete)^080h,w
	skipz
	goto	u3590
	goto	l1167
u3590:
	line	436
	
l4542:	
;Main Card V10.0.c: 435: {
;Main Card V10.0.c: 436: DarknessCheck();
	fcall	_DarknessCheck
	line	437
	
l4544:	
;Main Card V10.0.c: 437: if((bDark)&&(PORTAbits.RA1))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_bDark),w
	skipz
	goto	u3600
	goto	l1165
u3600:
	
l4546:	
	btfss	(5),1	;volatile
	goto	u3611
	goto	u3610
u3611:
	goto	l1165
u3610:
	line	439
	
l4548:	
;Main Card V10.0.c: 438: {
;Main Card V10.0.c: 439: timerFunction(0,120);
	movlw	low(0)
	movwf	(?_timerFunction)
	movlw	high(0)
	movwf	((?_timerFunction))+1
	movlw	low(078h)
	movwf	0+(?_timerFunction)+02h
	movlw	high(078h)
	movwf	(0+(?_timerFunction)+02h)+1
	fcall	_timerFunction
	line	440
;Main Card V10.0.c: 440: }
	goto	l1167
	line	441
	
l1165:	
	line	442
;Main Card V10.0.c: 441: else
;Main Card V10.0.c: 442: PORTCbits.RC2 = 0;
	bcf	(7),2	;volatile
	goto	l1167
	
l1166:	
	goto	l1167
	line	444
	
l1164:	
	line	446
	
l1167:	
	return
	opt stack 0
GLOBAL	__end_of_LightWithSensController
	__end_of_LightWithSensController:
;; =============== function _LightWithSensController ends ============

	signat	_LightWithSensController,88
	global	_FindChannel
psect	text822,local,class=CODE,delta=2
global __ptext822
__ptext822:

;; *************** function _FindChannel *****************
;; Defined at:
;;		line 640 in file "C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2   19[BANK0 ] int 
;;  cnt             2   17[BANK0 ] int 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0       7       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_RegisterSet
;;		_RegisterRead
;;		_SetRFMode
;; This function is called by:
;;		_TransiverToReceive
;;		_TransmittString
;;		_TransiverInit
;; This function uses a non-reentrant model
;;
psect	text822
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	640
	global	__size_of_FindChannel
	__size_of_FindChannel	equ	__end_of_FindChannel-_FindChannel
	
_FindChannel:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in _FindChannel: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	641
	
l4484:	
;Main Card V10.0.c: 641: int cnt = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(FindChannel@cnt)
	clrf	(FindChannel@cnt+1)
	line	642
	
l4486:	
;Main Card V10.0.c: 642: bChannelFound = 0;
	clrf	(_bChannelFound)
	line	643
;Main Card V10.0.c: 643: channelFound = 0;
	clrf	(_channelFound)
	clrf	(_channelFound+1)
	line	645
	
l4488:	
;Main Card V10.0.c: 645: _delay((unsigned long)((1000)*(4000000/4000.0)));
	opt asmopt_off
movlw  6
movwf	((??_FindChannel+0)+0+2),f
movlw	19
movwf	((??_FindChannel+0)+0+1),f
	movlw	177
movwf	((??_FindChannel+0)+0),f
u4107:
	decfsz	((??_FindChannel+0)+0),f
	goto	u4107
	decfsz	((??_FindChannel+0)+0+1),f
	goto	u4107
	decfsz	((??_FindChannel+0)+0+2),f
	goto	u4107
	nop2
opt asmopt_on

	line	646
	
l4490:	
;Main Card V10.0.c: 646: for (int i = 0; i < 13; i++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(FindChannel@i)
	clrf	(FindChannel@i+1)
	
l4492:	
	movf	(FindChannel@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Dh))^80h
	subwf	btemp+1,w
	skipz
	goto	u3505
	movlw	low(0Dh)
	subwf	(FindChannel@i),w
u3505:

	skipc
	goto	u3501
	goto	u3500
u3501:
	goto	l4496
u3500:
	goto	l4520
	
l4494:	
	goto	l4520
	line	647
	
l1205:	
	line	648
	
l4496:	
;Main Card V10.0.c: 647: {
;Main Card V10.0.c: 648: RegisterSet(0x06,ChannelR[i]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(FindChannel@i),w
	addlw	low((_ChannelR-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(??_FindChannel+0)+0
	movf	(??_FindChannel+0)+0,w
	movwf	(?_RegisterSet)
	movlw	(06h)
	fcall	_RegisterSet
	line	649
;Main Card V10.0.c: 649: RegisterSet(0x07,ChannelP[i]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(FindChannel@i),w
	addlw	low((_ChannelP-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(??_FindChannel+0)+0
	movf	(??_FindChannel+0)+0,w
	movwf	(?_RegisterSet)
	movlw	(07h)
	fcall	_RegisterSet
	line	650
;Main Card V10.0.c: 650: RegisterSet(0x08,ChannelS[i]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(FindChannel@i),w
	addlw	low((_ChannelS-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(??_FindChannel+0)+0
	movf	(??_FindChannel+0)+0,w
	movwf	(?_RegisterSet)
	movlw	(08h)
	fcall	_RegisterSet
	line	651
;Main Card V10.0.c: 651: RegisterSet(0x09,ChannelR[i]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(FindChannel@i),w
	addlw	low((_ChannelR-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(??_FindChannel+0)+0
	movf	(??_FindChannel+0)+0,w
	movwf	(?_RegisterSet)
	movlw	(09h)
	fcall	_RegisterSet
	line	652
;Main Card V10.0.c: 652: RegisterSet(0x0A,ChannelP[i]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(FindChannel@i),w
	addlw	low((_ChannelP-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(??_FindChannel+0)+0
	movf	(??_FindChannel+0)+0,w
	movwf	(?_RegisterSet)
	movlw	(0Ah)
	fcall	_RegisterSet
	line	653
;Main Card V10.0.c: 653: RegisterSet(0x0B,ChannelS[i]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(FindChannel@i),w
	addlw	low((_ChannelS-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(??_FindChannel+0)+0
	movf	(??_FindChannel+0)+0,w
	movwf	(?_RegisterSet)
	movlw	(0Bh)
	fcall	_RegisterSet
	line	654
	
l4498:	
;Main Card V10.0.c: 654: RegisterSet(0x0E,(RegisterRead(0x0E)|0x02));
	movlw	(0Eh)
	fcall	_RegisterRead
	iorlw	02h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindChannel+0)+0
	movf	(??_FindChannel+0)+0,w
	movwf	(?_RegisterSet)
	movlw	(0Eh)
	fcall	_RegisterSet
	line	655
	
l4500:	
;Main Card V10.0.c: 655: SetRFMode(0x40);
	movlw	(040h)
	fcall	_SetRFMode
	line	656
	
l4502:	
;Main Card V10.0.c: 656: cnt = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(FindChannel@cnt)
	clrf	(FindChannel@cnt+1)
	line	657
;Main Card V10.0.c: 657: while(cnt < 5)
	goto	l4514
	
l1208:	
	line	660
	
l4504:	
;Main Card V10.0.c: 658: {
;Main Card V10.0.c: 660: if((RegisterRead(0x0E) & 0b00000010) != 0)
	movlw	(0Eh)
	fcall	_RegisterRead
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindChannel+0)+0
	btfss	0+(??_FindChannel+0)+0,(1)&7
	goto	u3511
	goto	u3510
u3511:
	goto	l4512
u3510:
	line	662
	
l4506:	
;Main Card V10.0.c: 661: {
;Main Card V10.0.c: 662: bChannelFound = 1;
	clrf	(_bChannelFound)
	bsf	status,0
	rlf	(_bChannelFound),f
	line	663
	
l4508:	
;Main Card V10.0.c: 663: channelFound = i;
	movf	(FindChannel@i+1),w
	clrf	(_channelFound+1)
	addwf	(_channelFound+1)
	movf	(FindChannel@i),w
	clrf	(_channelFound)
	addwf	(_channelFound)

	line	664
;Main Card V10.0.c: 664: return 1;
	movlw	(01h)
	goto	l1210
	
l4510:	
	goto	l1210
	line	665
	
l1209:	
	line	666
	
l4512:	
;Main Card V10.0.c: 665: }
;Main Card V10.0.c: 666: cnt++;
	movlw	low(01h)
	addwf	(FindChannel@cnt),f
	skipnc
	incf	(FindChannel@cnt+1),f
	movlw	high(01h)
	addwf	(FindChannel@cnt+1),f
	line	667
;Main Card V10.0.c: 667: _delay((unsigned long)((1000)*(4000000/4000000.0)));
	opt asmopt_off
movlw	249
movwf	(??_FindChannel+0)+0,f
u4117:
	clrwdt
decfsz	(??_FindChannel+0)+0,f
	goto	u4117
	nop2	;nop
	clrwdt
opt asmopt_on

	goto	l4514
	line	668
	
l1207:	
	line	657
	
l4514:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(FindChannel@cnt+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(05h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3525
	movlw	low(05h)
	subwf	(FindChannel@cnt),w
u3525:

	skipc
	goto	u3521
	goto	u3520
u3521:
	goto	l4504
u3520:
	goto	l4516
	
l1211:	
	line	646
	
l4516:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(FindChannel@i),f
	skipnc
	incf	(FindChannel@i+1),f
	movlw	high(01h)
	addwf	(FindChannel@i+1),f
	
l4518:	
	movf	(FindChannel@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Dh))^80h
	subwf	btemp+1,w
	skipz
	goto	u3535
	movlw	low(0Dh)
	subwf	(FindChannel@i),w
u3535:

	skipc
	goto	u3531
	goto	u3530
u3531:
	goto	l4496
u3530:
	goto	l4520
	
l1206:	
	line	672
	
l4520:	
;Main Card V10.0.c: 668: }
;Main Card V10.0.c: 671: }
;Main Card V10.0.c: 672: return 0;
	movlw	(0)
	goto	l1210
	
l4522:	
	line	674
	
l1210:	
	return
	opt stack 0
GLOBAL	__end_of_FindChannel
	__end_of_FindChannel:
;; =============== function _FindChannel ends ============

	signat	_FindChannel,89
	global	_Mode_1
psect	text823,local,class=CODE,delta=2
global __ptext823
__ptext823:

;; *************** function _Mode_1 *****************
;; Defined at:
;;		line 359 in file "C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_DarknessCheck
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text823
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	359
	global	__size_of_Mode_1
	__size_of_Mode_1	equ	__end_of_Mode_1-_Mode_1
	
_Mode_1:	
	opt	stack 2
; Regs used in _Mode_1: [wreg+status,2+status,0+pclath+cstack]
	line	361
	
l4472:	
;Main Card V10.0.c: 361: if((intSecondCounter == 30)&&(!PORTCbits.RC2))
	movlw	01Eh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(_intSecondCounter),w
	iorwf	(_intSecondCounter+1),w
	skipz
	goto	u3461
	goto	u3460
u3461:
	goto	l4478
u3460:
	
l4474:	
	btfsc	(7),2	;volatile
	goto	u3471
	goto	u3470
u3471:
	goto	l4478
u3470:
	line	362
	
l4476:	
;Main Card V10.0.c: 362: DarknessCheck();
	fcall	_DarknessCheck
	goto	l4478
	
l1140:	
	line	363
	
l4478:	
;Main Card V10.0.c: 363: if((intBlinkCycle == 1)&&(bDark == 1))
	movlw	01h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(_intBlinkCycle),w
	iorwf	(_intBlinkCycle+1),w
	skipz
	goto	u3481
	goto	u3480
u3481:
	goto	l1141
u3480:
	
l4480:	
	movf	(_bDark),w
	xorlw	01h
	skipz
	goto	u3491
	goto	u3490
u3491:
	goto	l1141
u3490:
	line	364
	
l4482:	
;Main Card V10.0.c: 364: PORTCbits.RC2 = 1;
	bsf	(7),2	;volatile
	goto	l1143
	line	365
	
l1141:	
	line	366
;Main Card V10.0.c: 365: else
;Main Card V10.0.c: 366: PORTCbits.RC2 = 0;
	bcf	(7),2	;volatile
	goto	l1143
	
l1142:	
	line	367
	
l1143:	
	return
	opt stack 0
GLOBAL	__end_of_Mode_1
	__end_of_Mode_1:
;; =============== function _Mode_1 ends ============

	signat	_Mode_1,88
	global	_DarknessCheck
psect	text824,local,class=CODE,delta=2
global __ptext824
__ptext824:

;; *************** function _DarknessCheck *****************
;; Defined at:
;;		line 941 in file "C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  darknessValu    1    9[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_AnalogValue
;; This function is called by:
;;		_TransmittedDataHandler
;;		_Mode_1
;;		_LightWithSensController
;; This function uses a non-reentrant model
;;
psect	text824
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	941
	global	__size_of_DarknessCheck
	__size_of_DarknessCheck	equ	__end_of_DarknessCheck-_DarknessCheck
	
_DarknessCheck:	
	opt	stack 1
; Regs used in _DarknessCheck: [wreg+status,2+status,0+pclath+cstack]
	line	943
	
l4460:	
;Main Card V10.0.c: 942: unsigned char darknessValue;
;Main Card V10.0.c: 943: PORTCbits.RC0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(7),0	;volatile
	line	945
	
l4462:	
;Main Card V10.0.c: 945: if(bValueFromPot == TRUE)
	movf	(_bValueFromPot),w
	xorlw	01h
	skipz
	goto	u3441
	goto	u3440
u3441:
	goto	l4466
u3440:
	line	946
	
l4464:	
;Main Card V10.0.c: 946: darknessValue= AnalogValue(3);
	movlw	(03h)
	fcall	_AnalogValue
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_DarknessCheck+0)+0
	movf	(??_DarknessCheck+0)+0,w
	movwf	(DarknessCheck@darknessValue)
	goto	l4468
	line	947
	
l1262:	
	line	948
	
l4466:	
;Main Card V10.0.c: 947: else
;Main Card V10.0.c: 948: darknessValue=chManualDarknessValue;
	movf	(_chManualDarknessValue),w
	movwf	(??_DarknessCheck+0)+0
	movf	(??_DarknessCheck+0)+0,w
	movwf	(DarknessCheck@darknessValue)
	goto	l4468
	
l1263:	
	line	950
	
l4468:	
;Main Card V10.0.c: 950: if(AnalogValue(0)>darknessValue)
	movlw	(0)
	fcall	_AnalogValue
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(DarknessCheck@darknessValue),w
	skipnc
	goto	u3451
	goto	u3450
u3451:
	goto	l1264
u3450:
	line	951
	
l4470:	
;Main Card V10.0.c: 951: bDark = 1;
	clrf	(_bDark)
	bsf	status,0
	rlf	(_bDark),f
	goto	l1265
	line	952
	
l1264:	
	line	953
;Main Card V10.0.c: 952: else
;Main Card V10.0.c: 953: bDark = 0;
	clrf	(_bDark)
	
l1265:	
	line	954
;Main Card V10.0.c: 954: PORTCbits.RC0 = 0;
	bcf	(7),0	;volatile
	line	956
	
l1266:	
	return
	opt stack 0
GLOBAL	__end_of_DarknessCheck
	__end_of_DarknessCheck:
;; =============== function _DarknessCheck ends ============

	signat	_DarknessCheck,88
	global	_SetRFMode
psect	text825,local,class=CODE,delta=2
global __ptext825
__ptext825:

;; *************** function _SetRFMode *****************
;; Defined at:
;;		line 676 in file "C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
;; Parameters:    Size  Location     Type
;;  mode            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  mode            1   12[BANK0 ] unsigned char 
;;  mcparam0_rea    1   13[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_RegisterRead
;;		_RegisterSet
;; This function is called by:
;;		_TransiverToReceive
;;		_TransiverReadFIFO
;;		_TransmittString
;;		_TransiverInit
;;		_FindChannel
;; This function uses a non-reentrant model
;;
psect	text825
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	676
	global	__size_of_SetRFMode
	__size_of_SetRFMode	equ	__end_of_SetRFMode-_SetRFMode
	
_SetRFMode:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in _SetRFMode: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;SetRFMode@mode stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(SetRFMode@mode)
	line	677
	
l4442:	
;Main Card V10.0.c: 677: PORTAbits.RA4 = 0;
	bcf	(5),4	;volatile
	line	679
	
l4444:	
;Main Card V10.0.c: 678: BYTE mcparam0_read;
;Main Card V10.0.c: 679: mcparam0_read = RegisterRead(0);
	movlw	(0)
	fcall	_RegisterRead
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_SetRFMode+0)+0
	movf	(??_SetRFMode+0)+0,w
	movwf	(SetRFMode@mcparam0_read)
	line	680
;Main Card V10.0.c: 680: switch (mode) {
	goto	l4458
	line	681
;Main Card V10.0.c: 681: case 0x80:
	
l1215:	
	line	682
	
l4446:	
;Main Card V10.0.c: 682: RegisterSet(0, (mcparam0_read & 0x1F) | 0x80);
	movf	(SetRFMode@mcparam0_read),w
	andlw	01Fh
	iorlw	080h
	movwf	(??_SetRFMode+0)+0
	movf	(??_SetRFMode+0)+0,w
	movwf	(?_RegisterSet)
	movlw	(0)
	fcall	_RegisterSet
	line	684
;Main Card V10.0.c: 684: break;
	goto	l1216
	line	685
;Main Card V10.0.c: 685: case 0x60:
	
l1217:	
	line	686
	
l4448:	
;Main Card V10.0.c: 686: RegisterSet(0, (mcparam0_read & 0x1F) | 0x60);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(SetRFMode@mcparam0_read),w
	andlw	01Fh
	iorlw	060h
	movwf	(??_SetRFMode+0)+0
	movf	(??_SetRFMode+0)+0,w
	movwf	(?_RegisterSet)
	movlw	(0)
	fcall	_RegisterSet
	line	688
;Main Card V10.0.c: 688: break;
	goto	l1216
	line	689
;Main Card V10.0.c: 689: case 0x40:
	
l1218:	
	line	690
	
l4450:	
;Main Card V10.0.c: 690: RegisterSet(0, (mcparam0_read & 0x1F) | 0x40);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(SetRFMode@mcparam0_read),w
	andlw	01Fh
	iorlw	040h
	movwf	(??_SetRFMode+0)+0
	movf	(??_SetRFMode+0)+0,w
	movwf	(?_RegisterSet)
	movlw	(0)
	fcall	_RegisterSet
	line	692
;Main Card V10.0.c: 692: break;
	goto	l1216
	line	693
;Main Card V10.0.c: 693: case 0x20:
	
l1219:	
	line	694
	
l4452:	
;Main Card V10.0.c: 694: RegisterSet(0, (mcparam0_read & 0x1F) | 0x20);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(SetRFMode@mcparam0_read),w
	andlw	01Fh
	iorlw	020h
	movwf	(??_SetRFMode+0)+0
	movf	(??_SetRFMode+0)+0,w
	movwf	(?_RegisterSet)
	movlw	(0)
	fcall	_RegisterSet
	line	696
;Main Card V10.0.c: 696: break;
	goto	l1216
	line	697
;Main Card V10.0.c: 697: case 0x00:
	
l1220:	
	line	698
	
l4454:	
;Main Card V10.0.c: 698: RegisterSet(0, (mcparam0_read & 0x1F) | 0x00);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(SetRFMode@mcparam0_read),w
	andlw	01Fh
	movwf	(??_SetRFMode+0)+0
	movf	(??_SetRFMode+0)+0,w
	movwf	(?_RegisterSet)
	movlw	(0)
	fcall	_RegisterSet
	line	700
;Main Card V10.0.c: 700: break;
	goto	l1216
	line	701
	
l4456:	
;Main Card V10.0.c: 701: }
	goto	l1216
	line	680
	
l1214:	
	
l4458:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(SetRFMode@mode),w
	; Switch size 1, requested type "space"
; Number of cases is 5, Range of values is 0 to 128
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           16     9 (average)
; jumptable            260     6 (fixed)
; rangetable           133     6 (fixed)
; spacedrange          264     9 (fixed)
; locatedrange         129     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l4454
	xorlw	32^0	; case 32
	skipnz
	goto	l4452
	xorlw	64^32	; case 64
	skipnz
	goto	l4450
	xorlw	96^64	; case 96
	skipnz
	goto	l4448
	xorlw	128^96	; case 128
	skipnz
	goto	l4446
	goto	l1216
	opt asmopt_on

	line	701
	
l1216:	
	line	702
;Main Card V10.0.c: 702: PORTAbits.RA4 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(5),4	;volatile
	line	703
	
l1221:	
	return
	opt stack 0
GLOBAL	__end_of_SetRFMode
	__end_of_SetRFMode:
;; =============== function _SetRFMode ends ============

	signat	_SetRFMode,4216
	global	_Blink
psect	text826,local,class=CODE,delta=2
global __ptext826
__ptext826:

;; *************** function _Blink *****************
;; Defined at:
;;		line 705 in file "C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
;; Parameters:    Size  Location     Type
;;  n               2    6[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  i               2    9[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_DelayDs
;; This function is called by:
;;		_TransiverInit
;; This function uses a non-reentrant model
;;
psect	text826
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	705
	global	__size_of_Blink
	__size_of_Blink	equ	__end_of_Blink-_Blink
	
_Blink:	
	opt	stack 3
; Regs used in _Blink: [wreg+status,2+status,0+pclath+cstack]
	line	706
	
l4432:	
;Main Card V10.0.c: 706: for(int i = 1;i<=n;i++)
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(Blink@i)
	movlw	high(01h)
	movwf	((Blink@i))+1
	goto	l4440
	line	707
	
l1225:	
	line	708
;Main Card V10.0.c: 707: {
;Main Card V10.0.c: 708: PORTCbits.RC1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(7),1	;volatile
	line	709
	
l4434:	
;Main Card V10.0.c: 709: DelayDs(2);
	movlw	low(02h)
	movwf	(?_DelayDs)
	movlw	high(02h)
	movwf	((?_DelayDs))+1
	fcall	_DelayDs
	line	710
	
l4436:	
;Main Card V10.0.c: 710: PORTCbits.RC1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(7),1	;volatile
	line	711
;Main Card V10.0.c: 711: DelayDs(6);
	movlw	low(06h)
	movwf	(?_DelayDs)
	movlw	high(06h)
	movwf	((?_DelayDs))+1
	fcall	_DelayDs
	line	706
	
l4438:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(Blink@i),f
	skipnc
	incf	(Blink@i+1),f
	movlw	high(01h)
	addwf	(Blink@i+1),f
	goto	l4440
	
l1224:	
	
l4440:	
	movf	(Blink@n+1),w
	xorlw	80h
	movwf	(??_Blink+0)+0
	movf	(Blink@i+1),w
	xorlw	80h
	subwf	(??_Blink+0)+0,w
	skipz
	goto	u3435
	movf	(Blink@i),w
	subwf	(Blink@n),w
u3435:

	skipnc
	goto	u3431
	goto	u3430
u3431:
	goto	l1225
u3430:
	goto	l1227
	
l1226:	
	line	714
	
l1227:	
	return
	opt stack 0
GLOBAL	__end_of_Blink
	__end_of_Blink:
;; =============== function _Blink ends ============

	signat	_Blink,4216
	global	_AnalogValue
psect	text827,local,class=CODE,delta=2
global __ptext827
__ptext827:

;; *************** function _AnalogValue *****************
;; Defined at:
;;		line 914 in file "C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
;; Parameters:    Size  Location     Type
;;  channel         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  channel         1    7[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_DelayDs
;; This function is called by:
;;		_TransmittedDataHandler
;;		_DarknessCheck
;; This function uses a non-reentrant model
;;
psect	text827
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	914
	global	__size_of_AnalogValue
	__size_of_AnalogValue	equ	__end_of_AnalogValue-_AnalogValue
	
_AnalogValue:	
	opt	stack 1
; Regs used in _AnalogValue: [wreg+status,2+status,0+pclath+cstack]
;AnalogValue@channel stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(AnalogValue@channel)
	line	915
	
l4418:	
;Main Card V10.0.c: 915: ADCON0bits.CHS = channel;
	movf	(AnalogValue@channel),w
	movwf	(??_AnalogValue+0)+0
	rlf	(??_AnalogValue+0)+0,f
	rlf	(??_AnalogValue+0)+0,f
	movf	(31),w	;volatile
	xorwf	(??_AnalogValue+0)+0,w
	andlw	not (((1<<4)-1)<<2)
	xorwf	(??_AnalogValue+0)+0,w
	movwf	(31)	;volatile
	line	916
	
l4420:	
;Main Card V10.0.c: 916: ADCON0bits.ADON = 1;
	bsf	(31),0	;volatile
	line	917
	
l4422:	
;Main Card V10.0.c: 917: DelayDs(1);
	movlw	low(01h)
	movwf	(?_DelayDs)
	movlw	high(01h)
	movwf	((?_DelayDs))+1
	fcall	_DelayDs
	line	918
	
l4424:	
;Main Card V10.0.c: 918: ADCON0bits.GO = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(31),1	;volatile
	line	919
	
l4426:	
;Main Card V10.0.c: 919: DelayDs(1);
	movlw	low(01h)
	movwf	(?_DelayDs)
	movlw	high(01h)
	movwf	((?_DelayDs))+1
	fcall	_DelayDs
	line	920
;Main Card V10.0.c: 920: while(ADCON0bits.GO);
	goto	l1256
	
l1257:	
	
l1256:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(31),1	;volatile
	goto	u3421
	goto	u3420
u3421:
	goto	l1256
u3420:
	
l1258:	
	line	921
;Main Card V10.0.c: 921: ADCON0bits.ADON = 0;
	bcf	(31),0	;volatile
	line	922
	
l4428:	
;Main Card V10.0.c: 922: return ADRESH;
	movf	(30),w	;volatile
	goto	l1259
	
l4430:	
	line	924
	
l1259:	
	return
	opt stack 0
GLOBAL	__end_of_AnalogValue
	__end_of_AnalogValue:
;; =============== function _AnalogValue ends ============

	signat	_AnalogValue,4217
	global	_ReadFIFO
psect	text828,local,class=CODE,delta=2
global __ptext828
__ptext828:

;; *************** function _ReadFIFO *****************
;; Defined at:
;;		line 792 in file "C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  value           1    4[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_ReadSPI
;; This function is called by:
;;		_TransiverReadFIFO
;; This function uses a non-reentrant model
;;
psect	text828
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	792
	global	__size_of_ReadFIFO
	__size_of_ReadFIFO	equ	__end_of_ReadFIFO-_ReadFIFO
	
_ReadFIFO:	
	opt	stack 2
; Regs used in _ReadFIFO: [wreg+status,2+status,0+pclath+cstack]
	line	794
	
l4408:	
;Main Card V10.0.c: 793: BYTE value;
;Main Card V10.0.c: 794: PORTAbits.RA5 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(5),5	;volatile
	line	795
	
l4410:	
;Main Card V10.0.c: 795: value = ReadSPI();
	fcall	_ReadSPI
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ReadFIFO+0)+0
	movf	(??_ReadFIFO+0)+0,w
	movwf	(ReadFIFO@value)
	line	796
	
l4412:	
;Main Card V10.0.c: 796: PORTAbits.RA5 = 1;
	bsf	(5),5	;volatile
	line	797
	
l4414:	
;Main Card V10.0.c: 797: return value;
	movf	(ReadFIFO@value),w
	goto	l1236
	
l4416:	
	line	799
	
l1236:	
	return
	opt stack 0
GLOBAL	__end_of_ReadFIFO
	__end_of_ReadFIFO:
;; =============== function _ReadFIFO ends ============

	signat	_ReadFIFO,89
	global	_RegisterRead
psect	text829,local,class=CODE,delta=2
global __ptext829
__ptext829:

;; *************** function _RegisterRead *****************
;; Defined at:
;;		line 736 in file "C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
;; Parameters:    Size  Location     Type
;;  adress          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  adress          1   10[BANK0 ] unsigned char 
;;  value           1    9[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_WriteSPI
;;		_ReadSPI
;; This function is called by:
;;		_TransiverToReceive
;;		_TransmittString
;;		_TransiverInit
;;		_FindChannel
;;		_SetRFMode
;; This function uses a non-reentrant model
;;
psect	text829
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	736
	global	__size_of_RegisterRead
	__size_of_RegisterRead	equ	__end_of_RegisterRead-_RegisterRead
	
_RegisterRead:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in _RegisterRead: [wreg+status,2+status,0+pclath+cstack]
;RegisterRead@adress stored from wreg
	line	738
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(RegisterRead@adress)
	
l4394:	
;Main Card V10.0.c: 737: BYTE value;
;Main Card V10.0.c: 738: PORTAbits.RA4 = 0;
	bcf	(5),4	;volatile
	line	739
	
l4396:	
;Main Card V10.0.c: 739: adress = ((adress<<1)|0x40);
	movf	(RegisterRead@adress),w
	movwf	(??_RegisterRead+0)+0
	addwf	(??_RegisterRead+0)+0,w
	iorlw	040h
	movwf	(??_RegisterRead+1)+0
	movf	(??_RegisterRead+1)+0,w
	movwf	(RegisterRead@adress)
	line	740
	
l4398:	
;Main Card V10.0.c: 740: WriteSPI(adress);
	movf	(RegisterRead@adress),w
	fcall	_WriteSPI
	line	741
	
l4400:	
;Main Card V10.0.c: 741: value = ReadSPI();
	fcall	_ReadSPI
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_RegisterRead+0)+0
	movf	(??_RegisterRead+0)+0,w
	movwf	(RegisterRead@value)
	line	742
	
l4402:	
;Main Card V10.0.c: 742: PORTAbits.RA4 = 1;
	bsf	(5),4	;volatile
	line	743
	
l4404:	
;Main Card V10.0.c: 743: return value;
	movf	(RegisterRead@value),w
	goto	l1230
	
l4406:	
	line	744
	
l1230:	
	return
	opt stack 0
GLOBAL	__end_of_RegisterRead
	__end_of_RegisterRead:
;; =============== function _RegisterRead ends ============

	signat	_RegisterRead,4217
	global	_ReadSPI
psect	text830,local,class=CODE,delta=2
global __ptext830
__ptext830:

;; *************** function _ReadSPI *****************
;; Defined at:
;;		line 587 in file "C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_WriteSPI
;; This function is called by:
;;		_RegisterRead
;;		_ReadFIFO
;; This function uses a non-reentrant model
;;
psect	text830
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	587
	global	__size_of_ReadSPI
	__size_of_ReadSPI	equ	__end_of_ReadSPI-_ReadSPI
	
_ReadSPI:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in _ReadSPI: [wreg+status,2+status,0+pclath+cstack]
	line	588
	
l4388:	
;Main Card V10.0.c: 588: WriteSPI(0x00);
	movlw	(0)
	fcall	_WriteSPI
	line	589
	
l4390:	
;Main Card V10.0.c: 589: return SSPBUF;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(19),w	;volatile
	goto	l1198
	
l4392:	
	line	590
	
l1198:	
	return
	opt stack 0
GLOBAL	__end_of_ReadSPI
	__end_of_ReadSPI:
;; =============== function _ReadSPI ends ============

	signat	_ReadSPI,89
	global	_WriteFIFO
psect	text831,local,class=CODE,delta=2
global __ptext831
__ptext831:

;; *************** function _WriteFIFO *****************
;; Defined at:
;;		line 819 in file "C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
;; Parameters:    Size  Location     Type
;;  Data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  Data            1    3[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_WriteSPI
;; This function is called by:
;;		_TransmittString
;; This function uses a non-reentrant model
;;
psect	text831
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	819
	global	__size_of_WriteFIFO
	__size_of_WriteFIFO	equ	__end_of_WriteFIFO-_WriteFIFO
	
_WriteFIFO:	
	opt	stack 1
; Regs used in _WriteFIFO: [wreg+status,2+status,0+pclath+cstack]
;WriteFIFO@Data stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(WriteFIFO@Data)
	line	820
	
l4382:	
;Main Card V10.0.c: 820: PORTAbits.RA5 = 0;
	bcf	(5),5	;volatile
	line	821
	
l4384:	
;Main Card V10.0.c: 821: WriteSPI(Data);
	movf	(WriteFIFO@Data),w
	fcall	_WriteSPI
	line	822
	
l4386:	
;Main Card V10.0.c: 822: PORTAbits.RA5 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(5),5	;volatile
	line	823
	
l1239:	
	return
	opt stack 0
GLOBAL	__end_of_WriteFIFO
	__end_of_WriteFIFO:
;; =============== function _WriteFIFO ends ============

	signat	_WriteFIFO,4216
	global	_DelayDs
psect	text832,local,class=CODE,delta=2
global __ptext832
__ptext832:

;; *************** function _DelayDs *****************
;; Defined at:
;;		line 565 in file "C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
;; Parameters:    Size  Location     Type
;;  cnt             2    0[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  i               2    4[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_TransmittedDataHandler
;;		_Blink
;;		_AnalogValue
;; This function uses a non-reentrant model
;;
psect	text832
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	565
	global	__size_of_DelayDs
	__size_of_DelayDs	equ	__end_of_DelayDs-_DelayDs
	
_DelayDs:	
	opt	stack 1
; Regs used in _DelayDs: [wreg+status,2]
	line	567
	
l4378:	
;Main Card V10.0.c: 566: int i;
;Main Card V10.0.c: 567: for(i=0;i<cnt;i++){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(DelayDs@i)
	clrf	(DelayDs@i+1)
	goto	l1186
	
l1187:	
	line	568
	
l4380:	
;Main Card V10.0.c: 568: _delay((unsigned long)((100)*(4000000/4000.0)));
	opt asmopt_off
movlw	130
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_DelayDs+0)+0+1),f
	movlw	221
movwf	((??_DelayDs+0)+0),f
u4127:
	decfsz	((??_DelayDs+0)+0),f
	goto	u4127
	decfsz	((??_DelayDs+0)+0+1),f
	goto	u4127
	nop2
opt asmopt_on

	line	567
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(DelayDs@i),f
	skipnc
	incf	(DelayDs@i+1),f
	movlw	high(01h)
	addwf	(DelayDs@i+1),f
	
l1186:	
	movf	(DelayDs@i+1),w
	xorlw	80h
	movwf	(??_DelayDs+0)+0
	movf	(DelayDs@cnt+1),w
	xorlw	80h
	subwf	(??_DelayDs+0)+0,w
	skipz
	goto	u3415
	movf	(DelayDs@cnt),w
	subwf	(DelayDs@i),w
u3415:

	skipc
	goto	u3411
	goto	u3410
u3411:
	goto	l4380
u3410:
	goto	l1189
	
l1188:	
	line	570
	
l1189:	
	return
	opt stack 0
GLOBAL	__end_of_DelayDs
	__end_of_DelayDs:
;; =============== function _DelayDs ends ============

	signat	_DelayDs,4216
	global	_strstr
psect	text833,local,class=CODE,delta=2
global __ptext833
__ptext833:

;; *************** function _strstr *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\strstr.c"
;; Parameters:    Size  Location     Type
;;  s1              1    wreg     PTR const unsigned char 
;;		 -> NULL(0), TransmittedString(30), 
;;  s2              1   16[BANK0 ] PTR const unsigned char 
;;		 -> STR_16(5), STR_15(6), STR_14(6), STR_13(8), 
;;		 -> STR_10(7), STR_7(9), STR_6(7), STR_5(8), 
;;		 -> STR_4(7), STR_3(7), STR_2(8), STR_1(8), 
;; Auto vars:     Size  Location     Type
;;  s1              1   20[BANK0 ] PTR const unsigned char 
;;		 -> NULL(0), TransmittedString(30), 
;; Return value:  Size  Location     Type
;;                  1    wreg      PTR unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       1       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0       5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_strlen
;;		_strncmp
;;		_strchr
;; This function is called by:
;;		_TransmittedDataHandler
;; This function uses a non-reentrant model
;;
psect	text833
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\strstr.c"
	line	5
	global	__size_of_strstr
	__size_of_strstr	equ	__end_of_strstr-_strstr
	
_strstr:	
	opt	stack 2
; Regs used in _strstr: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;strstr@s1 stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(strstr@s1)
	line	6
	
l4360:	
	goto	l4370
	
l2205:	
	line	7
	
l4362:	
	movf	(strstr@s2),w
	movwf	(??_strstr+0)+0
	movf	(??_strstr+0)+0,w
	movwf	(?_strncmp)
	movf	(strstr@s2),w
	fcall	_strlen
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?_strlen)),w
	clrf	1+(?_strncmp)+01h
	addwf	1+(?_strncmp)+01h
	movf	(0+(?_strlen)),w
	clrf	0+(?_strncmp)+01h
	addwf	0+(?_strncmp)+01h

	movf	(strstr@s1),w
	fcall	_strncmp
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	((1+(?_strncmp))),w
	iorwf	((0+(?_strncmp))),w
	skipz
	goto	u3381
	goto	u3380
u3381:
	goto	l4368
u3380:
	line	8
	
l4364:	
	movf	(strstr@s1),w
	goto	l2207
	
l4366:	
	goto	l2207
	
l2206:	
	line	9
	
l4368:	
	movf	(strstr@s2),w
	movwf	fsr0
	fcall	stringdir
	movwf	(??_strstr+0)+0
	clrf	(??_strstr+0)+0+1
	movf	0+(??_strstr+0)+0,w
	movwf	(?_strchr)
	movf	1+(??_strstr+0)+0,w
	movwf	(?_strchr+1)
	movf	(strstr@s1),w
	addlw	01h
	fcall	_strchr
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_strstr+2)+0
	movf	(??_strstr+2)+0,w
	movwf	(strstr@s1)
	goto	l4370
	line	10
	
l2204:	
	line	6
	
l4370:	
	movf	(strstr@s1),w
	skipz
	goto	u3390
	goto	l4374
u3390:
	
l4372:	
	movf	(strstr@s1),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,f
	skipz
	goto	u3401
	goto	u3400
u3401:
	goto	l4362
u3400:
	goto	l4374
	
l2209:	
	goto	l4374
	
l2210:	
	line	11
	
l4374:	
	movlw	(0)
	goto	l2207
	
l4376:	
	line	12
	
l2207:	
	return
	opt stack 0
GLOBAL	__end_of_strstr
	__end_of_strstr:
;; =============== function _strstr ends ============

	signat	_strstr,8313
	global	_RegisterSet
psect	text834,local,class=CODE,delta=2
global __ptext834
__ptext834:

;; *************** function _RegisterSet *****************
;; Defined at:
;;		line 766 in file "C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
;; Parameters:    Size  Location     Type
;;  adress          1    wreg     unsigned char 
;;  value           1    3[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  adress          1    6[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       1       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_WriteSPI
;; This function is called by:
;;		_TransiverToReceive
;;		_TransmittString
;;		_TransiverInit
;;		_FindChannel
;;		_SetRFMode
;; This function uses a non-reentrant model
;;
psect	text834
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	766
	global	__size_of_RegisterSet
	__size_of_RegisterSet	equ	__end_of_RegisterSet-_RegisterSet
	
_RegisterSet:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in _RegisterSet: [wreg+status,2+status,0+pclath+cstack]
;RegisterSet@adress stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(RegisterSet@adress)
	line	767
	
l4350:	
;Main Card V10.0.c: 767: PORTAbits.RA4 = 0;
	bcf	(5),4	;volatile
	line	768
	
l4352:	
;Main Card V10.0.c: 768: adress = (adress<<1);
	movf	(RegisterSet@adress),w
	movwf	(??_RegisterSet+0)+0
	addwf	(??_RegisterSet+0)+0,w
	movwf	(??_RegisterSet+1)+0
	movf	(??_RegisterSet+1)+0,w
	movwf	(RegisterSet@adress)
	line	769
	
l4354:	
;Main Card V10.0.c: 769: WriteSPI(adress);
	movf	(RegisterSet@adress),w
	fcall	_WriteSPI
	line	770
	
l4356:	
;Main Card V10.0.c: 770: WriteSPI(value);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(RegisterSet@value),w
	fcall	_WriteSPI
	line	771
	
l4358:	
;Main Card V10.0.c: 771: PORTAbits.RA4 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(5),4	;volatile
	line	772
	
l1233:	
	return
	opt stack 0
GLOBAL	__end_of_RegisterSet
	__end_of_RegisterSet:
;; =============== function _RegisterSet ends ============

	signat	_RegisterSet,8312
	global	_strchr
psect	text835,local,class=CODE,delta=2
global __ptext835
__ptext835:

;; *************** function _strchr *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\strchr.c"
;; Parameters:    Size  Location     Type
;;  ptr             1    wreg     PTR const unsigned char 
;;		 -> NULL(0), TransmittedString(30), 
;;  chr             2    0[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  ptr             1    2[BANK0 ] PTR const unsigned char 
;;		 -> NULL(0), TransmittedString(30), 
;; Return value:  Size  Location     Type
;;                  1    wreg      PTR unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_strstr
;; This function uses a non-reentrant model
;;
psect	text835
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\strchr.c"
	line	5
	global	__size_of_strchr
	__size_of_strchr	equ	__end_of_strchr-_strchr
	
_strchr:	
	opt	stack 2
; Regs used in _strchr: [wreg-fsr0h+status,2+status,0]
;strchr@ptr stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(strchr@ptr)
	line	6
	
l2551:	
	line	7
	
l4332:	
	movf	(strchr@ptr),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	xorwf	(strchr@chr),w
	skipz
	goto	u3361
	goto	u3360
u3361:
	goto	l4338
u3360:
	line	8
	
l4334:	
	movf	(strchr@ptr),w
	goto	l2553
	
l4336:	
	goto	l2553
	
l2552:	
	line	9
	
l4338:	
	movf	(strchr@ptr),w
	movwf	fsr0
	movlw	01h
	addwf	(strchr@ptr),f
	movf	indf,f
	skipz
	goto	u3371
	goto	u3370
u3371:
	goto	l2551
u3370:
	goto	l4340
	
l2554:	
	line	10
	
l4340:	
	movlw	(0)
	goto	l2553
	
l4342:	
	line	11
	
l2553:	
	return
	opt stack 0
GLOBAL	__end_of_strchr
	__end_of_strchr:
;; =============== function _strchr ends ============

	signat	_strchr,8313
	global	_strncmp
psect	text836,local,class=CODE,delta=2
global __ptext836
__ptext836:

;; *************** function _strncmp *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\strncmp.c"
;; Parameters:    Size  Location     Type
;;  s1              1    wreg     PTR const unsigned char 
;;		 -> NULL(0), TransmittedString(30), 
;;  s2              1   10[BANK0 ] PTR const unsigned char 
;;		 -> STR_16(5), STR_15(6), STR_14(6), STR_13(8), 
;;		 -> STR_10(7), STR_7(9), STR_6(7), STR_5(8), 
;;		 -> STR_4(7), STR_3(7), STR_2(8), STR_1(8), 
;;  len             2   11[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  s1              1   15[BANK0 ] PTR const unsigned char 
;;		 -> NULL(0), TransmittedString(30), 
;; Return value:  Size  Location     Type
;;                  2   10[BANK0 ] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       3       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_strstr
;; This function uses a non-reentrant model
;;
psect	text836
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\strncmp.c"
	line	5
	global	__size_of_strncmp
	__size_of_strncmp	equ	__end_of_strncmp-_strncmp
	
_strncmp:	
	opt	stack 2
; Regs used in _strncmp: [wreg-fsr0h+status,2+status,0+pclath]
;strncmp@s1 stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(strncmp@s1)
	line	6
	
l4314:	
	goto	l4326
	
l2564:	
	line	7
	
l4316:	
	movf	(strncmp@s1),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf
	skipnz
	goto	u3331
	goto	u3330
u3331:
	goto	l4320
u3330:
	
l4318:	
	movf	(strncmp@s2),w
	movwf	fsr0
	fcall	stringdir
	movwf	(??_strncmp+0)+0
	movf	(strncmp@s1),w
	movwf	fsr0
	movf	indf,w
	xorwf	(??_strncmp+0)+0,w
	skipnz
	goto	u3341
	goto	u3340
u3341:
	goto	l4324
u3340:
	goto	l4320
	
l2567:	
	line	8
	
l4320:	
	movf	(strncmp@s2),w
	movwf	fsr0
	fcall	stringdir
	movwf	(??_strncmp+0)+0
	clrf	(??_strncmp+0)+0+1
	comf	(??_strncmp+0)+0,f
	comf	(??_strncmp+0)+1,f
	incf	(??_strncmp+0)+0,f
	skipnz
	incf	(??_strncmp+0)+1,f
	movf	(strncmp@s1),w
	movwf	fsr0
	movf	indf,w
	addwf	0+(??_strncmp+0)+0,w
	movwf	(?_strncmp)
	movf	1+(??_strncmp+0)+0,w
	skipnc
	incf	1+(??_strncmp+0)+0,w
	movwf	((?_strncmp))+1
	goto	l2568
	
l4322:	
	goto	l2568
	
l2565:	
	line	10
	
l4324:	
	movlw	(01h)
	movwf	(??_strncmp+0)+0
	movf	(??_strncmp+0)+0,w
	addwf	(strncmp@s1),f
	line	11
	movlw	(01h)
	movwf	(??_strncmp+0)+0
	movf	(??_strncmp+0)+0,w
	addwf	(strncmp@s2),f
	goto	l4326
	line	12
	
l2563:	
	line	6
	
l4326:	
	movlw	low(01h)
	subwf	(strncmp@len),f
	movlw	high(01h)
	skipc
	decf	(strncmp@len+1),f
	subwf	(strncmp@len+1),f
	movlw	high(0FFFFh)
	xorwf	((strncmp@len+1)),w
	skipz
	goto	u3355
	movlw	low(0FFFFh)
	xorwf	((strncmp@len)),w
u3355:

	skipz
	goto	u3351
	goto	u3350
u3351:
	goto	l4316
u3350:
	goto	l4328
	
l2569:	
	line	13
	
l4328:	
	clrf	(?_strncmp)
	clrf	(?_strncmp+1)
	goto	l2568
	
l4330:	
	line	14
	
l2568:	
	return
	opt stack 0
GLOBAL	__end_of_strncmp
	__end_of_strncmp:
;; =============== function _strncmp ends ============

	signat	_strncmp,12410
	global	_strlen
psect	text837,local,class=CODE,delta=2
global __ptext837
__ptext837:

;; *************** function _strlen *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\strlen.c"
;; Parameters:    Size  Location     Type
;;  s               1    wreg     PTR const unsigned char 
;;		 -> STR_16(5), STR_15(6), STR_14(6), STR_13(8), 
;;		 -> STR_10(7), STR_7(9), STR_6(7), STR_5(8), 
;;		 -> STR_4(7), STR_3(7), STR_2(8), STR_1(8), 
;; Auto vars:     Size  Location     Type
;;  s               1    8[BANK0 ] PTR const unsigned char 
;;		 -> STR_16(5), STR_15(6), STR_14(6), STR_13(8), 
;;		 -> STR_10(7), STR_7(9), STR_6(7), STR_5(8), 
;;		 -> STR_4(7), STR_3(7), STR_2(8), STR_1(8), 
;;  cp              1    9[BANK0 ] PTR const unsigned char 
;;		 -> STR_16(5), STR_15(6), STR_14(6), STR_13(8), 
;;		 -> STR_10(7), STR_7(9), STR_6(7), STR_5(8), 
;;		 -> STR_4(7), STR_3(7), STR_2(8), STR_1(8), 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       6       0       0       0
;;      Totals:         0      10       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_strstr
;; This function uses a non-reentrant model
;;
psect	text837
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\strlen.c"
	line	5
	global	__size_of_strlen
	__size_of_strlen	equ	__end_of_strlen-_strlen
	
_strlen:	
	opt	stack 2
; Regs used in _strlen: [wreg-fsr0h+status,2+status,0+pclath]
;strlen@s stored from wreg
	line	8
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(strlen@s)
	
l4306:	
	movf	(strlen@s),w
	movwf	(??_strlen+0)+0
	movf	(??_strlen+0)+0,w
	movwf	(strlen@cp)
	line	9
	goto	l4308
	
l2558:	
	line	10
	goto	l4308
	
l2557:	
	line	9
	
l4308:	
	movlw	01h
	addwf	(strlen@cp),f
	movlw	-01h
	addwf	(strlen@cp),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u3321
	goto	u3320
u3321:
	goto	l4308
u3320:
	goto	l4310
	
l2559:	
	line	11
	
l4310:	
	movf	(strlen@s),w
	movwf	(??_strlen+0)+0
	movlw	80h
	movwf	(??_strlen+0)+0+1
	comf	(??_strlen+0)+0,f
	comf	(??_strlen+0)+1,f
	incf	(??_strlen+0)+0,f
	skipnz
	incf	(??_strlen+0)+1,f
	movf	(strlen@cp),w
	movwf	(??_strlen+2)+0
	movlw	80h
	movwf	(??_strlen+2)+0+1
	movf	0+(??_strlen+0)+0,w
	addwf	0+(??_strlen+2)+0,w
	movwf	(??_strlen+4)+0
	movf	1+(??_strlen+0)+0,w
	skipnc
	incf	1+(??_strlen+0)+0,w
	addwf	1+(??_strlen+2)+0,w
	movwf	1+(??_strlen+4)+0
	movf	0+(??_strlen+4)+0,w
	addlw	low(-1)
	movwf	(?_strlen)
	movf	1+(??_strlen+4)+0,w
	skipnc
	addlw	1
	addlw	high(-1)
	movwf	1+(?_strlen)
	goto	l2560
	
l4312:	
	line	12
	
l2560:	
	return
	opt stack 0
GLOBAL	__end_of_strlen
	__end_of_strlen:
;; =============== function _strlen ends ============

	signat	_strlen,4218
	global	_WriteSPI
psect	text838,local,class=CODE,delta=2
global __ptext838
__ptext838:

;; *************** function _WriteSPI *****************
;; Defined at:
;;		line 575 in file "C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
;; Parameters:    Size  Location     Type
;;  databyte        1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  databyte        1    2[BANK0 ] unsigned char 
;;  buffer          1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ReadSPI
;;		_RegisterRead
;;		_RegisterSet
;;		_WriteFIFO
;; This function uses a non-reentrant model
;;
psect	text838
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	575
	global	__size_of_WriteSPI
	__size_of_WriteSPI	equ	__end_of_WriteSPI-_WriteSPI
	
_WriteSPI:	
	opt	stack 1
; Regs used in _WriteSPI: [wreg]
;WriteSPI@databyte stored from wreg
	line	577
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(WriteSPI@databyte)
	
l4238:	
;Main Card V10.0.c: 576: unsigned char buffer;
;Main Card V10.0.c: 577: buffer = SSPBUF;
	movf	(19),w	;volatile
	movwf	(??_WriteSPI+0)+0
	movf	(??_WriteSPI+0)+0,w
	movwf	(WriteSPI@buffer)
	line	578
	
l4240:	
;Main Card V10.0.c: 578: PIR1bits.SSPIF=0;
	bcf	(12),3	;volatile
	line	579
;Main Card V10.0.c: 579: SSPBUF = databyte;
	movf	(WriteSPI@databyte),w
	movwf	(19)	;volatile
	line	580
;Main Card V10.0.c: 580: while(PIR1bits.SSPIF == 0);
	goto	l1192
	
l1193:	
	
l1192:	
	btfss	(12),3	;volatile
	goto	u3161
	goto	u3160
u3161:
	goto	l1192
u3160:
	
l1194:	
	line	581
;Main Card V10.0.c: 581: PIR1bits.SSPIF = 0;
	bcf	(12),3	;volatile
	line	582
	
l1195:	
	return
	opt stack 0
GLOBAL	__end_of_WriteSPI
	__end_of_WriteSPI:
;; =============== function _WriteSPI ends ============

	signat	_WriteSPI,4216
	global	_timerFunction
psect	text839,local,class=CODE,delta=2
global __ptext839
__ptext839:

;; *************** function _timerFunction *****************
;; Defined at:
;;		line 468 in file "C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
;; Parameters:    Size  Location     Type
;;  intTimerNumb    2    0[BANK0 ] int 
;;  intSetSecond    2    2[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_TransiverToReceive
;;		_TransiverReadFIFO
;;		_TransmittString
;;		_LightWithSensController
;; This function uses a non-reentrant model
;;
psect	text839
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	468
	global	__size_of_timerFunction
	__size_of_timerFunction	equ	__end_of_timerFunction-_timerFunction
	
_timerFunction:	
	opt	stack 2
; Regs used in _timerFunction: [wreg-fsr0h+status,2+status,0]
	line	469
	
l4218:	
;Main Card V10.0.c: 469: intClockTimer[intTimerNumber] = intSetSeconds;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(timerFunction@intTimerNumber),w
	movwf	(??_timerFunction+0)+0
	addwf	(??_timerFunction+0)+0,w
	addlw	_intClockTimer&0ffh
	movwf	fsr0
	movf	(timerFunction@intSetSeconds),w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	incf	fsr0,f
	movf	(timerFunction@intSetSeconds+1),w
	movwf	indf
	line	470
;Main Card V10.0.c: 470: bTimerComplete[intTimerNumber] = 0;
	movf	(timerFunction@intTimerNumber),w
	addlw	_bTimerComplete&0ffh
	movwf	fsr0
	clrf	indf
	goto	l1170
	line	471
	
l4220:	
	line	472
;Main Card V10.0.c: 471: return 1;
;	Return value of _timerFunction is never used
	
l1170:	
	return
	opt stack 0
GLOBAL	__end_of_timerFunction
	__end_of_timerFunction:
;; =============== function _timerFunction ends ============

	signat	_timerFunction,8313
	global	_OperationMode
psect	text840,local,class=CODE,delta=2
global __ptext840
__ptext840:

;; *************** function _OperationMode *****************
;; Defined at:
;;		line 975 in file "C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  bracketStatu    1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_TransmittedDataHandler
;; This function uses a non-reentrant model
;;
psect	text840
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	975
	global	__size_of_OperationMode
	__size_of_OperationMode	equ	__end_of_OperationMode-_OperationMode
	
_OperationMode:	
	opt	stack 3
; Regs used in _OperationMode: [wreg+status,2]
	line	977
	
l4212:	
;Main Card V10.0.c: 976: unsigned char bracketStatus;
;Main Card V10.0.c: 977: bracketStatus = ((~PORTB) & 0b00000111) ;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	comf	(6),w	;volatile
	andlw	07h
	movwf	(??_OperationMode+0)+0
	movf	(??_OperationMode+0)+0,w
	movwf	(OperationMode@bracketStatus)
	line	979
	
l4214:	
;Main Card V10.0.c: 979: return bracketStatus;
	movf	(OperationMode@bracketStatus),w
	goto	l1269
	
l4216:	
	line	980
	
l1269:	
	return
	opt stack 0
GLOBAL	__end_of_OperationMode
	__end_of_OperationMode:
;; =============== function _OperationMode ends ============

	signat	_OperationMode,89
	global	_init
psect	text841,local,class=CODE,delta=2
global __ptext841
__ptext841:

;; *************** function _init *****************
;; Defined at:
;;		line 503 in file "C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text841
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	503
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 5
; Regs used in _init: [wreg+status,2+status,0]
	line	505
	
l4140:	
;Main Card V10.0.c: 505: OSCCONbits.IRCF2 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(143)^080h,6	;volatile
	line	506
;Main Card V10.0.c: 506: OSCCONbits.IRCF1 = 1;
	bsf	(143)^080h,5	;volatile
	line	507
;Main Card V10.0.c: 507: OSCCONbits.IRCF0 = 0;
	bcf	(143)^080h,4	;volatile
	line	508
;Main Card V10.0.c: 508: OSCCONbits.SCS = 1;
	bsf	(143)^080h,0	;volatile
	line	511
	
l4142:	
;Main Card V10.0.c: 511: PORTA = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	512
;Main Card V10.0.c: 512: PORTB = 0x00;
	clrf	(6)	;volatile
	line	513
;Main Card V10.0.c: 513: PORTC = 0x00;
	clrf	(7)	;volatile
	line	514
	
l4144:	
;Main Card V10.0.c: 514: TRISA = 0b00001011;
	movlw	(0Bh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	515
	
l4146:	
;Main Card V10.0.c: 515: TRISB = 0b00111111;
	movlw	(03Fh)
	movwf	(134)^080h	;volatile
	line	516
	
l4148:	
;Main Card V10.0.c: 516: TRISC = 0b00010000;
	movlw	(010h)
	movwf	(135)^080h	;volatile
	line	517
	
l4150:	
;Main Card V10.0.c: 517: ANSEL = 0b00000000;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	clrf	(392)^0180h	;volatile
	line	518
	
l4152:	
;Main Card V10.0.c: 518: ANSELH = 0b00000000;
	clrf	(393)^0180h	;volatile
	line	519
	
l4154:	
;Main Card V10.0.c: 519: ANSELbits.ANS0 = 1;
	bsf	(392)^0180h,0	;volatile
	line	520
	
l4156:	
;Main Card V10.0.c: 520: ANSELbits.ANS3 = 1;
	bsf	(392)^0180h,3	;volatile
	line	521
	
l4158:	
;Main Card V10.0.c: 521: OPTION_REGbits.nRBPU = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(129)^080h,7	;volatile
	line	522
	
l4160:	
;Main Card V10.0.c: 522: WPUBbits.WPUB5 = 0;
	bcf	(149)^080h,5	;volatile
	line	523
;Main Card V10.0.c: 523: while(!PORTBbits.RB5);
	goto	l1180
	
l1181:	
	
l1180:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(6),5	;volatile
	goto	u3121
	goto	u3120
u3121:
	goto	l1180
u3120:
	goto	l4162
	
l1182:	
	line	526
	
l4162:	
;Main Card V10.0.c: 526: SSPCONbits.SSPM=0x00;
	movlw	((0 & ((1<<4)-1))<<0)|not (((1<<4)-1)<<0)
	andwf	(20),f	;volatile
	line	527
	
l4164:	
;Main Card V10.0.c: 527: SSPCONbits.CKP=0;
	bcf	(20),4	;volatile
	line	528
	
l4166:	
;Main Card V10.0.c: 528: SSPSTATbits.CKE=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(148)^080h,6	;volatile
	line	529
	
l4168:	
;Main Card V10.0.c: 529: SSPSTATbits.SMP=0;
	bcf	(148)^080h,7	;volatile
	line	530
	
l4170:	
;Main Card V10.0.c: 530: SSPCONbits.SSPEN=0x01;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(20),5	;volatile
	line	531
	
l4172:	
;Main Card V10.0.c: 531: SSPIE = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1123/8)^080h,(1123)&7
	line	534
	
l4174:	
;Main Card V10.0.c: 534: PORTAbits.RA5 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(5),5	;volatile
	line	535
	
l4176:	
;Main Card V10.0.c: 535: PORTAbits.RA4 = 1;
	bsf	(5),4	;volatile
	line	538
	
l4178:	
;Main Card V10.0.c: 538: INTCONbits.RBIE = 1;
	bsf	(11),3	;volatile
	line	539
	
l4180:	
;Main Card V10.0.c: 539: INTCONbits.PEIE = 1;
	bsf	(11),6	;volatile
	line	540
	
l4182:	
;Main Card V10.0.c: 540: PIE1bits.TMR1IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(140)^080h,0	;volatile
	line	541
	
l4184:	
;Main Card V10.0.c: 541: INTCONbits.GIE = 1;
	bsf	(11),7	;volatile
	line	542
	
l4186:	
;Main Card V10.0.c: 542: IOCBbits.IOCB5 = 1;
	bsf	(150)^080h,5	;volatile
	line	545
	
l4188:	
;Main Card V10.0.c: 545: T1CON = 0b00110000;
	movlw	(030h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(16)	;volatile
	line	546
	
l4190:	
;Main Card V10.0.c: 546: TMR1H = 0x0B;
	movlw	(0Bh)
	movwf	(15)	;volatile
	line	547
	
l4192:	
;Main Card V10.0.c: 547: TMR1L = 0xDB;
	movlw	(0DBh)
	movwf	(14)	;volatile
	line	548
	
l4194:	
;Main Card V10.0.c: 548: T1CONbits.TMR1ON = 1;
	bsf	(16),0	;volatile
	line	551
	
l4196:	
;Main Card V10.0.c: 551: ADCON0bits.ADCS0 = 0;
	bcf	(31),6	;volatile
	line	552
	
l4198:	
;Main Card V10.0.c: 552: ADCON0bits.ADCS1 = 0;
	bcf	(31),7	;volatile
	line	553
	
l4200:	
;Main Card V10.0.c: 553: ADCON1bits.ADFM = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(159)^080h,7	;volatile
	line	554
	
l4202:	
;Main Card V10.0.c: 554: ADCON1bits.VCFG1 = 0;
	bcf	(159)^080h,5	;volatile
	line	555
	
l4204:	
;Main Card V10.0.c: 555: ADCON1bits.VCFG0 = 0;
	bcf	(159)^080h,4	;volatile
	line	558
	
l4206:	
;Main Card V10.0.c: 558: intSecondCounter = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_intSecondCounter)
	clrf	(_intSecondCounter+1)
	line	559
	
l4208:	
;Main Card V10.0.c: 559: intHalfSecondCounter = 0;
	clrf	(_intHalfSecondCounter)
	clrf	(_intHalfSecondCounter+1)
	line	560
	
l4210:	
;Main Card V10.0.c: 560: intMinuteCounter = 0;
	clrf	(_intMinuteCounter)
	clrf	(_intMinuteCounter+1)
	line	561
	
l1183:	
	return
	opt stack 0
GLOBAL	__end_of_init
	__end_of_init:
;; =============== function _init ends ============

	signat	_init,88
	global	_tc_int
psect	text842,local,class=CODE,delta=2
global __ptext842
__ptext842:

;; *************** function _tc_int *****************
;; Defined at:
;;		line 842 in file "C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          7       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		i1_OperationMode
;;		_TimerCounter
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text842
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	842
	global	__size_of_tc_int
	__size_of_tc_int	equ	__end_of_tc_int-_tc_int
	
_tc_int:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in _tc_int: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_tc_int+3)
	movf	fsr0,w
	movwf	(??_tc_int+4)
	movf	pclath,w
	movwf	(??_tc_int+5)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_tc_int+6)
	ljmp	_tc_int
psect	text842
	line	846
	
i1l4242:	
;Main Card V10.0.c: 846: if((PORTBbits.RB5 == 0)&&(intBlinkCycle == 0)&&(OperationMode() < 2)){
	btfsc	(6),5	;volatile
	goto	u317_21
	goto	u317_20
u317_21:
	goto	i1l4252
u317_20:
	
i1l4244:	
	movf	((_intBlinkCycle+1)),w
	iorwf	((_intBlinkCycle)),w
	skipz
	goto	u318_21
	goto	u318_20
u318_21:
	goto	i1l4252
u318_20:
	
i1l4246:	
	fcall	i1_OperationMode
	movwf	(??_tc_int+0)+0
	movlw	(02h)
	subwf	0+(??_tc_int+0)+0,w
	skipnc
	goto	u319_21
	goto	u319_20
u319_21:
	goto	i1l4252
u319_20:
	line	847
	
i1l4248:	
;Main Card V10.0.c: 847: intBlinkCycle = 1;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_intBlinkCycle)
	movlw	high(01h)
	movwf	((_intBlinkCycle))+1
	line	848
	
i1l4250:	
;Main Card V10.0.c: 848: intBlinkCounter = 0;
	clrf	(_intBlinkCounter)
	clrf	(_intBlinkCounter+1)
	goto	i1l4252
	line	850
	
i1l1242:	
	line	851
	
i1l4252:	
;Main Card V10.0.c: 850: }
;Main Card V10.0.c: 851: if(TMR1IF ==1){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(96/8),(96)&7
	goto	u320_21
	goto	u320_20
u320_21:
	goto	i1l4298
u320_20:
	line	852
	
i1l4254:	
;Main Card V10.0.c: 852: TMR1ON = 0;
	bcf	(128/8),(128)&7
	line	853
	
i1l4256:	
;Main Card V10.0.c: 853: TMR1H = 0x0B;
	movlw	(0Bh)
	movwf	(15)	;volatile
	line	854
;Main Card V10.0.c: 854: TMR1L = 0xDB;
	movlw	(0DBh)
	movwf	(14)	;volatile
	line	856
;Main Card V10.0.c: 856: if((intBlinkCycle == 1)&&(intBlinkCounter<intNumberOfBlinks*2)){
	movlw	01h
	xorwf	(_intBlinkCycle),w
	iorwf	(_intBlinkCycle+1),w
	skipz
	goto	u321_21
	goto	u321_20
u321_21:
	goto	i1l4268
u321_20:
	
i1l4258:	
	movf	(_intNumberOfBlinks+1),w
	movwf	(??_tc_int+0)+0+1
	movf	(_intNumberOfBlinks),w
	movwf	(??_tc_int+0)+0
	movlw	01h
	movwf	btemp+1
u322_25:
	clrc
	rlf	(??_tc_int+0)+0,f
	rlf	(??_tc_int+0)+1,f
	decfsz	btemp+1,f
	goto	u322_25
	movf	(_intBlinkCounter+1),w
	xorlw	80h
	movwf	(??_tc_int+2)+0
	movf	1+(??_tc_int+0)+0,w
	xorlw	80h
	subwf	(??_tc_int+2)+0,w
	skipz
	goto	u323_25
	movf	0+(??_tc_int+0)+0,w
	subwf	(_intBlinkCounter),w
u323_25:

	skipnc
	goto	u323_21
	goto	u323_20
u323_21:
	goto	i1l4268
u323_20:
	line	857
	
i1l4260:	
;Main Card V10.0.c: 857: intBlinkCounter++;
	movlw	low(01h)
	addwf	(_intBlinkCounter),f
	skipnc
	incf	(_intBlinkCounter+1),f
	movlw	high(01h)
	addwf	(_intBlinkCounter+1),f
	line	859
	
i1l4262:	
;Main Card V10.0.c: 859: if(PORTCbits.RC1 == 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(7),1	;volatile
	goto	u324_21
	goto	u324_20
u324_21:
	goto	i1l1245
u324_20:
	line	860
	
i1l4264:	
;Main Card V10.0.c: 860: PORTCbits.RC1 = 1;
	bsf	(7),1	;volatile
	goto	i1l4276
	line	861
	
i1l1245:	
;Main Card V10.0.c: 861: else if(PORTCbits.RC1 == 1)
	btfss	(7),1	;volatile
	goto	u325_21
	goto	u325_20
u325_21:
	goto	i1l4276
u325_20:
	line	862
	
i1l4266:	
;Main Card V10.0.c: 862: PORTCbits.RC1 = 0;
	bcf	(7),1	;volatile
	goto	i1l4276
	
i1l1247:	
	goto	i1l4276
	line	863
	
i1l1246:	
;Main Card V10.0.c: 863: }
	goto	i1l4276
	line	865
	
i1l1244:	
	
i1l4268:	
;Main Card V10.0.c: 865: else if((intBlinkCycle == 1)&&(intBlinkCounter >=intNumberOfBlinks*2)){
	movlw	01h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(_intBlinkCycle),w
	iorwf	(_intBlinkCycle+1),w
	skipz
	goto	u326_21
	goto	u326_20
u326_21:
	goto	i1l4276
u326_20:
	
i1l4270:	
	movf	(_intNumberOfBlinks+1),w
	movwf	(??_tc_int+0)+0+1
	movf	(_intNumberOfBlinks),w
	movwf	(??_tc_int+0)+0
	movlw	01h
	movwf	btemp+1
u327_25:
	clrc
	rlf	(??_tc_int+0)+0,f
	rlf	(??_tc_int+0)+1,f
	decfsz	btemp+1,f
	goto	u327_25
	movf	(_intBlinkCounter+1),w
	xorlw	80h
	movwf	(??_tc_int+2)+0
	movf	1+(??_tc_int+0)+0,w
	xorlw	80h
	subwf	(??_tc_int+2)+0,w
	skipz
	goto	u328_25
	movf	0+(??_tc_int+0)+0,w
	subwf	(_intBlinkCounter),w
u328_25:

	skipc
	goto	u328_21
	goto	u328_20
u328_21:
	goto	i1l4276
u328_20:
	line	866
	
i1l4272:	
;Main Card V10.0.c: 866: intBlinkCycle = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_intBlinkCycle)
	clrf	(_intBlinkCycle+1)
	line	867
	
i1l4274:	
;Main Card V10.0.c: 867: PORTCbits.RC1 = 0;
	bcf	(7),1	;volatile
	goto	i1l4276
	line	868
	
i1l1249:	
	goto	i1l4276
	line	871
	
i1l1248:	
	
i1l4276:	
;Main Card V10.0.c: 868: }
;Main Card V10.0.c: 871: intHalfSecondCounter++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_intHalfSecondCounter),f
	skipnc
	incf	(_intHalfSecondCounter+1),f
	movlw	high(01h)
	addwf	(_intHalfSecondCounter+1),f
	line	872
	
i1l4278:	
;Main Card V10.0.c: 872: if(intHalfSecondCounter>=2)
	movf	(_intHalfSecondCounter+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(02h))^80h
	subwf	btemp+1,w
	skipz
	goto	u329_25
	movlw	low(02h)
	subwf	(_intHalfSecondCounter),w
u329_25:

	skipc
	goto	u329_21
	goto	u329_20
u329_21:
	goto	i1l4286
u329_20:
	line	874
	
i1l4280:	
;Main Card V10.0.c: 873: {
;Main Card V10.0.c: 874: intHalfSecondCounter = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_intHalfSecondCounter)
	clrf	(_intHalfSecondCounter+1)
	line	875
	
i1l4282:	
;Main Card V10.0.c: 875: intSecondCounter++;
	movlw	low(01h)
	addwf	(_intSecondCounter),f
	skipnc
	incf	(_intSecondCounter+1),f
	movlw	high(01h)
	addwf	(_intSecondCounter+1),f
	line	876
	
i1l4284:	
;Main Card V10.0.c: 876: TimerCounter();
	fcall	_TimerCounter
	goto	i1l4286
	line	877
	
i1l1250:	
	line	878
	
i1l4286:	
;Main Card V10.0.c: 877: }
;Main Card V10.0.c: 878: if(intSecondCounter >=60)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_intSecondCounter+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03Ch))^80h
	subwf	btemp+1,w
	skipz
	goto	u330_25
	movlw	low(03Ch)
	subwf	(_intSecondCounter),w
u330_25:

	skipc
	goto	u330_21
	goto	u330_20
u330_21:
	goto	i1l4292
u330_20:
	line	880
	
i1l4288:	
;Main Card V10.0.c: 879: {
;Main Card V10.0.c: 880: intSecondCounter = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_intSecondCounter)
	clrf	(_intSecondCounter+1)
	line	881
	
i1l4290:	
;Main Card V10.0.c: 881: intMinuteCounter++;
	movlw	low(01h)
	addwf	(_intMinuteCounter),f
	skipnc
	incf	(_intMinuteCounter+1),f
	movlw	high(01h)
	addwf	(_intMinuteCounter+1),f
	goto	i1l4292
	line	882
	
i1l1251:	
	line	883
	
i1l4292:	
;Main Card V10.0.c: 882: }
;Main Card V10.0.c: 883: if(intMinuteCounter >= 60)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_intMinuteCounter+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03Ch))^80h
	subwf	btemp+1,w
	skipz
	goto	u331_25
	movlw	low(03Ch)
	subwf	(_intMinuteCounter),w
u331_25:

	skipc
	goto	u331_21
	goto	u331_20
u331_21:
	goto	i1l4296
u331_20:
	line	885
	
i1l4294:	
;Main Card V10.0.c: 884: {
;Main Card V10.0.c: 885: intMinuteCounter = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_intMinuteCounter)
	clrf	(_intMinuteCounter+1)
	goto	i1l4296
	line	886
	
i1l1252:	
	line	889
	
i1l4296:	
;Main Card V10.0.c: 886: }
;Main Card V10.0.c: 889: TMR1ON = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(128/8),(128)&7
	goto	i1l4298
	line	890
	
i1l1243:	
	line	891
	
i1l4298:	
;Main Card V10.0.c: 890: }
;Main Card V10.0.c: 891: TMR1IF = 0;
	bcf	(96/8),(96)&7
	line	892
	
i1l4300:	
;Main Card V10.0.c: 892: RBIF = 0;
	bcf	(88/8),(88)&7
	line	893
	
i1l4302:	
;Main Card V10.0.c: 893: GIE = 1;
	bsf	(95/8),(95)&7
	goto	i1l1253
	line	894
	
i1l4304:	
	line	895
;Main Card V10.0.c: 894: return;
	
i1l1253:	
	movf	(??_tc_int+6),w
	movwf	btemp+1
	movf	(??_tc_int+5),w
	movwf	pclath
	movf	(??_tc_int+4),w
	movwf	fsr0
	swapf	(??_tc_int+3)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_tc_int
	__end_of_tc_int:
;; =============== function _tc_int ends ============

	signat	_tc_int,88
	global	i1_OperationMode
psect	text843,local,class=CODE,delta=2
global __ptext843
__ptext843:

;; *************** function i1_OperationMode *****************
;; Defined at:
;;		line 975 in file "C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  OperationMod    1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_tc_int
;; This function uses a non-reentrant model
;;
psect	text843
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	975
	global	__size_ofi1_OperationMode
	__size_ofi1_OperationMode	equ	__end_ofi1_OperationMode-i1_OperationMode
	
i1_OperationMode:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in i1_OperationMode: [wreg+status,2]
	line	977
	
i1l4344:	
;Main Card V10.0.c: 976: unsigned char bracketStatus;
;Main Card V10.0.c: 977: bracketStatus = ((~PORTB) & 0b00000111) ;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	comf	(6),w	;volatile
	andlw	07h
	movwf	(??i1_OperationMode+0)+0
	movf	(??i1_OperationMode+0)+0,w
	movwf	(i1OperationMode@bracketStatus)
	line	979
	
i1l4346:	
;Main Card V10.0.c: 979: return bracketStatus;
	movf	(i1OperationMode@bracketStatus),w
	goto	i1l1269
	
i1l4348:	
	line	980
	
i1l1269:	
	return
	opt stack 0
GLOBAL	__end_ofi1_OperationMode
	__end_ofi1_OperationMode:
;; =============== function i1_OperationMode ends ============

	signat	i1_OperationMode,89
	global	_TimerCounter
psect	text844,local,class=CODE,delta=2
global __ptext844
__ptext844:

;; *************** function _TimerCounter *****************
;; Defined at:
;;		line 490 in file "C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    3[COMMON] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_tc_int
;; This function uses a non-reentrant model
;;
psect	text844
	file	"C:\Users\Seba\Documents\Projekt\Bustel\Bustel_Project\Bustel Card v10.0 code v1.7.1\Main Card V10.0.c"
	line	490
	global	__size_of_TimerCounter
	__size_of_TimerCounter	equ	__end_of_TimerCounter-_TimerCounter
	
_TimerCounter:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in _TimerCounter: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	491
	
i1l4222:	
;Main Card V10.0.c: 491: for (int i = 0; i < 5; i++)
	clrf	(TimerCounter@i)
	clrf	(TimerCounter@i+1)
	
i1l4224:	
	movf	(TimerCounter@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(05h))^80h
	subwf	btemp+1,w
	skipz
	goto	u313_25
	movlw	low(05h)
	subwf	(TimerCounter@i),w
u313_25:

	skipc
	goto	u313_21
	goto	u313_20
u313_21:
	goto	i1l4228
u313_20:
	goto	i1l1177
	
i1l4226:	
	goto	i1l1177
	line	492
	
i1l1173:	
	line	493
	
i1l4228:	
;Main Card V10.0.c: 492: {
;Main Card V10.0.c: 493: if(intClockTimer[i]>0)
	movf	(TimerCounter@i),w
	movwf	(??_TimerCounter+0)+0
	addwf	(??_TimerCounter+0)+0,w
	addlw	_intClockTimer&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(??_TimerCounter+1)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_TimerCounter+1)+0+1
	movf	1+(??_TimerCounter+1)+0,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01h))^80h
	subwf	btemp+1,w
	skipz
	goto	u314_25
	movlw	low(01h)
	subwf	0+(??_TimerCounter+1)+0,w
u314_25:

	skipc
	goto	u314_21
	goto	u314_20
u314_21:
	goto	i1l4232
u314_20:
	line	494
	
i1l4230:	
;Main Card V10.0.c: 494: intClockTimer[i]--;
	movf	(TimerCounter@i),w
	movwf	(??_TimerCounter+0)+0
	addwf	(??_TimerCounter+0)+0,w
	addlw	_intClockTimer&0ffh
	movwf	fsr0
	movlw	low(-1)
	bcf	status, 7	;select IRP bank1
	addwf	indf,f
	incfsz	fsr0,f
	movf	indf,w
	skipnc
	incf	indf,w
	movwf	btemp+1
	movlw	high(-1)
	addwf	btemp+1,w
	movwf	indf
	decf	fsr0,f
	goto	i1l4234
	line	495
	
i1l1175:	
	line	496
	
i1l4232:	
;Main Card V10.0.c: 495: else
;Main Card V10.0.c: 496: bTimerComplete[i] = 1;
	movf	(TimerCounter@i),w
	addlw	_bTimerComplete&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	clrf	indf
	bsf	status,0
	rlf	indf,f
	goto	i1l4234
	
i1l1176:	
	line	491
	
i1l4234:	
	movlw	low(01h)
	addwf	(TimerCounter@i),f
	skipnc
	incf	(TimerCounter@i+1),f
	movlw	high(01h)
	addwf	(TimerCounter@i+1),f
	
i1l4236:	
	movf	(TimerCounter@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(05h))^80h
	subwf	btemp+1,w
	skipz
	goto	u315_25
	movlw	low(05h)
	subwf	(TimerCounter@i),w
u315_25:

	skipc
	goto	u315_21
	goto	u315_20
u315_21:
	goto	i1l4228
u315_20:
	goto	i1l1177
	
i1l1174:	
	line	498
	
i1l1177:	
	return
	opt stack 0
GLOBAL	__end_of_TimerCounter
	__end_of_TimerCounter:
;; =============== function _TimerCounter ends ============

	signat	_TimerCounter,88
psect	text845,local,class=CODE,delta=2
global __ptext845
__ptext845:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
