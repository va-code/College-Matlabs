
xtemp = x;
xltemp = xl;

xnew = (x+xl)/2;

y = ((xnew.^2)-2);

if (y > 0)
  x = xnew;
else
  xl = xnew;
end

E = abs(((x-xl)/x)*100);

x
xl
E
