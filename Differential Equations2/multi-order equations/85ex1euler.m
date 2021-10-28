
clearvars;
close all;
        
t = 0.2;           %t initial
point = [1 0]
h = 0.1;       %step size
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

while step <= steps
  append = [t point]
  outputs=[outputs;append]

  point = point.+(h*fun(point))
  
  t = t + h;
  step = step + 1;
end