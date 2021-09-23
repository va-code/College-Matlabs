function p2a
  dx = .1;
  x = 0:dx:4.8;
  function Y = fun(z)
    y1 = exp(0.2.*z) - 1;
    y2 = exp(.2.*(z.+0.2)) - 1;
    
    Y = y1 + y2;
   end
  Y = fun(x);
  trapazoids = .5*Y*dx;
  
  sum(trapazoids)
    
   
  exact = ((5*exp(.2*x)) -x)- 5 ;
  
  plot(x,exact,'b-',x,exact,'r-')
  
end