
clearvars;
close all;


h = 0.1;       %step size
steps = (2.00/h);     %number of steps
t0 = 0.0;           %t initial
t1 = t0+h;           %t initial
t2 = t1+h;           %t initial
t3 = t2+h;           %t initial

y0 = 1.0;          %y initial
y1 = 1.6089333;          %y initial
y2 = 2.5050062;          %y initial
y3 = 3.8294145;          %y initial

function [f]=fun(t,y) 
  f = 1 - t + 4*y;
end
k1 = fun(t3,y3);
fnext = fun((t3+h),(y3+h*k1)); %this bit is the approximation to get around implicit
ynext =(48*y3-36*y2+16*y1-3*y0+12*h*fnext)/25

##this is not quite right this must be solved implicitly 
##fnext and ynext are supposed to be equal so they need to be distributed
##and dealt with accordingly which will be different depending on given
##functions, so it is not actually vey useful for computational solving