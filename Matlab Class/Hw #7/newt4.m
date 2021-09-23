
xtemp = x;
x = x - ((x^3)-(x^2)+(9.81*x)-20)/((3*x^2)-(2*x)+9.81);
xl = xtemp;
E = abs(((x-xl)/x)*100);

x
xl
E
