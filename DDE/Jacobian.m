clc; clear;
syms x y z

% CALCULO J0 
syms a12 d lambda s r2 a21 d3 g h a31 la K

% Parámetros del articulo
% a12 = 0.195; d = 5; la = 0.21; s = 11.5; r2 = 0.35; a21 = 0.954; d3 = 0.112;
% g = 0.29; h = 7.95e-11;a31 = 5.25;

K =  d*(z^la)/(s*x^la+z^la);
f1 = x*(1-x-a12*y-K);
f2 = y*(r2-r2*y-a21*x);
f3 = 1-d3*z+g*z*(((K^2)*(x^2))/(h+(K^2)*(x^2)))-a31*z*x;

J0 = jacobian([f1, f2, f3],[x,y,z]);


%% CALCULO Jtau

syms tau

% K = @(x,z)  5*(z^0.21)/(11.5*x^0.21+z^0.21);

j1_1 = -K*exp(-lambda*tau);
j1_2 = 0;
j1_3 = 0;

j2_1 = 0;
j2_2 = 0;
j2_3 = 0;

j3_1 = -a31*z*exp(-lambda*tau);
j3_2 = 0;
j3_3 = -a31*x*exp(-lambda*tau);

Jtau = [j1_1 j1_2 j1_3; j2_1 j2_2 j2_3; j3_1 j3_2 j3_3];


%% Sustitución y cálculo numérico

J = J0 + Jtau; 
I = lambda*eye(3);
D = det(J-I);

% Parametros modelo esférico 
tau = 0;
a12 = 0.214; d = 17.5; s = 32.4; r2 = 0.35; a21 = 0.915; d3 = 0.119;
g = 0.073; h = 7.96e-11; a31 = 5.34; la = 0.61;

D=limit(D,x,0); % uncomment if problems with division by 0
%x = 0.71; 
y = 1; 
z = 8.4; 

D = subs(D);
eqn = D == 0;

% si queremos encontrar una solucion analitica
% [PolySol, params, conditions] = solve(eqn,lambda,'ReturnConditions',true);
% PolySol = solve(eqn,lambda,'IgnoreAnalyticConstraints',true); 

% para soluciones numéricas
PolySol = vpasolve(eqn,lambda);

% PolySol = subs(PolySol);
vpa(PolySol,2)
