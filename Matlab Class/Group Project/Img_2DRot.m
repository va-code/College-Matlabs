function [X,Y] = Img_2DRot(x,y,theta)
  
  r = sqrt(x.*x + y.*y);
  theta_o = atan(y./x);
  theta_f = theta .+ theta_o;
  X = r.*cos(theta_f);
  Y = r.*sin(theta_f);
 end
  