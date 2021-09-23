
xtemp = x;
x = x - (((x.^3)-2)*(x - xl))/(((x.^3)-2)-((xl.^3)-2));
xl = xtemp;
E = abs(((x-xl)/x)*100);

x
xl
E


