clear all
n_stage = 20;
##y = zeros(1,n_stage);

y0 = 1;
req_imp = .05;
r_fil = 1/2;
#r_rem = 1- r_fil;
##y(1) = r_rem*y0;

x = 0:n_stage;
y = y0*(r_fil.^x);
n = (log(req_imp))/(log(r_fil*y0));
n_5p = round(n+1);


n_plot = 0:n_stage;
y_plot = y;
plot(n_plot,y_plot,'b-o');
title('Impurity Level vs # of Stages'), xlabel('Number of Stages'),ylabel('Impurity Level, y'),grid on;

fprintf('Minimum number of stages for 95%% filtration is n = %d with y = %4.2f%%\n',n_5p,y(n_5p+1)*100);

