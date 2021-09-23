function p = Cal_Press(V,T,N)
  R=8.3145;
  % R is in (J mol^-1 K^-1)s
  p = N*R*T/V;
 end