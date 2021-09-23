%Vaughn Anderson


clearvars % clear all the variables from the workspace
close all % close all the figures already opened

pkg load control;

sys = tf(2660.5, [1 53.4 2660.5]);

plot(2,1,1);
step(sys);

