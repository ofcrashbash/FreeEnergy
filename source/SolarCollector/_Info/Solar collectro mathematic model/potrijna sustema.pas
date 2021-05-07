program temperature; 

const 
   b1=1000; 
   b2={1.2vt/m^2*S}12; 
   m1=1; 
   m2=100; 
   cp1=4186.8; 
   cp2=4186.8;  
   t20=200; 
   t10=300; 
var 
   t,dt,e,w,a,b,c,g1,g2,l1,l2,c1,c2:real; 


procedure start; 
begin 
  g1:=m1*cp1;
  g2:=m2*cp2;
  dt:=0.1; 
  t:=-dt; 
  
  a:=b1/g1;
  b:=b1/g2;
  c:=b2/g2;
  
  e:=a+b+c;
  w:=sqrt(e*e-4*a*c);
  l1:=(-e+w)/2;
  l2:=(-e-w)/2;
  
  c1:=(t10-t20*a/(l2+a))/(a/(l1+a)-a/(l2+a));  
  c2:=t20-c1;
  writeln(' c1=',c1:3:4,';  c2=',c2:3:4);
  
end; 


function Tem1(t:real):real; 
begin 
  Tem1:=c1*a/(l1+a)*exp(l1*t)+c2*a/(l2+a)*exp(l2*t); 
end; 


function Tem2(t:real):real; 
begin 
  Tem2:=c1*exp(l1*t)+c2*exp(l2*t); 
end; 


procedure mypoint(x,y,a,b:real); 
begin 
  point(20+round(x*a),round(450-y*b)); 
end; 


begin 
  start; 
  repeat
   t:=t+dt;
   pen(1,255,0,0);
   mypoint(t,tem1(t),0.1,1);
   pen(1,0,255,0);
   mypoint(t,tem2(t),0.1,1);
   pen(1,0,0,255);
   mypoint(t,0,0.1,1); 
  until t*0.1>=1200; 
end.
