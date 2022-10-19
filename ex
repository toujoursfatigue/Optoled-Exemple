/* STEP MOTOR KONTROLÜ */
#define butonA portb.rb0
#define butonB portb.rb1
#define butonC portb.rb2
int i;
int sure;
bekle(int ssure)
{
Vdelay_ms(ssure); //ADIM SÜRESİ AYARLAMA
if(butonA==1) sure=sure+10; //BUTON A'YA SÜRE ARTTIR
if(butonB==1) sure=sure-10;//BUTON B'YE SÜRE AZALT
if(butonC==1) sure=100; //BUTON C'YE SÜREYİ 100ms yap
if(sure<50) sure=50; // SÜRE 50 DEN KÜÇÜKSE 50 YAP
if(sure>1000) sure=1000; // SÜRE 1000’DEN BÜYÜKSE 100 YAP
}
ileri(short adim)
{
for(i=0;i<adim;i++)
{
PORTC=1;bekle(sure);
PORTC=2;bekle(sure);
PORTC=4;bekle(sure);
PORTC=8;bekle(sure);
}
}
geri(short adim)
{
for(i=0;i<adim;i++)
{
PORTC=8;bekle(sure);
PORTC=4;bekle(sure);
PORTC=2;bekle(sure);
PORTC=1;bekle(sure);
}
}
void main()
{
ANSELB=0; // B PORTU DİJİTAL AYARLANDI.
ANSELC=0; // C PORTU DİJİTAL AYARLANDI.
TRISB=7; // B PORTU B0,B1,B2 PİNLERİ GİRİŞ AYARLANDI.
TRISC=0; // C PORTU ÇIKIŞ OLARAK AYARLANDI.
sure=100; // BEKLEME SÜRESİ 100ms OLARAK AYARLANDI.
129
BASLA:
ileri(10); // 10*4=40 ADIM İLERİ GİT.
geri(10); // 10*4=40 ADIM GERİ GİT.
goto BASLA; // BASLA DEĞİŞKENİNE GERİ DÖN.
