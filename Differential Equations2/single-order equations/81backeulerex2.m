

clearvars % clear all the variables from the workspace
close all % close all the figures already opened

t_outs = [0.0 0.1 0.2 0.3 0.4 0.5 1 1.5 2.0];          
t = 0.0;           %t initial
y = 1.0;          %y initial
h = 0.01;       %step size
steps = (2.00/h);     %number of steps
outputs = [];
step = 0;

##the y in this formula is implicitly derived 
##and must be derived as new for any new function
## function given is yp =(1-t+4*y)
## y = y + f(y_(n+1),t_(n+1))

%function [f]=fun(y,t) 
  %f = 1 - t + 4*y;
%end

while step <= steps
  append = [t y];
  %if ismember(t, t_outs)
    outputs=[outputs;append];
  %end
  y = (y + h*(1-(t+h)))/(1-4*h);
  t = t + h;
  step = step + 1;
end