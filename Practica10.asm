
_ver:

;Practica10.c,54 :: 		void ver(unsigned char F, const unsigned char txt[])
;Practica10.c,57 :: 		for(i=0;i<16;i++)
	CLRF       _i+0
L_ver0:
	MOVLW      16
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_ver1
;Practica10.c,59 :: 		Lcd_chr(f,i+1,txt[i]);
	MOVF       FARG_ver_F+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	INCF       _i+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _i+0, 0
	ADDWF      FARG_ver_txt+0, 0
	MOVWF      R0+0
	MOVF       FARG_ver_txt+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Practica10.c,57 :: 		for(i=0;i<16;i++)
	INCF       _i+0, 1
;Practica10.c,60 :: 		}
	GOTO       L_ver0
L_ver1:
;Practica10.c,61 :: 		}
L_end_ver:
	RETURN
; end of _ver

_buzzer:

;Practica10.c,64 :: 		void buzzer()
;Practica10.c,66 :: 		if(PORTC.F0=1){
	BSF        PORTC+0, 0
	BTFSS      PORTC+0, 0
	GOTO       L_buzzer3
;Practica10.c,67 :: 		PORTC.F2=1;
	BSF        PORTC+0, 2
;Practica10.c,68 :: 		delay_ms(320);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      64
	MOVWF      R12+0
	MOVLW      38
	MOVWF      R13+0
L_buzzer4:
	DECFSZ     R13+0, 1
	GOTO       L_buzzer4
	DECFSZ     R12+0, 1
	GOTO       L_buzzer4
	DECFSZ     R11+0, 1
	GOTO       L_buzzer4
	NOP
;Practica10.c,69 :: 		PORTC.F2=0;
	BCF        PORTC+0, 2
;Practica10.c,70 :: 		delay_ms(320);              }
	MOVLW      4
	MOVWF      R11+0
	MOVLW      64
	MOVWF      R12+0
	MOVLW      38
	MOVWF      R13+0
L_buzzer5:
	DECFSZ     R13+0, 1
	GOTO       L_buzzer5
	DECFSZ     R12+0, 1
	GOTO       L_buzzer5
	DECFSZ     R11+0, 1
	GOTO       L_buzzer5
	NOP
L_buzzer3:
;Practica10.c,71 :: 		}
L_end_buzzer:
	RETURN
; end of _buzzer

_buzzer1:

;Practica10.c,72 :: 		void buzzer1()
;Practica10.c,74 :: 		if(PORTC.F1=1){
	BSF        PORTC+0, 1
	BTFSS      PORTC+0, 1
	GOTO       L_buzzer16
;Practica10.c,75 :: 		PORTC.F2=1;
	BSF        PORTC+0, 2
;Practica10.c,76 :: 		delay_ms(120);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      56
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_buzzer17:
	DECFSZ     R13+0, 1
	GOTO       L_buzzer17
	DECFSZ     R12+0, 1
	GOTO       L_buzzer17
	DECFSZ     R11+0, 1
	GOTO       L_buzzer17
;Practica10.c,77 :: 		PORTC.F2=0;
	BCF        PORTC+0, 2
;Practica10.c,78 :: 		delay_ms(120);              }
	MOVLW      2
	MOVWF      R11+0
	MOVLW      56
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_buzzer18:
	DECFSZ     R13+0, 1
	GOTO       L_buzzer18
	DECFSZ     R12+0, 1
	GOTO       L_buzzer18
	DECFSZ     R11+0, 1
	GOTO       L_buzzer18
L_buzzer16:
;Practica10.c,79 :: 		}
L_end_buzzer1:
	RETURN
; end of _buzzer1

_Temperatura:

;Practica10.c,84 :: 		void Temperatura(){
;Practica10.c,86 :: 		do {
L_Temperatura9:
;Practica10.c,87 :: 		temp_res = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _temp_res+0
	MOVF       R0+1, 0
	MOVWF      _temp_res+1
;Practica10.c,88 :: 		temp_res= (temp_res * 0.48);
	CALL       _word2double+0
	MOVLW      143
	MOVWF      R4+0
	MOVLW      194
	MOVWF      R4+1
	MOVLW      117
	MOVWF      R4+2
	MOVLW      125
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _double2word+0
	MOVF       R0+0, 0
	MOVWF      _temp_res+0
	MOVF       R0+1, 0
	MOVWF      _temp_res+1
;Practica10.c,89 :: 		ver(1,txt19);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt19+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt19+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Practica10.c,90 :: 		Inttostr(temp_res,cadena);
	MOVF       _temp_res+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _temp_res+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _cadena+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Practica10.c,92 :: 		Lcd_out(2,1,cadena);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _cadena+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Practica10.c,93 :: 		if(temp_res<=Digitos&&temp_res!=Digitos1)
	MOVF       _temp_res+1, 0
	SUBWF      _Digitos+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Temperatura79
	MOVF       _temp_res+0, 0
	SUBWF      _Digitos+0, 0
L__Temperatura79:
	BTFSS      STATUS+0, 0
	GOTO       L_Temperatura14
	MOVF       _temp_res+1, 0
	XORWF      _Digitos1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Temperatura80
	MOVF       _Digitos1+0, 0
	XORWF      _temp_res+0, 0
L__Temperatura80:
	BTFSC      STATUS+0, 2
	GOTO       L_Temperatura14
L__Temperatura72:
;Practica10.c,95 :: 		PORTC=0x01;
	MOVLW      1
	MOVWF      PORTC+0
;Practica10.c,96 :: 		buzzer();
	CALL       _buzzer+0
;Practica10.c,97 :: 		}
	GOTO       L_Temperatura15
L_Temperatura14:
;Practica10.c,99 :: 		if(temp_res>=Digitos1&&temp_res!=digitos)
	MOVF       _Digitos1+1, 0
	SUBWF      _temp_res+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Temperatura81
	MOVF       _Digitos1+0, 0
	SUBWF      _temp_res+0, 0
L__Temperatura81:
	BTFSS      STATUS+0, 0
	GOTO       L_Temperatura18
	MOVF       _temp_res+1, 0
	XORWF      _Digitos+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Temperatura82
	MOVF       _Digitos+0, 0
	XORWF      _temp_res+0, 0
L__Temperatura82:
	BTFSC      STATUS+0, 2
	GOTO       L_Temperatura18
L__Temperatura71:
;Practica10.c,101 :: 		PORTC=0x02;
	MOVLW      2
	MOVWF      PORTC+0
;Practica10.c,102 :: 		buzzer1();
	CALL       _buzzer1+0
;Practica10.c,103 :: 		}
	GOTO       L_Temperatura19
L_Temperatura18:
;Practica10.c,106 :: 		PORTC=0x00;
	CLRF       PORTC+0
;Practica10.c,107 :: 		}
L_Temperatura19:
;Practica10.c,108 :: 		}
L_Temperatura15:
;Practica10.c,109 :: 		} while(1);
	GOTO       L_Temperatura9
;Practica10.c,110 :: 		}
L_end_Temperatura:
	RETURN
; end of _Temperatura

_cantidad1:

;Practica10.c,117 :: 		void cantidad1()
;Practica10.c,119 :: 		Buffer = 0;
	CLRF       _Buffer+0
;Practica10.c,120 :: 		Digitos = 0;
	CLRF       _Digitos+0
	CLRF       _Digitos+1
;Practica10.c,121 :: 		while (1)
L_cantidad120:
;Practica10.c,124 :: 		teclado();
	CALL       _teclado+0
;Practica10.c,126 :: 		if ((Buffer >= '0')&&(Buffer <= '9'))
	MOVLW      48
	SUBWF      _Buffer+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_cantidad124
	MOVF       _Buffer+0, 0
	SUBLW      57
	BTFSS      STATUS+0, 0
	GOTO       L_cantidad124
L__cantidad173:
;Practica10.c,128 :: 		Lcd_Chr_Cp(Buffer);
	MOVF       _Buffer+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Practica10.c,129 :: 		Digitos = Digitos*10 + (Buffer - 48);
	MOVF       _Digitos+0, 0
	MOVWF      R0+0
	MOVF       _Digitos+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      48
	SUBWF      _Buffer+0, 0
	MOVWF      R2+0
	CLRF       R2+1
	BTFSS      STATUS+0, 0
	DECF       R2+1, 1
	MOVF       R2+0, 0
	ADDWF      R0+0, 0
	MOVWF      _Digitos+0
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R2+1, 0
	MOVWF      _Digitos+1
;Practica10.c,131 :: 		}
L_cantidad124:
;Practica10.c,132 :: 		if(Buffer == '*'){
	MOVF       _Buffer+0, 0
	XORLW      42
	BTFSS      STATUS+0, 2
	GOTO       L_cantidad125
;Practica10.c,133 :: 		Cantidades=1;
	MOVLW      1
	MOVWF      _Cantidades+0
;Practica10.c,134 :: 		break;
	GOTO       L_cantidad121
;Practica10.c,135 :: 		}
L_cantidad125:
;Practica10.c,136 :: 		}
	GOTO       L_cantidad120
L_cantidad121:
;Practica10.c,137 :: 		}
L_end_cantidad1:
	RETURN
; end of _cantidad1

_cantidad2:

;Practica10.c,139 :: 		void cantidad2()
;Practica10.c,141 :: 		Buffer = 0;
	CLRF       _Buffer+0
;Practica10.c,142 :: 		Digitos1 = 0;
	CLRF       _Digitos1+0
	CLRF       _Digitos1+1
;Practica10.c,143 :: 		while (1)
L_cantidad226:
;Practica10.c,146 :: 		teclado();
	CALL       _teclado+0
;Practica10.c,149 :: 		if ((Buffer >= '0')&&(Buffer <= '9'))
	MOVLW      48
	SUBWF      _Buffer+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_cantidad230
	MOVF       _Buffer+0, 0
	SUBLW      57
	BTFSS      STATUS+0, 0
	GOTO       L_cantidad230
L__cantidad274:
;Practica10.c,152 :: 		Lcd_Chr_Cp(Buffer);
	MOVF       _Buffer+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Practica10.c,153 :: 		Digitos1 = Digitos1*10 + (Buffer - 48);
	MOVF       _Digitos1+0, 0
	MOVWF      R0+0
	MOVF       _Digitos1+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      48
	SUBWF      _Buffer+0, 0
	MOVWF      R2+0
	CLRF       R2+1
	BTFSS      STATUS+0, 0
	DECF       R2+1, 1
	MOVF       R2+0, 0
	ADDWF      R0+0, 0
	MOVWF      _Digitos1+0
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R2+1, 0
	MOVWF      _Digitos1+1
;Practica10.c,155 :: 		}
L_cantidad230:
;Practica10.c,157 :: 		if(Buffer == '*'){
	MOVF       _Buffer+0, 0
	XORLW      42
	BTFSS      STATUS+0, 2
	GOTO       L_cantidad231
;Practica10.c,158 :: 		Cantidades=2;
	MOVLW      2
	MOVWF      _Cantidades+0
;Practica10.c,159 :: 		break;
	GOTO       L_cantidad227
;Practica10.c,160 :: 		}
L_cantidad231:
;Practica10.c,162 :: 		}
	GOTO       L_cantidad226
L_cantidad227:
;Practica10.c,163 :: 		}
L_end_cantidad2:
	RETURN
; end of _cantidad2

_MostrarTemperatura:

;Practica10.c,166 :: 		void MostrarTemperatura()
;Practica10.c,168 :: 		if(Cantidades == 2)
	MOVF       _Cantidades+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_MostrarTemperatura32
;Practica10.c,170 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Practica10.c,171 :: 		ver(1,txt18);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt18+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt18+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Practica10.c,172 :: 		delay_ms(900);
	MOVLW      10
	MOVWF      R11+0
	MOVLW      34
	MOVWF      R12+0
	MOVLW      161
	MOVWF      R13+0
L_MostrarTemperatura33:
	DECFSZ     R13+0, 1
	GOTO       L_MostrarTemperatura33
	DECFSZ     R12+0, 1
	GOTO       L_MostrarTemperatura33
	DECFSZ     R11+0, 1
	GOTO       L_MostrarTemperatura33
;Practica10.c,173 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Practica10.c,175 :: 		Temperatura();
	CALL       _Temperatura+0
;Practica10.c,177 :: 		}
L_MostrarTemperatura32:
;Practica10.c,178 :: 		}
L_end_MostrarTemperatura:
	RETURN
; end of _MostrarTemperatura

_text2:

;Practica10.c,180 :: 		void text2()
;Practica10.c,182 :: 		ver(1,txt13);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt13+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt13+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Practica10.c,183 :: 		Lcd_out(2,1,"");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Practica10+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Practica10.c,184 :: 		}
L_end_text2:
	RETURN
; end of _text2

_text3:

;Practica10.c,185 :: 		void text3()
;Practica10.c,187 :: 		ver(1,txt15);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt15+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt15+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Practica10.c,188 :: 		Lcd_out(2,1,"");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Practica10+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Practica10.c,189 :: 		}
L_end_text3:
	RETURN
; end of _text3

_teclado:

;Practica10.c,194 :: 		void teclado()
;Practica10.c,196 :: 		Buffer = 0;
	CLRF       _Buffer+0
;Practica10.c,197 :: 		PORTD = 0xF0;
	MOVLW      240
	MOVWF      PORTD+0
;Practica10.c,198 :: 		if (PORTD != 0xF0)
	MOVF       PORTD+0, 0
	XORLW      240
	BTFSC      STATUS+0, 2
	GOTO       L_teclado34
;Practica10.c,200 :: 		PORTD = 0xFE;
	MOVLW      254
	MOVWF      PORTD+0
;Practica10.c,201 :: 		switch (PORTD)
	GOTO       L_teclado35
;Practica10.c,203 :: 		case 0xEE: Buffer = '1'; break;
L_teclado37:
	MOVLW      49
	MOVWF      _Buffer+0
	GOTO       L_teclado36
;Practica10.c,204 :: 		case 0xDE: Buffer = '2'; break;
L_teclado38:
	MOVLW      50
	MOVWF      _Buffer+0
	GOTO       L_teclado36
;Practica10.c,205 :: 		case 0xBE: Buffer = '3'; break;
L_teclado39:
	MOVLW      51
	MOVWF      _Buffer+0
	GOTO       L_teclado36
;Practica10.c,206 :: 		case 0x7E: Buffer = 'A'; break;
L_teclado40:
	MOVLW      65
	MOVWF      _Buffer+0
	GOTO       L_teclado36
;Practica10.c,207 :: 		}
L_teclado35:
	MOVF       PORTD+0, 0
	XORLW      238
	BTFSC      STATUS+0, 2
	GOTO       L_teclado37
	MOVF       PORTD+0, 0
	XORLW      222
	BTFSC      STATUS+0, 2
	GOTO       L_teclado38
	MOVF       PORTD+0, 0
	XORLW      190
	BTFSC      STATUS+0, 2
	GOTO       L_teclado39
	MOVF       PORTD+0, 0
	XORLW      126
	BTFSC      STATUS+0, 2
	GOTO       L_teclado40
L_teclado36:
;Practica10.c,208 :: 		PORTD = 0xFD;
	MOVLW      253
	MOVWF      PORTD+0
;Practica10.c,209 :: 		switch (PORTD)
	GOTO       L_teclado41
;Practica10.c,211 :: 		case 0xED: Buffer = '4'; break;
L_teclado43:
	MOVLW      52
	MOVWF      _Buffer+0
	GOTO       L_teclado42
;Practica10.c,212 :: 		case 0xDD: Buffer = '5'; break;
L_teclado44:
	MOVLW      53
	MOVWF      _Buffer+0
	GOTO       L_teclado42
;Practica10.c,213 :: 		case 0xBD: Buffer = '6'; break;
L_teclado45:
	MOVLW      54
	MOVWF      _Buffer+0
	GOTO       L_teclado42
;Practica10.c,214 :: 		case 0x7D: Buffer = 'B'; break;
L_teclado46:
	MOVLW      66
	MOVWF      _Buffer+0
	GOTO       L_teclado42
;Practica10.c,215 :: 		}
L_teclado41:
	MOVF       PORTD+0, 0
	XORLW      237
	BTFSC      STATUS+0, 2
	GOTO       L_teclado43
	MOVF       PORTD+0, 0
	XORLW      221
	BTFSC      STATUS+0, 2
	GOTO       L_teclado44
	MOVF       PORTD+0, 0
	XORLW      189
	BTFSC      STATUS+0, 2
	GOTO       L_teclado45
	MOVF       PORTD+0, 0
	XORLW      125
	BTFSC      STATUS+0, 2
	GOTO       L_teclado46
L_teclado42:
;Practica10.c,216 :: 		PORTD = 0xFB;
	MOVLW      251
	MOVWF      PORTD+0
;Practica10.c,217 :: 		switch (PORTD)
	GOTO       L_teclado47
;Practica10.c,219 :: 		case 0xEB: Buffer = '7'; break;
L_teclado49:
	MOVLW      55
	MOVWF      _Buffer+0
	GOTO       L_teclado48
;Practica10.c,220 :: 		case 0xDB: Buffer = '8'; break;
L_teclado50:
	MOVLW      56
	MOVWF      _Buffer+0
	GOTO       L_teclado48
;Practica10.c,221 :: 		case 0xBB: Buffer = '9'; break;
L_teclado51:
	MOVLW      57
	MOVWF      _Buffer+0
	GOTO       L_teclado48
;Practica10.c,222 :: 		case 0x7B: Buffer = 'C'; break;
L_teclado52:
	MOVLW      67
	MOVWF      _Buffer+0
	GOTO       L_teclado48
;Practica10.c,223 :: 		}
L_teclado47:
	MOVF       PORTD+0, 0
	XORLW      235
	BTFSC      STATUS+0, 2
	GOTO       L_teclado49
	MOVF       PORTD+0, 0
	XORLW      219
	BTFSC      STATUS+0, 2
	GOTO       L_teclado50
	MOVF       PORTD+0, 0
	XORLW      187
	BTFSC      STATUS+0, 2
	GOTO       L_teclado51
	MOVF       PORTD+0, 0
	XORLW      123
	BTFSC      STATUS+0, 2
	GOTO       L_teclado52
L_teclado48:
;Practica10.c,224 :: 		PORTD = 0xF7;
	MOVLW      247
	MOVWF      PORTD+0
;Practica10.c,225 :: 		switch (PORTD)
	GOTO       L_teclado53
;Practica10.c,227 :: 		case 0xE7: Buffer = '*'; break;
L_teclado55:
	MOVLW      42
	MOVWF      _Buffer+0
	GOTO       L_teclado54
;Practica10.c,228 :: 		case 0xD7: Buffer = '0'; break;
L_teclado56:
	MOVLW      48
	MOVWF      _Buffer+0
	GOTO       L_teclado54
;Practica10.c,229 :: 		case 0xB7: Buffer = '#'; break;
L_teclado57:
	MOVLW      35
	MOVWF      _Buffer+0
	GOTO       L_teclado54
;Practica10.c,230 :: 		case 0x77: Buffer = 'D'; break;
L_teclado58:
	MOVLW      68
	MOVWF      _Buffer+0
	GOTO       L_teclado54
;Practica10.c,231 :: 		}
L_teclado53:
	MOVF       PORTD+0, 0
	XORLW      231
	BTFSC      STATUS+0, 2
	GOTO       L_teclado55
	MOVF       PORTD+0, 0
	XORLW      215
	BTFSC      STATUS+0, 2
	GOTO       L_teclado56
	MOVF       PORTD+0, 0
	XORLW      183
	BTFSC      STATUS+0, 2
	GOTO       L_teclado57
	MOVF       PORTD+0, 0
	XORLW      119
	BTFSC      STATUS+0, 2
	GOTO       L_teclado58
L_teclado54:
;Practica10.c,232 :: 		}
L_teclado34:
;Practica10.c,233 :: 		PORTD = 0xF0;
	MOVLW      240
	MOVWF      PORTD+0
;Practica10.c,234 :: 		while (PORTD != 0xF0);
L_teclado59:
	MOVF       PORTD+0, 0
	XORLW      240
	BTFSC      STATUS+0, 2
	GOTO       L_teclado60
	GOTO       L_teclado59
L_teclado60:
;Practica10.c,235 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_teclado61:
	DECFSZ     R13+0, 1
	GOTO       L_teclado61
	DECFSZ     R12+0, 1
	GOTO       L_teclado61
	NOP
	NOP
;Practica10.c,236 :: 		}
L_end_teclado:
	RETURN
; end of _teclado

_main:

;Practica10.c,239 :: 		void main()
;Practica10.c,241 :: 		ANSEL  = 0x01;
	MOVLW      1
	MOVWF      ANSEL+0
;Practica10.c,242 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;Practica10.c,243 :: 		C1ON_bit = 0;
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;Practica10.c,244 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;Practica10.c,245 :: 		TRISA  = 0x01;
	MOVLW      1
	MOVWF      TRISA+0
;Practica10.c,246 :: 		TRISB = 0;
	CLRF       TRISB+0
;Practica10.c,247 :: 		PORTB = 0;
	CLRF       PORTB+0
;Practica10.c,248 :: 		TRISD = 0xF0;
	MOVLW      240
	MOVWF      TRISD+0
;Practica10.c,249 :: 		PORTD = 0xF0;
	MOVLW      240
	MOVWF      PORTD+0
;Practica10.c,250 :: 		TRISC = 0x00;
	CLRF       TRISC+0
;Practica10.c,251 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;Practica10.c,253 :: 		ADC_Init();
	CALL       _ADC_Init+0
;Practica10.c,254 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Practica10.c,255 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Practica10.c,256 :: 		Lcd_cmd(_Lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Practica10.c,258 :: 		ver(1,txt1);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt1+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt1+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Practica10.c,259 :: 		ver(2,txt2);
	MOVLW      2
	MOVWF      FARG_ver_F+0
	MOVLW      _txt2+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt2+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Practica10.c,260 :: 		delay_ms(900);
	MOVLW      10
	MOVWF      R11+0
	MOVLW      34
	MOVWF      R12+0
	MOVLW      161
	MOVWF      R13+0
L_main62:
	DECFSZ     R13+0, 1
	GOTO       L_main62
	DECFSZ     R12+0, 1
	GOTO       L_main62
	DECFSZ     R11+0, 1
	GOTO       L_main62
;Practica10.c,261 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Practica10.c,262 :: 		ver(1,txt3);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt3+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt3+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Practica10.c,263 :: 		ver(2,txt4);
	MOVLW      2
	MOVWF      FARG_ver_F+0
	MOVLW      _txt4+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt4+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Practica10.c,264 :: 		delay_ms(900);
	MOVLW      10
	MOVWF      R11+0
	MOVLW      34
	MOVWF      R12+0
	MOVLW      161
	MOVWF      R13+0
L_main63:
	DECFSZ     R13+0, 1
	GOTO       L_main63
	DECFSZ     R12+0, 1
	GOTO       L_main63
	DECFSZ     R11+0, 1
	GOTO       L_main63
;Practica10.c,265 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Practica10.c,266 :: 		ver(1,txt5);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt5+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt5+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Practica10.c,267 :: 		ver(2,txt6);
	MOVLW      2
	MOVWF      FARG_ver_F+0
	MOVLW      _txt6+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt6+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Practica10.c,268 :: 		delay_ms(900);
	MOVLW      10
	MOVWF      R11+0
	MOVLW      34
	MOVWF      R12+0
	MOVLW      161
	MOVWF      R13+0
L_main64:
	DECFSZ     R13+0, 1
	GOTO       L_main64
	DECFSZ     R12+0, 1
	GOTO       L_main64
	DECFSZ     R11+0, 1
	GOTO       L_main64
;Practica10.c,269 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Practica10.c,270 :: 		ver(1,txt7);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt7+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt7+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Practica10.c,271 :: 		delay_ms(900);
	MOVLW      10
	MOVWF      R11+0
	MOVLW      34
	MOVWF      R12+0
	MOVLW      161
	MOVWF      R13+0
L_main65:
	DECFSZ     R13+0, 1
	GOTO       L_main65
	DECFSZ     R12+0, 1
	GOTO       L_main65
	DECFSZ     R11+0, 1
	GOTO       L_main65
;Practica10.c,272 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Practica10.c,273 :: 		ver(1,txt10);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt10+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt10+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Practica10.c,274 :: 		ver(2,txt11);
	MOVLW      2
	MOVWF      FARG_ver_F+0
	MOVLW      _txt11+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt11+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Practica10.c,275 :: 		delay_ms(900);
	MOVLW      10
	MOVWF      R11+0
	MOVLW      34
	MOVWF      R12+0
	MOVLW      161
	MOVWF      R13+0
L_main66:
	DECFSZ     R13+0, 1
	GOTO       L_main66
	DECFSZ     R12+0, 1
	GOTO       L_main66
	DECFSZ     R11+0, 1
	GOTO       L_main66
;Practica10.c,276 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Practica10.c,277 :: 		ver(1,txt13);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt13+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt13+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Practica10.c,278 :: 		delay_ms(900);
	MOVLW      10
	MOVWF      R11+0
	MOVLW      34
	MOVWF      R12+0
	MOVLW      161
	MOVWF      R13+0
L_main67:
	DECFSZ     R13+0, 1
	GOTO       L_main67
	DECFSZ     R12+0, 1
	GOTO       L_main67
	DECFSZ     R11+0, 1
	GOTO       L_main67
;Practica10.c,279 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Practica10.c,280 :: 		ver(1,txt14);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt14+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt14+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Practica10.c,281 :: 		ver(2,txt15);
	MOVLW      2
	MOVWF      FARG_ver_F+0
	MOVLW      _txt15+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt15+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Practica10.c,282 :: 		delay_ms(900);
	MOVLW      10
	MOVWF      R11+0
	MOVLW      34
	MOVWF      R12+0
	MOVLW      161
	MOVWF      R13+0
L_main68:
	DECFSZ     R13+0, 1
	GOTO       L_main68
	DECFSZ     R12+0, 1
	GOTO       L_main68
	DECFSZ     R11+0, 1
	GOTO       L_main68
;Practica10.c,283 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Practica10.c,284 :: 		while(1) //Programa Principal
L_main69:
;Practica10.c,286 :: 		text2();
	CALL       _text2+0
;Practica10.c,287 :: 		cantidad1();
	CALL       _cantidad1+0
;Practica10.c,288 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Practica10.c,289 :: 		text3();
	CALL       _text3+0
;Practica10.c,290 :: 		cantidad2();
	CALL       _cantidad2+0
;Practica10.c,291 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Practica10.c,292 :: 		MostrarTemperatura();
	CALL       _MostrarTemperatura+0
;Practica10.c,293 :: 		}
	GOTO       L_main69
;Practica10.c,294 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
