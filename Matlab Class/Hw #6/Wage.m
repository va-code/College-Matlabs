clear all
hr = input('Hours of Work =');

rate = 15;

if hr < 40
  grosspay = hr*rate;
else
  grosspay = (hr-40)*2*rate +40*rate;
  
endif

fprintf('Weekly Gross Pay = $%d\n',grosspay);
