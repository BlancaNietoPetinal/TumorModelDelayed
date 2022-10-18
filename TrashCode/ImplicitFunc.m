clear; clc;

% z = 0.5; y = 0.5;
z = 0.5; y = 0.1;
s = 11.5; l = 0.21; r2= 0.35; 
% a21 = 0.954;
d3 = 0.112; g = 0.29;
h = 7.95e-11; a12 = 0.195;
a31 = 5.35; 
% d = 5;

% D = @(d,x) ;
% f = @(d,x) 1-d3*z+g*z*(((d.*(z.^l)./(s*(x.^l)+(z.^l))).^2).*(x.^2))./(h+(((d.*(z.^l)./(s*(x.^l)+(z.^l))).^2).*(x.^2)))-a31*x.*z;
% 
% f = @(d,x) 1-d3*z+g*z*(((d.*(z^l)./(s*(x.^l) + z^l)).^2).*(x.^2))./(h+((d.*(z^l)./(s*(x.^l) + z^l)).^2).*(x.^2))-a31*x.*z;
% K = @(d,x) d.*(z^l)./(s*(x.^l) + z^l);
% 
% fimplicit(f)

% Z = @(d,x) x.*(1-x-a12*y-(d.*(z.^l)./(s*(x.^l)+(z.^l))));
% fimplicit(Z, [6.5 7.5 0 1])

dydt = @(a21,x) y*(r2-r2*y-a21.*x);
fimplicit(dydt, [0 1 0 1])


% function sol = f(d,T)
% E = 0.1; s = 11.5; l = 0.21;
% K = d.*(E^l)./(s*(T.^l) + E^l);
% sol = (K^2)*(T.^2);
% %      
% %     
% %     d3 = 0.112; g = 0.29;
% %     h = 7.95e-11; a31 = 5.35; 
% %     K = d*(E^l)/(s*(T^l) + E^l);
% %     sol = 1 - d3*E+g*E*(K*K*T*T/(h+K*K*T*T))-a31*T*E;
% end