%% Gain Design from root locus
clearvars;
close all;
pkg install -forge control;
pkg load control;
% Proportional Controller:
%               1
% G(s) = -----------------------
%           s(s+2)(s+4)

% Design specs:
% OS: 12%
OS = 2;
zeta = -log(OS/100)/(sqrt(pi^2+log(OS/100)^2));
OLTF = zpk([],[(-17+211*i) (-17-211*i) 0 .068*i -.068*i],61.94);

rlocus(OLTF);

% from rlocus
% Design point is at sd = -0.7 +- j1.04
sd =  -20 + 1j*16.097;
% Determine the gain value at that point using 
% Magnitute criterion 1 + KG(s)H(s) = 0
% evalfr() allows you to evaluate a transfer function given the value of the
% pole
% abs() allows you to determine the magnitude of a complex number
K = abs(-1/abs(evalfr(OLTF,sd)));
% Determine CLTF
T = feedback(K*OLTF,1);

% determine poles and zeros
z = zero(T)
p = pole(T)


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
Tp = 16.097;
wd = pi/Tp;

% Look at the root locus for the previous value
sd = -20 +j*16.07;

K = abs(-1/abs(evalfr(OLTF,sd)));
T = feedback(K*OLTF,1);
% Estimate Ts, %OS
Ts = 4/20;
zeta = cos(atan(wd/0.4));
OS = 100*exp(-zeta*pi/sqrt(1-zeta^2));

% Simulation

plot(1,1,1);
stepinfo(T);