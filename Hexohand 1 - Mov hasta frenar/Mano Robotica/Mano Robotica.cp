#line 1 "C:/Users/Carlos Avila/PROYECTO/HEXOHAND/Hexohand 1 - Mov hasta frenar/Mano Robotica/Mano Robotica.c"


 unsigned char DB;
#line 27 "C:/Users/Carlos Avila/PROYECTO/HEXOHAND/Hexohand 1 - Mov hasta frenar/Mano Robotica/Mano Robotica.c"
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
 TXSTA.SYNC=0;
 TXSTA.BRGH=0;
 BAUDCTL.BRG16=0;

 SPBRG=25;

 RCSTA.SPEN=1;
 RCSTA.CREN=1;
 TXSTA.TXEN=1;

 PIE1.RCIE=1;
 INTCON.PEIE=1;
 INTCON.GIE=1;

 TRISD=0;
 TRISA.RA4=1;
 d1=0;
 d2=0;
 d3=0;
 contador=0;
 TRISB=~0x3F;

 PORTB=0x3F;


 while(1)
 {
 if(!PORTA.RA4)
 {
 d1=0;
 d2=0;
 d3=0;
 contador=0;
 while(!PORTA.RA4);
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
 CADENA1();
 SET_DDRAM();
 ENABLE();
 CADENA2();
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
 PORTE&=(0<< 0 |0<< 1 |0<< 2 );
 PORTD=0x30;
 TRISE&=(0<< 0 |0<< 1 |0<< 2 );
 TRISD=0;
}

void RESET_LCD(void)
{
 delay_ms(50);
}

void CONFIG_SET(void)
{
 DB=(1<< 5 )|(1<< 4 )|(1<< 3 );
}

void DISPLAY_ON_OFF(void)
{
 DB=(1<< 3 )|(1<< 2 )|(1<< 1 );
}

void ENTRY_MODE_SET(void)
{
 DB=(1<< 2 )|(1<< 1 );
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


 PORTD=DB;
 PORTE|=(1<< 2 );
 delay_ms(2);
 PORTE&=~((1<< 2 ));
 delay_ms(2);
}

void CADENA1(void)
{
 unsigned char i=0;

 PORTE|=(1<< 0 );

 while((TEXTO1[i]!='\n'))
 {
 DB=TEXTO1[i];
 ENABLE();
 i++;
 }
 PORTE&=~((1<< 0 ));
}

void CADENA2(void)
{
 unsigned char i=0;

 PORTE|=(1<< 0 );

 while((TEXTO2[i]!='\0'))
 {
 DB=TEXTO2[i];
 ENABLE();
 i++;
 }
 PORTE&=~((1<< 0 ));
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
