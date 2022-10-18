%% FIND FIXED POINTS
clc; clear;
% x0 = [0.3; 0; 0.01];
% x0 = [0.1; 0.1; 0.1];
% x0 = [0.0001, 0.8, 1];
% x0 = [0.0001,0.0001, 1];
% x0= [0.0001, 0.2, 0.0001];
x0 = [0 0 8];

x0 = [0.3; 0; 0.5];
options = optimoptions('fsolve','Display','none','PlotFcn',@optimplotfirstorderopt);
x = fsolve(@fun,x0,options);

%% PLOT FIXED POINTS


function F = fun(xx)
% a12 = 0.195; d = 5; la = 0.21; s = 11.5; r2 = 0.35;a21 = 0.954; d3 = 0.112;
% g = 0.29; h = 7.95e-11;a31 = 5.25;

a12 = 0.214; d = 17.51; s = 32.41; la = 0.61; r2 = 0.35; a21 = 0.92;
d3 = 0.12; g = 0.073; h = 7.96e-11; a31 = 5.34;

x = xx(1); y = xx(2); z = xx(3);
F(1) = x*(1-x-a12*y-d*(z^la)/(s*x^la+z^la));
F(2) = y*(r2-r2*y-a21*x);
F(3) = 1-d3*z+g*z*((d*(z^la)/(s*x^la+z^la))^2*x^2)/(h+(d*(z^la)/(s*x^la+z^la))^2*x^2)-a31*z*x;
end