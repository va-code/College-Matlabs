clear all
h = input('height in [m] =');
w = input('weight in [kg] =');

BMI = w/(h*h);

if BMI < 18.5
  CAT = 'Underweight';
elseif 18.5 < BMI && BMI< 24.9
  CAT = 'Normal Weight';
elseif 25 <= BMI && BMI <29.9
  CAT = 'Overweight';
else
  CAT = 'Obesity';
  
endif

fprintf('BMI = %4.2f, BMI Catagory = %s\n',BMI,CAT);