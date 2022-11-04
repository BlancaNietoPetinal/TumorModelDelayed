clc; clear;
syms x y z a12 d lambda s r2 a21 d3 g h a31 la K tau

% CALCULO J0 
K =  d*(z^la)/(s*x^la+z^la);
f1 = x*(1-x-a12*y-K);
f2 = y*(r2-r2*y-a21*x);
f3 = 1-d3*z+g*z*(((K^2)*(x^2))/(h+(K^2)*(x^2)));
J0 = jacobian([f1, f2, f3],[x,y,z]);


% CALCULO Jtau
% K = @(x,z)  5*(z^0.21)/(11.5*x^0.21+z^0.21);
% j1_1 = -K;
j1_1 = 0;
j1_2 = 0;
j1_3 = 0;

j2_1 = 0;
j2_2 = 0;
j2_3 = 0;

j3_1 = -a31*z;
j3_2 = 0;
j3_3 = -a31*x;

Jtau = [j1_1 j1_2 j1_3; j2_1 j2_2 j2_3; j3_1 j3_2 j3_3];

% Sustitución y cálculo numérico
J = J0 + exp(-lambda*tau).*Jtau; 
I = eye(3);
D = det(J-lambda*I);
% D = simplify(expand(D));

% Obtencion de los coeficientes
coeff = collect(expand(D),exp(-lambda*tau));
subcoeffs = children(coeff);

A = subcoeffs{2};
B = subcoeffs{1};

% delete exp part from B coefficient;
Bsubcoeffs = children(B);
B = Bsubcoeffs{1};

% sort a by lambda
A = coeffs(A, lambda);
B = coeffs(B, lambda);

a0 = simplify(expand(A(4)));
a1 = simplify(expand(A(3)));
a2 = simplify(expand(A(2)));
a3 = simplify(expand(A(1)));

b1 = simplify(expand(B(3)));
b2 = simplify(expand(B(2)));
b3 = simplify(expand(B(1)));


%% estudio sin retardo (tau = 0);
% polinomio: c0*x^3 + c1*x^2 + c2*x + c3
x = 0.36; y = 0;z = 0.51; tau = 0; 
a12 = 0.214; d = 17.5; s = 32.4; r2 = 0.35; a21 = 0.915;
d3 = 0.119; g = 0.073; h= 7.96e-11; a31=5.34; la = 0.61;

c0 = (a1+b1)/a0;
c1 = (a2+b2)/a0;
c2 = (a3+b3)/a0;

cond1 = c0;
cond2 = c2;
cond3 = c0*c1-c2;

vpa(subs(cond1))
vpa(subs(cond2))
vpa(subs(cond3))




