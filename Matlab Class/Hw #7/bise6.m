
xtemp = x;
xltemp = xl;

xnew = (x+xl)/2;

y = ((xnew^3)-(xnew^2)+(9.81*xnew)-30);

if (y > 0)
  x = xnew;
else
  xl = xnew;
end

E = abs(((x-xl)/x)*100);

x
xl
E
