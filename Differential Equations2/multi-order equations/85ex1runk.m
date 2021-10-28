
clearvars;
close all;
        
t = 0.2;           %t initial
point = [1 0]
h = 0.2;       %step size
steps = (2/h);     %number of steps
outputs = [];
step = 0;

function [f] = fun(indigo)
  x = indigo(1);
  y = indigo(2);
  p1 = x - 4*y;
  p2 = -x+y;
  f = [p1 p2];
end

while step <= (steps -1)
  append = [t point];
  outputs=[outputs;append];

  k1 = fun(point);
  k2 = fun(point.+((h/2)*k1));
  k3 = fun(point.+((h/2)*k2));
  k4 = fun(point.+(h*k3));
 
  point = point.+ ((h/6)*(k1.+(2*k2).+(2*k3).+k4));
  
  t = t + h;
  step = step + 1;
end
outputs