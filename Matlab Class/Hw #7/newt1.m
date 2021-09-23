
xtemp = x;
x = x - ((x.^2)-5)/(2*x);
xl = xtemp;
E = abs(((x-xl)/x)*100);

x
xl
E
