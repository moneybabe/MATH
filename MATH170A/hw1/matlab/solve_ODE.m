function solve_ODE(m)
% we solve the ODE u'(x) = x^2 with u(0) = 0
% m denotes the number of subintervals into which we divide [0,1]
%% Define the matrix on the left side of the linear system
Z = zeros(m);
D = diag(m*ones(1,m));
subD = diag(m*ones(1,m-1),-1);
A = Z+D-subD;
%% Define the vector on the right side of the linear system
v = linspace(0,1,m);
b = v.^2';
%% Solve the linear system
u = A\b;
%% Plot the analytic solution
x = linspace(0,1,100);
f = x.^3/3;
figure(1)
plot(x,f,'r')
%% Plot the approximate solution
figure(1)
hold on
plot(v,u,'b *')
hold on
plot(v,u,'b')
end