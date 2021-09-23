%Group project: Dodge Dakota Vibration
% f(t) = m*x'' + c*x' + k*x
options = odeset('MaxStep', 1e-3);

[t,x] = ode45(@odefcn,[0 10],[0;0.05],options);

%plot(t,x(:,1),'-o',t,x(:,2),'-o')
xnew = x(:,1).+x(:,2);
plot(t,xnew,'-o')

xlabel('Time t');
ylabel('x');







