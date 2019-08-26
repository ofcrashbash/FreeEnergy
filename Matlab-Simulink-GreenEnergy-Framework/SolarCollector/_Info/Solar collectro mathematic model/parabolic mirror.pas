Program lenghtcapacity; 

var x,p,a:real; 

function lengh(x:real):real; 
begin 
  lengh:=p/2*(x/p*sqrt(1+sqr(x/p))+ln(x/p+sqrt(1+sqr(x/p)))); 
end; 

function y(x:real):real; 
begin 
  y:=1/2/p*x*x; 
end; 

function beta(a:real):real;
begin
  beta:=pi/2-arctan((1-a*a)/sqrt(2)/a);
end;

begin 
  x:=0;
  p:=5;
  writeln('x/lenght=',sqrt(2)*p*0.8/lengh(sqrt(2)*p*0.8):5:5);
  writeln('beta=',beta(0.01)/pi*180:5:5);
  repeat 
    x:=x+0.005; 
    pen(1,255,0,0); 
    point(round(400+x*10),round(450-lengh(x))); 
    pen(1,0,255,0); 
    point(round(400+x*10),round(450-y(x)/1)); 
  until false; 
end.
