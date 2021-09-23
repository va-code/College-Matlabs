clear all
n = 6;
i = n-1;
nFactorial = n;

while (i>1)
  nFactorial = nFactorial*(i);
  i = i-1;
end

fprintf('factorial of %d = %d\n', n, nFactorial);
