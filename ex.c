#define butA portb.rb0
#define butB portb.rb1
#define butC portb.rb2
int i;
int time;
bekle(int ttime)
{
Vdelay_ms(ttime);
if(butA==1) time=time+10; 
if(butB==1) time=time-10;
if(butC==1) time=100;
if(time<50) time=50; 
if(time>1000) time=1000; 
}
ileri(short step)
{
for(i=0;i<step;i++)
{
PORTC=1;wait(time);
PORTC=2;wait(time);
PORTC=4;wait(time);
PORTC=8;wait(time);
}
}
geri(short step)
{
for(i=0;i<adim;i++)
{
PORTC=8;wait(time);
PORTC=4;wait(time);
PORTC=2;wait(time);
PORTC=1;wait(time);
}
}
void main()
{
ANB=0; 
ANC=0;
TRB=7;
TRC=0;
time=100;
129
BASLA:
ileri(10); 
geri(10);
goto BASLA; 
