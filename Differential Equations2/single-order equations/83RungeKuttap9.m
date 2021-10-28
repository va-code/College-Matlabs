
clearvars;
close all;


t_outs = [0.0 0.1 0.2 0.3 0.4 0.5 1 1.5 2.0];          
t = 0.0;           %t initial
y = 1.0;          %y initial
h = 0.05;       %step size
steps = (2.00/h);     %number of steps
outputs = [];
step = 0;

function [f]=fun(t,y) 
  f = (t+y)^0.5;
end

while step <= steps
  append = [t y]
  %if ismember(t, t_outs)
    outputs=[outputs;append];
  %end
  k1 = fun(t,y);
  k2 =fun((t+(h/2)),(y+(h/2)*k1));
  k3 = fun((t+(h/2)),(y+(h/2)*k2));
  k4 = fun((t+h),(y + h*k3));
  y = y + (h*(k1+2*k2+2*k3+k4)/6);
  t = t + h;
  step = step + 1;
end