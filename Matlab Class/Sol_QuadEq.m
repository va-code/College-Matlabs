function [sol1,sol2] = Sol_QuadEq(a,b,c)
  sol1 = (-b +(sqrt(b*b - 4*a*c)))/(2*a);
  sol2 = (-b -(sqrt(b*b - 4*a*c)))/(2*a);
 end