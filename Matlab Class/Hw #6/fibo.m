clear all

N = 20;

i = 1;

fib = [0 1];

while i <= N
  fib = [fib (fib(i)+fib(i+1))];
  fprintf('Fibonacci sequence %d = %d\n', i, fib(round(i)));
  i = i +1;
  
end