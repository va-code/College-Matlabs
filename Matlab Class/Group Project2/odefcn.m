%Group project: Dodge Dakota Vibration
% f(t) = m*x'' + c*x' + k*x
function dxdt = odefcn(t,x)
  m = 1520; %mass in Kg
  c = 99;   % damping constant
  k = 50000;  %spring constant
  dxdt = [x(2); ((c*x(2) + k*x(1))/(-m))];
end






