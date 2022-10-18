% vamos a hacer el diagrama de bif de un sistema sencillo para comprobar 
% que se hacerlo correctamente. 
% Link: http://faculty.sfasu.edu/judsontw/ode/html-20180819/firstlook07.html

%% Example 1
f = @(lambda,x) x.^2 - 4.*x + lambda;
fimplicit(f, [0 5]);

%% Example 2
g = @(alpha,y) y.^3 - alpha.*y;
fimplicit(g)

%% Example 3
h = @(lambda,y) y.*(y-2).^2+lambda;
fimplicit(h)

%% Example 4 (more difficult)
% plot vector field 
alpha= 2;
dxdt = @(x,y) alpha.*x+5.*y-x.*(x.^2+y.^2);
dydt = @(x,y) -5.*x+alpha.*y-y.*(x.^2+y.^2);
[X,Y] = meshgrid(-2:0.2:2);
YY = dydt(X,Y);
XX = dxdt(X,Y);
quiver(X,Y,XX,YY);

% plot bif diag
y = 0.0001;
dxdt = @(alpha,x) alpha.*x+5.*y-x.*(x.^2+y.^2);
dydt = @(alpha,x) -5.*x+alpha.*y-y.*(x.^2+y.^2);
figure,
fimplicit(dxdt)
hold on;
fimplicit(dydt)

%% Example 5
clear; clc;
dxdt = @(mu,x) x.*(1-x)-mu.*(x.^0.5);
fimplicit(dxdt,[0 0.6 0 1])