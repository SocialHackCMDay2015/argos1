  //Avila Cuevas Carlos Eduardo
  
  unsigned char DB;        //TRES DIGITOS

 #define DB0          0    // bits del data bus 0-7
 #define DB1          1
 #define DB2          2
 #define DB3          3
 #define DB4          4
 #define DB5          5
 #define DB6          6
 #define DB7          7
 #define ID           1   //increment/decrement mode
 #define SH           0   //Entere Shift on/off
 #define BLK          0   //Blink on/off
 #define CUR          1   //Cursor on/off
 #define DSP          2   //Display on/off
 #define F            2   //Matrix
 #define NL           3   //N lines
 #define B_Busy       7   //Bit busy Flag
 #define RS           0   //Bit Select register LCD
 #define RW           1   //Bit read/write LCD
 #define E            2
 #define SC           3
 #define RL           2

 volatile unsigned char TEXTO1[]={" MANO ROBOTICA \n"};
 volatile unsigned char TEXTO2[]={"        \0"};

void configuracion(void);
void RESET_LCD(void);
void CONFIG_SET(void);
void DISPLAY_ON_OFF(void);
void ENTRY_MODE_SET(void);
void CLEAR_DISPLAY(void);
void SET_DDRAM(void);
void ENABLE(void);
void CADENA1(void);
void CADENA2(void);
void delay_ms(unsigned int msegs);
int d1, d2, d3, contador, Valor, Boton, Motor;
double Numero;

void PWM_CFG();
void Ancho_Pulso(int ancho_useg);
void Periodo(int t_useg);

void main()
{
     TXSTA.SYNC=0;                                       //EUSART en Modo Asincrono
     TXSTA.BRGH=0;                                       //EUSART en Baja Velocidad
     BAUDCTL.BRG16=0;                                    //Generador de 8 bits para el Baud Rate

     SPBRG=25;                                           //2400/Segundo, Baud Rate=2400

     RCSTA.SPEN=1;                                       //Habilita TX y RX como terminales del puerto serial
     RCSTA.CREN=1;                                       //Habilita recepcion
     TXSTA.TXEN=1;                                       //Habilitacion de la Transmision y Transmision

     PIE1.RCIE=1;                                        //Habilitacion de interrupcion por recepcion
     INTCON.PEIE=1;                                      //Habilitacion de interrupcion por periferico
     INTCON.GIE=1;                                       //Habilitacion Global de las Interrupciones

     TRISD=0;                                            //Puerto como salida
     TRISA.RA4=1;                                        //RA4 como entrada
     d1=0;
     d2=0;
     d3=0;
     contador=0;
     TRISB=~0x3F;
     
     PORTB=0x3F;


     while(1)
     {
             if(!PORTA.RA4)                               //Boton presionado
             {
                    d1=0;
                    d2=0;
                    d3=0;
                    contador=0;
                    while(!PORTA.RA4);                   //Espera a que se libere el boton
             }
     }
}

void interrupt()
{
     if(PIR1.RCIF)
     {
            if(RCREG>47&&RCREG<58)
            {
                contador++;
                switch(contador)
                {
                case 1:
                d1=RCREG-48;
                break;

                case 2:
                d2=RCREG-48;
                break;

                case 3:
                d3=RCREG-48;
                break;

                }
                Numero=((d1*100)+(d2*10)+d3);
            IntToStr(Numero, TEXTO2);
            configuracion();
            RESET_LCD();
            CONFIG_SET();
            ENABLE();
            DISPLAY_ON_OFF();
            ENABLE();
            CLEAR_DISPLAY();
            ENABLE();
            ENTRY_MODE_SET();
            ENABLE();
            CADENA1();                                           //Cadena de Texto 1era Linea
            SET_DDRAM();
            ENABLE();
            CADENA2();                                           //Cadena de Texto 2da Linea
            }

            if(RCREG>96&&RCREG<108)
            {
                  Boton=RCREG;
                  switch(Boton)
                  {
                      case 97:
                           Motor=5;
                      break;
                      
                      case 98:
                           Motor=4;
                      break;
                      
                      case 99:
                           Motor=3;
                      break;

                      case 100:
                           Motor=1;
                      break;
                      
                      case 101:
                           Motor=0;
                      break;
                      
                      case 102:
                           PORTB=0x00;
                           PORTB.RB2=1;
                           PWM_CFG();
                           Periodo(256);
                           Valor=(Numero*2.5)+200;
                           Ancho_Pulso(Valor);
                      break;
                      
                      case 103:
                           d1=0;
                           d2=0;
                           d3=0;
                           contador=0;
                      break;
                      
                      case 104:
                           PORTB=0x00;
                           switch(Motor)
                           {
                                  case 0:
                                       PORTB.RB0=1;
                                  break;
                                  
                                  case 1:
                                       PORTB.RB1=1;
                                  break;
                                  
                                  case 3:
                                       PORTB.RB3=1;
                                  break;
                                  
                                  case 4:
                                       PORTB.RB4=1;
                                  break;
                                  
                                  case 5:
                                       PORTB.RB5=1;
                                  break;
                           }
                            if(Motor>0)
                           {
                                  Numero=72;
                           }
                           if(Motor==0)
                           {
                                  Numero=105;
                           }
                           PWM_CFG();
                           Periodo(256);
                           Valor=(Numero*2.5)+200;
                           Ancho_Pulso(Valor);
                      break;
                      
                      case 105:
                           PORTB=0x00;
                           switch(Motor)
                           {
                                  case 0:
                                       PORTB.RB0=1;
                                  break;

                                  case 1:
                                       PORTB.RB1=1;
                                  break;

                                  case 3:
                                       PORTB.RB3=1;
                                  break;

                                  case 4:
                                       PORTB.RB4=1;
                                  break;

                                  case 5:
                                       PORTB.RB5=1;
                                  break;
                           }
                           if(Motor>0)
                           {
                                  Numero=68;
                           }
                           if(Motor==0)
                           {
                                  Numero=45;
                           }
                           PWM_CFG();
                           Periodo(256);
                           Valor=(Numero*2.5)+200;
                           Ancho_Pulso(Valor);
                      break;
                      
                      case 106:
                           PORTB=0x00;
                      break;
                  }
            }
     }
}


void configuracion(void)
{
       ANSEL=0;
       PORTE&=(0<<RS|0<<RW|0<<E);
       PORTD=0x30;
       TRISE&=(0<<RS|0<<RW|0<<E);
       TRISD=0;
}

void RESET_LCD(void)
{
     delay_ms(50);
}

void CONFIG_SET(void)
{
   DB=(1<<DB5)|(1<<DB4)|(1<<NL);
}

void DISPLAY_ON_OFF(void)
{
      DB=(1<<DB3)|(1<<DSP)|(1<<CUR);//|(1<<BLK);
}

void ENTRY_MODE_SET(void)
{
     DB=(1<<DB2)|(1<<ID);//|(1<<SH);
}

void CLEAR_DISPLAY(void)
{
   DB=0x01;
}

void SET_DDRAM(void)
{
   DB=0xC0;
}

void ENABLE(void)
{
     //Señal de Habilitacion

     PORTD=DB;
     PORTE|=(1<<E);
     delay_ms(2);
     PORTE&=~((1<<E));
     delay_ms(2);
}

void CADENA1(void)
{
     unsigned char i=0;

     PORTE|=(1<<RS);

     while((TEXTO1[i]!='\n'))
     {
            DB=TEXTO1[i];
            ENABLE();
            i++;
     }
     PORTE&=~((1<<RS));
}

void CADENA2(void)
{
     unsigned char i=0;

     PORTE|=(1<<RS);

     while((TEXTO2[i]!='\0'))
     {
            DB=TEXTO2[i];
            ENABLE();
            i++;
     }
     PORTE&=~((1<<RS));
}

void PWM_CFG()
{
     CCP1CON.P1M1=0;
     CCP1CON.P1M0=0;
     CCP1CON.CCP1M3=1;
     CCP1CON.CCP1M2=1;

     PIR1.TMR2IF=0;
     T2CON.TMR2ON=1;
     TRISC.RC2=0;
     T2CON.T2CKPS1=1;
     T2CON.T2CKPS0=1;
}

void Ancho_Pulso(int ancho)
{
     CCP1CON|=((ancho&0x0003)<<4);
     CCPR1L=ancho>>2;
}

void Periodo(int t_useg)
{
     PR2=(t_useg-1);
}