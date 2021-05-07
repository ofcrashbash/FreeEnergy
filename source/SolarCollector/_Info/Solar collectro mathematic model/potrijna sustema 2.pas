program temperature; 

const 
   b1=10; 
   b2=1; 
   m1=10; 
   m2=100; 
   c1=10; 
   c2=10; 
   t0=0; 
   t20=t0; 
   t10=400; 
var 
   t,e,w,dt,b,c,g1,g2:real; 
   i:integer;


procedure start; 
begin
  g1:=m1*c1;
  g2:=m2*c2; 
  dt:=0.1; 
  t:=-dt; 
  e:=b1/(2*g1)+(b1+b2)/(2*g2); 
  w:=sqrt(e*e-b1*b2/(g1*g2)); 
  c:=10{(g1*(e-w)*(t10-t0)+(t20-t0)*(g2*(e-w)+b2))*(g2*(e+w)+b1)/(g1*(e-w)*(g2*(e+w)+b1)-g1*(e+w)*(g2*(e-w)+b2))}; 
  b:=-0.5{g1*(e+w)/(g2*(e+w)+b1)}*c; 
  writeln(' c=',c:3:4,';  b=',b:3:4);
end; 


function Tem1(t,c:real):real; 
begin 
  Tem1:=c*exp(-(e+w)*t)+(t10-t0-c)*exp(-(e-w)*t)+t0; 
end; 


function Tem2(t,b:real):real; 
begin 
  Tem2:=b*exp(-(e+w)*t)+(t20-t0-b)*exp(-(e-w)*t)+t0; 
end; 


procedure mypoint(x,y,a,b:real); 
begin 
  point(round(20+x*a),round(400-y*b)); 
end; 


begin 
  start; 
  repeat
   t:=t+dt;
   for i:=0 to 10 do 
    begin
     pen(2,round((10+i)/20*255),round((10-i)/20*255),0);
     mypoint(t,tem1(t,i*30),1,0.7);
    end;
   for i:=-10 to 0 do 
    begin
     pen(2,round((10+i)/20*255),round((10-i)/10*255),0);
     mypoint(t,tem2(t,i*30),1,0.7);
   end;
   pen(1,200,200,200);
   mypoint(t,200,1,0.7); 
   mypoint(t,250,1,0.7);
   mypoint(t,300,1,0.7);
   mypoint(t,350,1,0.7);
   mypoint(t,400,1,0.7);
   mypoint(t,0,1,0.7); 
   mypoint(t,50,1,0.7);
   mypoint(t,100,1,0.7);
   mypoint(t,150,1,0.7);
  until t*0.1>=500; 
end.
