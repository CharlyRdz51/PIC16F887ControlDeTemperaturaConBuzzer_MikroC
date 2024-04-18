/*SSPPSE
Ing. Jose Jesus Ramos Guillen
Aguilar Rodriguez Carlos AdolfO
215860049
Control Temperatura
4 de Noviembre del 2016
*/
unsigned char Buffer,Cantidades,i;
unsigned short Temp1,Temperaturamin,TemperaturaMax;
unsigned int Ciclo1,Ciclo2,delay,Digitos,Digitos1;
int cadena1;
sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;
unsigned char cadena[7];
sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;
 unsigned int temp_res;
//Bloque Para Almacenar mensaje en la ROM

const unsigned char txt1[] = "    SSPPSE      ";
const unsigned char txt2[] = "Ing. Jose Ramos ";
const unsigned char txt3[] = " Carlos Aguilar ";
const unsigned char txt4[] = "   215860049    ";
const unsigned char txt5[] = "   Control De   ";
const unsigned char txt6[] = "   Temperatura  ";
const unsigned char txt7[] = "   04/Nov/2016  ";
const unsigned char txt10[] = "  Seleccione    ";
const unsigned char txt11[] = "  Primero la    ";
const unsigned char txt13[] = "Temperatura Min ";
const unsigned char txt14[] = "  Despues la    ";
const unsigned char txt15[] = "Temperatura Max ";
const unsigned char txt18[] = "   Iniciando    ";
const unsigned char txt19[] = "  Temperatura   ";
const unsigned char txt20[] = "    Estable     ";
const unsigned char txt21[] = "      BAJA      ";
const unsigned char txt22[] = "      ALTA      ";

void teclado();
void text2();
 void MostrarTemperatura();
 void Temperatura();
void cantidad1();
void cantidad2();
void buzzer(void);
void buzzer1(void);
 void ver(unsigned char F, const unsigned char txt[])
                    {
                     unsigned char;
                     for(i=0;i<16;i++)
                     {
                      Lcd_chr(f,i+1,txt[i]);
                      }
                       }


                                    void buzzer()
                                    {
                                     if(PORTC.F0=1){
                                      PORTC.F2=1;
                                      delay_ms(320);
                                      PORTC.F2=0;
                                      delay_ms(320);              }
                                     }
                                      void buzzer1()
                                    {
                                     if(PORTC.F1=1){
                                      PORTC.F2=1;
                                      delay_ms(120);
                                      PORTC.F2=0;
                                      delay_ms(120);              }
                                     }




                                     void Temperatura(){

                          do {
                            temp_res = ADC_Read(0);
                            temp_res= (temp_res * 0.48);
                            ver(1,txt19);
                            Inttostr(temp_res,cadena);

                            Lcd_out(2,1,cadena);
                            if(temp_res<=Digitos&&temp_res!=Digitos1)
                            {
                            PORTC=0x01;
                            buzzer();
                            }
                            else{
                            if(temp_res>=Digitos1&&temp_res!=digitos)
                            {
                            PORTC=0x02;
                            buzzer1();
                            }
                            else
                            {
                            PORTC=0x00;
                             }
                             }
                           } while(1);
                        }






                     void cantidad1()
                        {
                          Buffer = 0;
                          Digitos = 0;
                          while (1)
                          {
                            {
                              teclado();
                            }
                            if ((Buffer >= '0')&&(Buffer <= '9'))
                            {
                              Lcd_Chr_Cp(Buffer);
                              Digitos = Digitos*10 + (Buffer - 48);

                            }
                           if(Buffer == '*'){
                             Cantidades=1;
                             break;
                            }
                          }
                        }

                            void cantidad2()
                            {
                              Buffer = 0;
                              Digitos1 = 0;
                              while (1)
                              {
                                {
                                  teclado();
                                }

                                if ((Buffer >= '0')&&(Buffer <= '9'))
                                {

                                  Lcd_Chr_Cp(Buffer);
                                  Digitos1 = Digitos1*10 + (Buffer - 48);

                                }

                               if(Buffer == '*'){
                                 Cantidades=2;
                                 break;
                                }

                              }
                            }


                            void MostrarTemperatura()
                            {
                             if(Cantidades == 2)
                                      {
                                      Lcd_Cmd(_LCD_CLEAR);
                                       ver(1,txt18);
                                        delay_ms(900);
                                      Lcd_Cmd(_LCD_CLEAR);

                                      Temperatura();

                                      }
                                       }

                            void text2()
                            {
                            ver(1,txt13);
                            Lcd_out(2,1,"");
                            }
                            void text3()
                            {
                            ver(1,txt15);
                            Lcd_out(2,1,"");
                            }




                            void teclado()
                            {
                              Buffer = 0;
                              PORTD = 0xF0;
                              if (PORTD != 0xF0)
                              {
                                PORTD = 0xFE;
                                switch (PORTD)
                                {
                                  case 0xEE: Buffer = '1'; break;
                                  case 0xDE: Buffer = '2'; break;
                                  case 0xBE: Buffer = '3'; break;
                                  case 0x7E: Buffer = 'A'; break;
                                }
                                PORTD = 0xFD;
                                switch (PORTD)
                                {
                                  case 0xED: Buffer = '4'; break;
                                  case 0xDD: Buffer = '5'; break;
                                  case 0xBD: Buffer = '6'; break;
                                  case 0x7D: Buffer = 'B'; break;
                                }
                                PORTD = 0xFB;
                                switch (PORTD)
                                {
                                  case 0xEB: Buffer = '7'; break;
                                  case 0xDB: Buffer = '8'; break;
                                  case 0xBB: Buffer = '9'; break;
                                  case 0x7B: Buffer = 'C'; break;
                                }
                                PORTD = 0xF7;
                                switch (PORTD)
                                {
                                  case 0xE7: Buffer = '*'; break;
                                  case 0xD7: Buffer = '0'; break;
                                  case 0xB7: Buffer = '#'; break;
                                  case 0x77: Buffer = 'D'; break;
                                }
                              }
                              PORTD = 0xF0;
                              while (PORTD != 0xF0);
                              delay_ms(50);
                }


                              void main()
                              {
                                ANSEL  = 0x01;
                                ANSELH = 0;
                                C1ON_bit = 0;
                                C2ON_bit = 0;
                                TRISA  = 0x01;
                                TRISB = 0;
                                PORTB = 0;
                                TRISD = 0xF0;
                                PORTD = 0xF0;
                                TRISC = 0x00;
                                PORTC = 0x00;

                                ADC_Init();
                                Lcd_Init();
                                Lcd_Cmd(_LCD_CURSOR_OFF);
                                Lcd_cmd(_Lcd_clear);
                                //Bloque de Mensaje/Instrucciones
                                ver(1,txt1);
                                ver(2,txt2);
                                delay_ms(900);
                                lcd_cmd(_lcd_clear);
                                ver(1,txt3);
                                ver(2,txt4);
                                delay_ms(900);
                                lcd_cmd(_lcd_clear);
                                ver(1,txt5);
                                ver(2,txt6);
                                delay_ms(900);
                                lcd_cmd(_lcd_clear);
                                ver(1,txt7);
                                delay_ms(900);
                                lcd_cmd(_lcd_clear);
                                ver(1,txt10);
                                ver(2,txt11);
                                delay_ms(900);
                                lcd_cmd(_lcd_clear);
                                ver(1,txt13);
                                delay_ms(900);
                                lcd_cmd(_lcd_clear);
                                ver(1,txt14);
                                ver(2,txt15);
                                delay_ms(900);
                                lcd_cmd(_lcd_clear);
                                while(1) //Programa Principal
                                {
                                  text2();
                                  cantidad1();
                                  lcd_cmd(_lcd_clear);
                                  text3();
                                  cantidad2();
                                  lcd_cmd(_lcd_clear);
                                  MostrarTemperatura();
                                  }
                                   }