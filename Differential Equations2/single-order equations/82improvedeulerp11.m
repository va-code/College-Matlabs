
clearvars;
close all;


t_outs = [0.0 0.1 0.2 0.3 0.4 0.5 1 1.5 2.0];          
t = 0.0;           %t initial
y = 0.5;          %y initial
h = 0.0125;       %step size
steps = (2.00/h);     %number of steps
outputs = [];
step = 0;

function [f]=fun(y,t) 
  f = (y*y+2*t*y)/(3+t*t);
end

while step <= steps
  append = [t y];
  %if ismember(t, t_outs)
    outputs=[outputs;append];
  %end
  fn = fun(t,y);
  fn1 =fun((t+h),(y+h*fn));
  y = y + (h*(fn+fn1)/2);
  t = t + h;
  step = step + 1;
end