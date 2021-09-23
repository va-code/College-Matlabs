function p1a
  dx = (pi/100);
  x = 0:dx:(2*pi);  
  
  fx = cos(x);
  P2 = 1-((x.^2)/2);
  P3 = P2 + ((x.^4)/24);
  P4 = P3 + ((x.^6)/720);
  
  plot(x,fx,'-',x,P2,'x',x,P3,'bo',x,P4,'ro')
  axis ([0, 6,-2, 2], "square")
  grid on;
  
end