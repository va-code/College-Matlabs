%% Gain Design from root locus
clearvars;
close all;

% Proportional Controller:
%               367(s+77.5)
% G(s) = -----------------------
%           s^2(s^2+1)

% Design specs:
% OS: 3%
OS = 11;
zeta = -log(OS/100)/(sqrt(pi^2+log(OS/100)^2));

OLTF = zpk([-108 -1 0 0],[0 0 (-i) (i)],6.78);

rlocus(OLTF);

% from rlocus
% Design point is at sd = -0.7 +- j1.04
sd =  -1 + 1j*1.42;
% Determine the gain value at that point using 
% Magnitute criterion 1 + KG(s)H(s) = 0
% evalfr() allows you to evaluate a transfer function given the value of the
% pole
% abs() allows you to determine the magnitude of a complex number
K = abs(-1/abs(evalfr(OLTF,sd)));
% Determine CLTF
T = feedback(K*OLTF,1);

% determine poles and zeros
z = zero(T);
p = pole(T);


% They are not closed-loop zeros, that is very good
% this is from the dominant closed-loop pair poles
wn = sqrt(1.569);
zeta = 1.397/(2*wn);

osd = 100*exp(-zeta*pi/(sqrt(1-zeta^2)));
ts = 4/-real(sd);
tp = pi/imag(sd);
% simulate solution and compare
info = stepinfo(T);


%% Part B: Tp = 1.57
Tp = 1.42;
wd = pi/Tp;

% Look at the root locus for the previous value
sd = -1 +j*1.42;

K = abs(-1/abs(evalfr(OLTF,sd)));
T = feedback(K*OLTF,1);
% Estimate Ts, %OS
Ts = 4/4;
zeta = cos(atan(wd/0.4));
OS = 100*exp(-zeta*pi/sqrt(1-zeta^2));

% Simulation
plot(1,1,1);
stepinfo(T);