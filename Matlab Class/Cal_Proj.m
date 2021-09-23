function [y, x_max] = Cal_Proj(x,v_o,theta)
  t = x/(v_o*cos(theta));
  y = v_o*sin(theta)*t + .5*-9.81*t*t;
  t_max = 2*v_o*sin(theta)/9.81;
  x_max = v_o*cos(theta)*t_max;
 end
  