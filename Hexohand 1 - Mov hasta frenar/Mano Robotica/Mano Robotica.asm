
_main:

;Mano Robotica.c,48 :: 		void main()
;Mano Robotica.c,50 :: 		TXSTA.SYNC=0;                                       //EUSART en Modo Asincrono
	BCF        TXSTA+0, 4
;Mano Robotica.c,51 :: 		TXSTA.BRGH=0;                                       //EUSART en Baja Velocidad
	BCF        TXSTA+0, 2
;Mano Robotica.c,52 :: 		BAUDCTL.BRG16=0;                                    //Generador de 8 bits para el Baud Rate
	BCF        BAUDCTL+0, 3
;Mano Robotica.c,54 :: 		SPBRG=25;                                           //2400/Segundo, Baud Rate=2400
	MOVLW      25
	MOVWF      SPBRG+0
;Mano Robotica.c,56 :: 		RCSTA.SPEN=1;                                       //Habilita TX y RX como terminales del puerto serial
	BSF        RCSTA+0, 7
;Mano Robotica.c,57 :: 		RCSTA.CREN=1;                                       //Habilita recepcion
	BSF        RCSTA+0, 4
;Mano Robotica.c,58 :: 		TXSTA.TXEN=1;                                       //Habilitacion de la Transmision y Transmision
	BSF        TXSTA+0, 5
;Mano Robotica.c,60 :: 		PIE1.RCIE=1;                                        //Habilitacion de interrupcion por recepcion
	BSF        PIE1+0, 5
;Mano Robotica.c,61 :: 		INTCON.PEIE=1;                                      //Habilitacion de interrupcion por periferico
	BSF        INTCON+0, 6
;Mano Robotica.c,62 :: 		INTCON.GIE=1;                                       //Habilitacion Global de las Interrupciones
	BSF        INTCON+0, 7
;Mano Robotica.c,64 :: 		TRISD=0;                                            //Puerto como salida
	CLRF       TRISD+0
;Mano Robotica.c,65 :: 		TRISA.RA4=1;                                        //RA4 como entrada
	BSF        TRISA+0, 4
;Mano Robotica.c,66 :: 		d1=0;
	CLRF       _d1+0
	CLRF       _d1+1
;Mano Robotica.c,67 :: 		d2=0;
	CLRF       _d2+0
	CLRF       _d2+1
;Mano Robotica.c,68 :: 		d3=0;
	CLRF       _d3+0
	CLRF       _d3+1
;Mano Robotica.c,69 :: 		contador=0;
	CLRF       _contador+0
	CLRF       _contador+1
;Mano Robotica.c,70 :: 		TRISB=~0x3F;
	MOVLW      192
	MOVWF      TRISB+0
;Mano Robotica.c,72 :: 		PORTB=0x3F;
	MOVLW      63
	MOVWF      PORTB+0
;Mano Robotica.c,75 :: 		while(1)
L_main0:
;Mano Robotica.c,77 :: 		if(!PORTA.RA4)                               //Boton presionado
	BTFSC      PORTA+0, 4
	GOTO       L_main2
;Mano Robotica.c,79 :: 		d1=0;
	CLRF       _d1+0
	CLRF       _d1+1
;Mano Robotica.c,80 :: 		d2=0;
	CLRF       _d2+0
	CLRF       _d2+1
;Mano Robotica.c,81 :: 		d3=0;
	CLRF       _d3+0
	CLRF       _d3+1
;Mano Robotica.c,82 :: 		contador=0;
	CLRF       _contador+0
	CLRF       _contador+1
;Mano Robotica.c,83 :: 		while(!PORTA.RA4);                   //Espera a que se libere el boton
L_main3:
	BTFSC      PORTA+0, 4
	GOTO       L_main4
	GOTO       L_main3
L_main4:
;Mano Robotica.c,84 :: 		}
L_main2:
;Mano Robotica.c,85 :: 		}
	GOTO       L_main0
;Mano Robotica.c,86 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Mano Robotica.c,88 :: 		void interrupt()
;Mano Robotica.c,90 :: 		if(PIR1.RCIF)
	BTFSS      PIR1+0, 5
	GOTO       L_interrupt5
;Mano Robotica.c,92 :: 		if(RCREG>47&&RCREG<58)
	MOVF       RCREG+0, 0
	SUBLW      47
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt8
	MOVLW      58
	SUBWF      RCREG+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt8
L__interrupt55:
;Mano Robotica.c,94 :: 		contador++;
	INCF       _contador+0, 1
	BTFSC      STATUS+0, 2
	INCF       _contador+1, 1
;Mano Robotica.c,95 :: 		switch(contador)
	GOTO       L_interrupt9
;Mano Robotica.c,97 :: 		case 1:
L_interrupt11:
;Mano Robotica.c,98 :: 		d1=RCREG-48;
	MOVLW      48
	SUBWF      RCREG+0, 0
	MOVWF      _d1+0
	CLRF       _d1+1
	BTFSS      STATUS+0, 0
	DECF       _d1+1, 1
;Mano Robotica.c,99 :: 		break;
	GOTO       L_interrupt10
;Mano Robotica.c,101 :: 		case 2:
L_interrupt12:
;Mano Robotica.c,102 :: 		d2=RCREG-48;
	MOVLW      48
	SUBWF      RCREG+0, 0
	MOVWF      _d2+0
	CLRF       _d2+1
	BTFSS      STATUS+0, 0
	DECF       _d2+1, 1
;Mano Robotica.c,103 :: 		break;
	GOTO       L_interrupt10
;Mano Robotica.c,105 :: 		case 3:
L_interrupt13:
;Mano Robotica.c,106 :: 		d3=RCREG-48;
	MOVLW      48
	SUBWF      RCREG+0, 0
	MOVWF      _d3+0
	CLRF       _d3+1
	BTFSS      STATUS+0, 0
	DECF       _d3+1, 1
;Mano Robotica.c,107 :: 		break;
	GOTO       L_interrupt10
;Mano Robotica.c,109 :: 		}
L_interrupt9:
	MOVLW      0
	XORWF      _contador+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt59
	MOVLW      1
	XORWF      _contador+0, 0
L__interrupt59:
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt11
	MOVLW      0
	XORWF      _contador+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt60
	MOVLW      2
	XORWF      _contador+0, 0
L__interrupt60:
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt12
	MOVLW      0
	XORWF      _contador+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt61
	MOVLW      3
	XORWF      _contador+0, 0
L__interrupt61:
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt13
L_interrupt10:
;Mano Robotica.c,110 :: 		Numero=((d1*100)+(d2*10)+d3);
	MOVF       _d1+0, 0
	MOVWF      R0+0
	MOVF       _d1+1, 0
	MOVWF      R0+1
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      FLOC__interrupt+0
	MOVF       R0+1, 0
	MOVWF      FLOC__interrupt+1
	MOVF       _d2+0, 0
	MOVWF      R0+0
	MOVF       _d2+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16x16_U+0
	MOVF       FLOC__interrupt+0, 0
	ADDWF      R0+0, 1
	MOVF       FLOC__interrupt+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       _d3+0, 0
	ADDWF      R0+0, 1
	MOVF       _d3+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	CALL       _Int2Double+0
	MOVF       R0+0, 0
	MOVWF      _Numero+0
	MOVF       R0+1, 0
	MOVWF      _Numero+1
	MOVF       R0+2, 0
	MOVWF      _Numero+2
	MOVF       R0+3, 0
	MOVWF      _Numero+3
;Mano Robotica.c,111 :: 		IntToStr(Numero, TEXTO2);
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _TEXTO2+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Mano Robotica.c,112 :: 		configuracion();
	CALL       _configuracion+0
;Mano Robotica.c,113 :: 		RESET_LCD();
	CALL       _RESET_LCD+0
;Mano Robotica.c,114 :: 		CONFIG_SET();
	CALL       _CONFIG_SET+0
;Mano Robotica.c,115 :: 		ENABLE();
	CALL       _ENABLE+0
;Mano Robotica.c,116 :: 		DISPLAY_ON_OFF();
	CALL       _DISPLAY_ON_OFF+0
;Mano Robotica.c,117 :: 		ENABLE();
	CALL       _ENABLE+0
;Mano Robotica.c,118 :: 		CLEAR_DISPLAY();
	CALL       _CLEAR_DISPLAY+0
;Mano Robotica.c,119 :: 		ENABLE();
	CALL       _ENABLE+0
;Mano Robotica.c,120 :: 		ENTRY_MODE_SET();
	CALL       _ENTRY_MODE_SET+0
;Mano Robotica.c,121 :: 		ENABLE();
	CALL       _ENABLE+0
;Mano Robotica.c,122 :: 		CADENA1();                                           //Cadena de Texto 1era Linea
	CALL       _CADENA1+0
;Mano Robotica.c,123 :: 		SET_DDRAM();
	CALL       _SET_DDRAM+0
;Mano Robotica.c,124 :: 		ENABLE();
	CALL       _ENABLE+0
;Mano Robotica.c,125 :: 		CADENA2();                                           //Cadena de Texto 2da Linea
	CALL       _CADENA2+0
;Mano Robotica.c,126 :: 		}
L_interrupt8:
;Mano Robotica.c,128 :: 		if(RCREG>96&&RCREG<108)
	MOVF       RCREG+0, 0
	SUBLW      96
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt16
	MOVLW      108
	SUBWF      RCREG+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt16
L__interrupt54:
;Mano Robotica.c,130 :: 		Boton=RCREG;
	MOVF       RCREG+0, 0
	MOVWF      _Boton+0
	CLRF       _Boton+1
;Mano Robotica.c,131 :: 		switch(Boton)
	GOTO       L_interrupt17
;Mano Robotica.c,133 :: 		case 97:
L_interrupt19:
;Mano Robotica.c,134 :: 		Motor=5;
	MOVLW      5
	MOVWF      _Motor+0
	MOVLW      0
	MOVWF      _Motor+1
;Mano Robotica.c,135 :: 		break;
	GOTO       L_interrupt18
;Mano Robotica.c,137 :: 		case 98:
L_interrupt20:
;Mano Robotica.c,138 :: 		Motor=4;
	MOVLW      4
	MOVWF      _Motor+0
	MOVLW      0
	MOVWF      _Motor+1
;Mano Robotica.c,139 :: 		break;
	GOTO       L_interrupt18
;Mano Robotica.c,141 :: 		case 99:
L_interrupt21:
;Mano Robotica.c,142 :: 		Motor=3;
	MOVLW      3
	MOVWF      _Motor+0
	MOVLW      0
	MOVWF      _Motor+1
;Mano Robotica.c,143 :: 		break;
	GOTO       L_interrupt18
;Mano Robotica.c,145 :: 		case 100:
L_interrupt22:
;Mano Robotica.c,146 :: 		Motor=1;
	MOVLW      1
	MOVWF      _Motor+0
	MOVLW      0
	MOVWF      _Motor+1
;Mano Robotica.c,147 :: 		break;
	GOTO       L_interrupt18
;Mano Robotica.c,149 :: 		case 101:
L_interrupt23:
;Mano Robotica.c,150 :: 		Motor=0;
	CLRF       _Motor+0
	CLRF       _Motor+1
;Mano Robotica.c,151 :: 		break;
	GOTO       L_interrupt18
;Mano Robotica.c,153 :: 		case 102:
L_interrupt24:
;Mano Robotica.c,154 :: 		PORTB=0x00;
	CLRF       PORTB+0
;Mano Robotica.c,155 :: 		PORTB.RB2=1;
	BSF        PORTB+0, 2
;Mano Robotica.c,156 :: 		PWM_CFG();
	CALL       _PWM_CFG+0
;Mano Robotica.c,157 :: 		Periodo(256);
	MOVLW      0
	MOVWF      FARG_Periodo_t_useg+0
	MOVLW      1
	MOVWF      FARG_Periodo_t_useg+1
	CALL       _Periodo+0
;Mano Robotica.c,158 :: 		Valor=(Numero*2.5)+200;
	MOVF       _Numero+0, 0
	MOVWF      R0+0
	MOVF       _Numero+1, 0
	MOVWF      R0+1
	MOVF       _Numero+2, 0
	MOVWF      R0+2
	MOVF       _Numero+3, 0
	MOVWF      R0+3
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      128
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      134
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      _Valor+0
	MOVF       R0+1, 0
	MOVWF      _Valor+1
;Mano Robotica.c,159 :: 		Ancho_Pulso(Valor);
	MOVF       R0+0, 0
	MOVWF      FARG_Ancho_Pulso_ancho_useg+0
	MOVF       R0+1, 0
	MOVWF      FARG_Ancho_Pulso_ancho_useg+1
	CALL       _Ancho_Pulso+0
;Mano Robotica.c,160 :: 		break;
	GOTO       L_interrupt18
;Mano Robotica.c,162 :: 		case 103:
L_interrupt25:
;Mano Robotica.c,163 :: 		d1=0;
	CLRF       _d1+0
	CLRF       _d1+1
;Mano Robotica.c,164 :: 		d2=0;
	CLRF       _d2+0
	CLRF       _d2+1
;Mano Robotica.c,165 :: 		d3=0;
	CLRF       _d3+0
	CLRF       _d3+1
;Mano Robotica.c,166 :: 		contador=0;
	CLRF       _contador+0
	CLRF       _contador+1
;Mano Robotica.c,167 :: 		break;
	GOTO       L_interrupt18
;Mano Robotica.c,169 :: 		case 104:
L_interrupt26:
;Mano Robotica.c,170 :: 		PORTB=0x00;
	CLRF       PORTB+0
;Mano Robotica.c,171 :: 		switch(Motor)
	GOTO       L_interrupt27
;Mano Robotica.c,173 :: 		case 0:
L_interrupt29:
;Mano Robotica.c,174 :: 		PORTB.RB0=1;
	BSF        PORTB+0, 0
;Mano Robotica.c,175 :: 		break;
	GOTO       L_interrupt28
;Mano Robotica.c,177 :: 		case 1:
L_interrupt30:
;Mano Robotica.c,178 :: 		PORTB.RB1=1;
	BSF        PORTB+0, 1
;Mano Robotica.c,179 :: 		break;
	GOTO       L_interrupt28
;Mano Robotica.c,181 :: 		case 3:
L_interrupt31:
;Mano Robotica.c,182 :: 		PORTB.RB3=1;
	BSF        PORTB+0, 3
;Mano Robotica.c,183 :: 		break;
	GOTO       L_interrupt28
;Mano Robotica.c,185 :: 		case 4:
L_interrupt32:
;Mano Robotica.c,186 :: 		PORTB.RB4=1;
	BSF        PORTB+0, 4
;Mano Robotica.c,187 :: 		break;
	GOTO       L_interrupt28
;Mano Robotica.c,189 :: 		case 5:
L_interrupt33:
;Mano Robotica.c,190 :: 		PORTB.RB5=1;
	BSF        PORTB+0, 5
;Mano Robotica.c,191 :: 		break;
	GOTO       L_interrupt28
;Mano Robotica.c,192 :: 		}
L_interrupt27:
	MOVLW      0
	XORWF      _Motor+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt62
	MOVLW      0
	XORWF      _Motor+0, 0
L__interrupt62:
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt29
	MOVLW      0
	XORWF      _Motor+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt63
	MOVLW      1
	XORWF      _Motor+0, 0
L__interrupt63:
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt30
	MOVLW      0
	XORWF      _Motor+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt64
	MOVLW      3
	XORWF      _Motor+0, 0
L__interrupt64:
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt31
	MOVLW      0
	XORWF      _Motor+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt65
	MOVLW      4
	XORWF      _Motor+0, 0
L__interrupt65:
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt32
	MOVLW      0
	XORWF      _Motor+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt66
	MOVLW      5
	XORWF      _Motor+0, 0
L__interrupt66:
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt33
L_interrupt28:
;Mano Robotica.c,193 :: 		if(Motor>0)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _Motor+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt67
	MOVF       _Motor+0, 0
	SUBLW      0
L__interrupt67:
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt34
;Mano Robotica.c,195 :: 		Numero=72;
	MOVLW      0
	MOVWF      _Numero+0
	MOVLW      0
	MOVWF      _Numero+1
	MOVLW      16
	MOVWF      _Numero+2
	MOVLW      133
	MOVWF      _Numero+3
;Mano Robotica.c,196 :: 		}
L_interrupt34:
;Mano Robotica.c,197 :: 		if(Motor==0)
	MOVLW      0
	XORWF      _Motor+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt68
	MOVLW      0
	XORWF      _Motor+0, 0
L__interrupt68:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt35
;Mano Robotica.c,199 :: 		Numero=105;
	MOVLW      0
	MOVWF      _Numero+0
	MOVLW      0
	MOVWF      _Numero+1
	MOVLW      82
	MOVWF      _Numero+2
	MOVLW      133
	MOVWF      _Numero+3
;Mano Robotica.c,200 :: 		}
L_interrupt35:
;Mano Robotica.c,201 :: 		PWM_CFG();
	CALL       _PWM_CFG+0
;Mano Robotica.c,202 :: 		Periodo(256);
	MOVLW      0
	MOVWF      FARG_Periodo_t_useg+0
	MOVLW      1
	MOVWF      FARG_Periodo_t_useg+1
	CALL       _Periodo+0
;Mano Robotica.c,203 :: 		Valor=(Numero*2.5)+200;
	MOVF       _Numero+0, 0
	MOVWF      R0+0
	MOVF       _Numero+1, 0
	MOVWF      R0+1
	MOVF       _Numero+2, 0
	MOVWF      R0+2
	MOVF       _Numero+3, 0
	MOVWF      R0+3
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      128
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      134
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      _Valor+0
	MOVF       R0+1, 0
	MOVWF      _Valor+1
;Mano Robotica.c,204 :: 		Ancho_Pulso(Valor);
	MOVF       R0+0, 0
	MOVWF      FARG_Ancho_Pulso_ancho_useg+0
	MOVF       R0+1, 0
	MOVWF      FARG_Ancho_Pulso_ancho_useg+1
	CALL       _Ancho_Pulso+0
;Mano Robotica.c,205 :: 		break;
	GOTO       L_interrupt18
;Mano Robotica.c,207 :: 		case 105:
L_interrupt36:
;Mano Robotica.c,208 :: 		PORTB=0x00;
	CLRF       PORTB+0
;Mano Robotica.c,209 :: 		switch(Motor)
	GOTO       L_interrupt37
;Mano Robotica.c,211 :: 		case 0:
L_interrupt39:
;Mano Robotica.c,212 :: 		PORTB.RB0=1;
	BSF        PORTB+0, 0
;Mano Robotica.c,213 :: 		break;
	GOTO       L_interrupt38
;Mano Robotica.c,215 :: 		case 1:
L_interrupt40:
;Mano Robotica.c,216 :: 		PORTB.RB1=1;
	BSF        PORTB+0, 1
;Mano Robotica.c,217 :: 		break;
	GOTO       L_interrupt38
;Mano Robotica.c,219 :: 		case 3:
L_interrupt41:
;Mano Robotica.c,220 :: 		PORTB.RB3=1;
	BSF        PORTB+0, 3
;Mano Robotica.c,221 :: 		break;
	GOTO       L_interrupt38
;Mano Robotica.c,223 :: 		case 4:
L_interrupt42:
;Mano Robotica.c,224 :: 		PORTB.RB4=1;
	BSF        PORTB+0, 4
;Mano Robotica.c,225 :: 		break;
	GOTO       L_interrupt38
;Mano Robotica.c,227 :: 		case 5:
L_interrupt43:
;Mano Robotica.c,228 :: 		PORTB.RB5=1;
	BSF        PORTB+0, 5
;Mano Robotica.c,229 :: 		break;
	GOTO       L_interrupt38
;Mano Robotica.c,230 :: 		}
L_interrupt37:
	MOVLW      0
	XORWF      _Motor+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt69
	MOVLW      0
	XORWF      _Motor+0, 0
L__interrupt69:
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt39
	MOVLW      0
	XORWF      _Motor+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt70
	MOVLW      1
	XORWF      _Motor+0, 0
L__interrupt70:
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt40
	MOVLW      0
	XORWF      _Motor+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt71
	MOVLW      3
	XORWF      _Motor+0, 0
L__interrupt71:
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt41
	MOVLW      0
	XORWF      _Motor+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt72
	MOVLW      4
	XORWF      _Motor+0, 0
L__interrupt72:
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt42
	MOVLW      0
	XORWF      _Motor+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt73
	MOVLW      5
	XORWF      _Motor+0, 0
L__interrupt73:
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt43
L_interrupt38:
;Mano Robotica.c,231 :: 		if(Motor>0)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _Motor+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt74
	MOVF       _Motor+0, 0
	SUBLW      0
L__interrupt74:
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt44
;Mano Robotica.c,233 :: 		Numero=68;
	MOVLW      0
	MOVWF      _Numero+0
	MOVLW      0
	MOVWF      _Numero+1
	MOVLW      8
	MOVWF      _Numero+2
	MOVLW      133
	MOVWF      _Numero+3
;Mano Robotica.c,234 :: 		}
L_interrupt44:
;Mano Robotica.c,235 :: 		if(Motor==0)
	MOVLW      0
	XORWF      _Motor+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt75
	MOVLW      0
	XORWF      _Motor+0, 0
L__interrupt75:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt45
;Mano Robotica.c,237 :: 		Numero=45;
	MOVLW      0
	MOVWF      _Numero+0
	MOVLW      0
	MOVWF      _Numero+1
	MOVLW      52
	MOVWF      _Numero+2
	MOVLW      132
	MOVWF      _Numero+3
;Mano Robotica.c,238 :: 		}
L_interrupt45:
;Mano Robotica.c,239 :: 		PWM_CFG();
	CALL       _PWM_CFG+0
;Mano Robotica.c,240 :: 		Periodo(256);
	MOVLW      0
	MOVWF      FARG_Periodo_t_useg+0
	MOVLW      1
	MOVWF      FARG_Periodo_t_useg+1
	CALL       _Periodo+0
;Mano Robotica.c,241 :: 		Valor=(Numero*2.5)+200;
	MOVF       _Numero+0, 0
	MOVWF      R0+0
	MOVF       _Numero+1, 0
	MOVWF      R0+1
	MOVF       _Numero+2, 0
	MOVWF      R0+2
	MOVF       _Numero+3, 0
	MOVWF      R0+3
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      128
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      134
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      _Valor+0
	MOVF       R0+1, 0
	MOVWF      _Valor+1
;Mano Robotica.c,242 :: 		Ancho_Pulso(Valor);
	MOVF       R0+0, 0
	MOVWF      FARG_Ancho_Pulso_ancho_useg+0
	MOVF       R0+1, 0
	MOVWF      FARG_Ancho_Pulso_ancho_useg+1
	CALL       _Ancho_Pulso+0
;Mano Robotica.c,243 :: 		break;
	GOTO       L_interrupt18
;Mano Robotica.c,245 :: 		case 106:
L_interrupt46:
;Mano Robotica.c,246 :: 		PORTB=0x00;
	CLRF       PORTB+0
;Mano Robotica.c,247 :: 		break;
	GOTO       L_interrupt18
;Mano Robotica.c,248 :: 		}
L_interrupt17:
	MOVLW      0
	XORWF      _Boton+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt76
	MOVLW      97
	XORWF      _Boton+0, 0
L__interrupt76:
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt19
	MOVLW      0
	XORWF      _Boton+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt77
	MOVLW      98
	XORWF      _Boton+0, 0
L__interrupt77:
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt20
	MOVLW      0
	XORWF      _Boton+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt78
	MOVLW      99
	XORWF      _Boton+0, 0
L__interrupt78:
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt21
	MOVLW      0
	XORWF      _Boton+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt79
	MOVLW      100
	XORWF      _Boton+0, 0
L__interrupt79:
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt22
	MOVLW      0
	XORWF      _Boton+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt80
	MOVLW      101
	XORWF      _Boton+0, 0
L__interrupt80:
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt23
	MOVLW      0
	XORWF      _Boton+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt81
	MOVLW      102
	XORWF      _Boton+0, 0
L__interrupt81:
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt24
	MOVLW      0
	XORWF      _Boton+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt82
	MOVLW      103
	XORWF      _Boton+0, 0
L__interrupt82:
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt25
	MOVLW      0
	XORWF      _Boton+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt83
	MOVLW      104
	XORWF      _Boton+0, 0
L__interrupt83:
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt26
	MOVLW      0
	XORWF      _Boton+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt84
	MOVLW      105
	XORWF      _Boton+0, 0
L__interrupt84:
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt36
	MOVLW      0
	XORWF      _Boton+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt85
	MOVLW      106
	XORWF      _Boton+0, 0
L__interrupt85:
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt46
L_interrupt18:
;Mano Robotica.c,249 :: 		}
L_interrupt16:
;Mano Robotica.c,250 :: 		}
L_interrupt5:
;Mano Robotica.c,251 :: 		}
L_end_interrupt:
L__interrupt58:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_configuracion:

;Mano Robotica.c,254 :: 		void configuracion(void)
;Mano Robotica.c,256 :: 		ANSEL=0;
	CLRF       ANSEL+0
;Mano Robotica.c,257 :: 		PORTE&=(0<<RS|0<<RW|0<<E);
	MOVLW      0
	ANDWF      PORTE+0, 1
;Mano Robotica.c,258 :: 		PORTD=0x30;
	MOVLW      48
	MOVWF      PORTD+0
;Mano Robotica.c,259 :: 		TRISE&=(0<<RS|0<<RW|0<<E);
	MOVLW      0
	ANDWF      TRISE+0, 1
;Mano Robotica.c,260 :: 		TRISD=0;
	CLRF       TRISD+0
;Mano Robotica.c,261 :: 		}
L_end_configuracion:
	RETURN
; end of _configuracion

_RESET_LCD:

;Mano Robotica.c,263 :: 		void RESET_LCD(void)
;Mano Robotica.c,265 :: 		delay_ms(50);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_RESET_LCD47:
	DECFSZ     R13+0, 1
	GOTO       L_RESET_LCD47
	DECFSZ     R12+0, 1
	GOTO       L_RESET_LCD47
	NOP
;Mano Robotica.c,266 :: 		}
L_end_RESET_LCD:
	RETURN
; end of _RESET_LCD

_CONFIG_SET:

;Mano Robotica.c,268 :: 		void CONFIG_SET(void)
;Mano Robotica.c,270 :: 		DB=(1<<DB5)|(1<<DB4)|(1<<NL);
	MOVLW      56
	MOVWF      _DB+0
;Mano Robotica.c,271 :: 		}
L_end_CONFIG_SET:
	RETURN
; end of _CONFIG_SET

_DISPLAY_ON_OFF:

;Mano Robotica.c,273 :: 		void DISPLAY_ON_OFF(void)
;Mano Robotica.c,275 :: 		DB=(1<<DB3)|(1<<DSP)|(1<<CUR);//|(1<<BLK);
	MOVLW      14
	MOVWF      _DB+0
;Mano Robotica.c,276 :: 		}
L_end_DISPLAY_ON_OFF:
	RETURN
; end of _DISPLAY_ON_OFF

_ENTRY_MODE_SET:

;Mano Robotica.c,278 :: 		void ENTRY_MODE_SET(void)
;Mano Robotica.c,280 :: 		DB=(1<<DB2)|(1<<ID);//|(1<<SH);
	MOVLW      6
	MOVWF      _DB+0
;Mano Robotica.c,281 :: 		}
L_end_ENTRY_MODE_SET:
	RETURN
; end of _ENTRY_MODE_SET

_CLEAR_DISPLAY:

;Mano Robotica.c,283 :: 		void CLEAR_DISPLAY(void)
;Mano Robotica.c,285 :: 		DB=0x01;
	MOVLW      1
	MOVWF      _DB+0
;Mano Robotica.c,286 :: 		}
L_end_CLEAR_DISPLAY:
	RETURN
; end of _CLEAR_DISPLAY

_SET_DDRAM:

;Mano Robotica.c,288 :: 		void SET_DDRAM(void)
;Mano Robotica.c,290 :: 		DB=0xC0;
	MOVLW      192
	MOVWF      _DB+0
;Mano Robotica.c,291 :: 		}
L_end_SET_DDRAM:
	RETURN
; end of _SET_DDRAM

_ENABLE:

;Mano Robotica.c,293 :: 		void ENABLE(void)
;Mano Robotica.c,297 :: 		PORTD=DB;
	MOVF       _DB+0, 0
	MOVWF      PORTD+0
;Mano Robotica.c,298 :: 		PORTE|=(1<<E);
	BSF        PORTE+0, 2
;Mano Robotica.c,299 :: 		delay_ms(2);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_ENABLE48:
	DECFSZ     R13+0, 1
	GOTO       L_ENABLE48
	DECFSZ     R12+0, 1
	GOTO       L_ENABLE48
	NOP
	NOP
;Mano Robotica.c,300 :: 		PORTE&=~((1<<E));
	BCF        PORTE+0, 2
;Mano Robotica.c,301 :: 		delay_ms(2);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_ENABLE49:
	DECFSZ     R13+0, 1
	GOTO       L_ENABLE49
	DECFSZ     R12+0, 1
	GOTO       L_ENABLE49
	NOP
	NOP
;Mano Robotica.c,302 :: 		}
L_end_ENABLE:
	RETURN
; end of _ENABLE

_CADENA1:

;Mano Robotica.c,304 :: 		void CADENA1(void)
;Mano Robotica.c,306 :: 		unsigned char i=0;
	CLRF       CADENA1_i_L0+0
;Mano Robotica.c,308 :: 		PORTE|=(1<<RS);
	BSF        PORTE+0, 0
;Mano Robotica.c,310 :: 		while((TEXTO1[i]!='\n'))
L_CADENA150:
	MOVF       CADENA1_i_L0+0, 0
	ADDLW      _TEXTO1+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_CADENA151
;Mano Robotica.c,312 :: 		DB=TEXTO1[i];
	MOVF       CADENA1_i_L0+0, 0
	ADDLW      _TEXTO1+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _DB+0
;Mano Robotica.c,313 :: 		ENABLE();
	CALL       _ENABLE+0
;Mano Robotica.c,314 :: 		i++;
	INCF       CADENA1_i_L0+0, 1
;Mano Robotica.c,315 :: 		}
	GOTO       L_CADENA150
L_CADENA151:
;Mano Robotica.c,316 :: 		PORTE&=~((1<<RS));
	BCF        PORTE+0, 0
;Mano Robotica.c,317 :: 		}
L_end_CADENA1:
	RETURN
; end of _CADENA1

_CADENA2:

;Mano Robotica.c,319 :: 		void CADENA2(void)
;Mano Robotica.c,321 :: 		unsigned char i=0;
	CLRF       CADENA2_i_L0+0
;Mano Robotica.c,323 :: 		PORTE|=(1<<RS);
	BSF        PORTE+0, 0
;Mano Robotica.c,325 :: 		while((TEXTO2[i]!='\0'))
L_CADENA252:
	MOVF       CADENA2_i_L0+0, 0
	ADDLW      _TEXTO2+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_CADENA253
;Mano Robotica.c,327 :: 		DB=TEXTO2[i];
	MOVF       CADENA2_i_L0+0, 0
	ADDLW      _TEXTO2+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _DB+0
;Mano Robotica.c,328 :: 		ENABLE();
	CALL       _ENABLE+0
;Mano Robotica.c,329 :: 		i++;
	INCF       CADENA2_i_L0+0, 1
;Mano Robotica.c,330 :: 		}
	GOTO       L_CADENA252
L_CADENA253:
;Mano Robotica.c,331 :: 		PORTE&=~((1<<RS));
	BCF        PORTE+0, 0
;Mano Robotica.c,332 :: 		}
L_end_CADENA2:
	RETURN
; end of _CADENA2

_PWM_CFG:

;Mano Robotica.c,334 :: 		void PWM_CFG()
;Mano Robotica.c,336 :: 		CCP1CON.P1M1=0;
	BCF        CCP1CON+0, 7
;Mano Robotica.c,337 :: 		CCP1CON.P1M0=0;
	BCF        CCP1CON+0, 6
;Mano Robotica.c,338 :: 		CCP1CON.CCP1M3=1;
	BSF        CCP1CON+0, 3
;Mano Robotica.c,339 :: 		CCP1CON.CCP1M2=1;
	BSF        CCP1CON+0, 2
;Mano Robotica.c,341 :: 		PIR1.TMR2IF=0;
	BCF        PIR1+0, 1
;Mano Robotica.c,342 :: 		T2CON.TMR2ON=1;
	BSF        T2CON+0, 2
;Mano Robotica.c,343 :: 		TRISC.RC2=0;
	BCF        TRISC+0, 2
;Mano Robotica.c,344 :: 		T2CON.T2CKPS1=1;
	BSF        T2CON+0, 1
;Mano Robotica.c,345 :: 		T2CON.T2CKPS0=1;
	BSF        T2CON+0, 0
;Mano Robotica.c,346 :: 		}
L_end_PWM_CFG:
	RETURN
; end of _PWM_CFG

_Ancho_Pulso:

;Mano Robotica.c,348 :: 		void Ancho_Pulso(int ancho)
;Mano Robotica.c,350 :: 		CCP1CON|=((ancho&0x0003)<<4);
	MOVLW      3
	ANDWF      FARG_Ancho_Pulso_ancho+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	IORWF      CCP1CON+0, 1
;Mano Robotica.c,351 :: 		CCPR1L=ancho>>2;
	MOVF       FARG_Ancho_Pulso_ancho+0, 0
	MOVWF      R0+0
	MOVF       FARG_Ancho_Pulso_ancho+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	MOVF       R0+0, 0
	MOVWF      CCPR1L+0
;Mano Robotica.c,352 :: 		}
L_end_Ancho_Pulso:
	RETURN
; end of _Ancho_Pulso

_Periodo:

;Mano Robotica.c,354 :: 		void Periodo(int t_useg)
;Mano Robotica.c,356 :: 		PR2=(t_useg-1);
	DECF       FARG_Periodo_t_useg+0, 0
	MOVWF      PR2+0
;Mano Robotica.c,357 :: 		}
L_end_Periodo:
	RETURN
; end of _Periodo
