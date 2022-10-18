clear; clc;
syms x y z
s = 11.5;
a12 = 0.195;  la = 0.21;
d3 = 0.112; r2 = 0.35; 
a31 = 5.25; g = 0.29; a21 = 0.954;
h = 7.95e-11; d = 5;

%%
% Calculamos d
dvec = 6.5:0.01:7.5;
x1 = zeros(size(dvec));
x2 = zeros(size(dvec));
x3 = zeros(size(dvec));
x4 = zeros(size(dvec));
x5 = zeros(size(dvec));

for i=1:length(dvec)
    d = dvec(i);
    [sol_x,~,~] = vpasolve([x*(1-x-a12*y-(d*(z^la)/((s*x^la)+z^la)))==0, y*(r2-r2*y-a21*x)==0,1-d3*z+(g*(((d*(z^la)/((s*x^la)+z^la))^2)*(x^2)/(h+((d*(z^la)/((s*x^la)+z^la))^2)*(x^2))))*z-a31*x*z == 0], [x,y,z],[0.65 0 0.31]);
    if(size(sol_x)~=0)
    x3(i) = sol_x;
    end
    [sol_x,~,~] = vpasolve([x*(1-x-a12*y-(d*(z^la)/((s*x^la)+z^la)))==0, y*(r2-r2*y-a21*x)==0,1-d3*z+(g*(((d*(z^la)/((s*x^la)+z^la))^2)*(x^2)/(h+((d*(z^la)/((s*x^la)+z^la))^2)*(x^2))))*z-a31*x*z == 0], [x,y,z],[0.06 0 6.55]);
    if(size(sol_x)~=0)
    x4(i) = sol_x;
    end
    
    [sol_x,~,~] = vpasolve([x*(1-x-a12*y-(d*(z^la)/((s*x^la)+z^la)))==0, y*(r2-r2*y-a21*x)==0,1-d3*z+(g*(((d*(z^la)/((s*x^la)+z^la))^2)*(x^2)/(h+((d*(z^la)/((s*x^la)+z^la))^2)*(x^2))))*z-a31*x*z == 0], [x,y,z],[0.1 0.74 3.02]);
    if(size(sol_x)~=0)
    x5(i) = sol_x;
    end
end

plot(dvec,x3,'.','MarkerSize',6); hold on;
plot(dvec,x4,'.','MarkerSize',6); 
plot(dvec,x5,'.','MarkerSize',6); 

%% Calculamos a21
d = 5;
a21vec = 0:0.01:1;
x1 = zeros(size(a21vec));
x2 = zeros(size(a21vec));
x3 = zeros(size(a21vec));
x4 = zeros(size(a21vec));
x5 = zeros(size(a21vec));

for i=1:length(a21vec)
    a21 = a21vec(i);
    [sol_x,~,~] = vpasolve([x*(1-x-a12*y-(d*(z^la)/((s*x^la)+z^la)))==0, y*(r2-r2*y-a21*x)==0,1-d3*z+(g*(((d*(z^la)/((s*x^la)+z^la))^2)*(x^2)/(h+((d*(z^la)/((s*x^la)+z^la))^2)*(x^2))))*z-a31*x*z == 0], [x,y,z],[0.65 0 0.31]);
    if(size(sol_x)~=0)
    x3(i) = sol_x;
    end
    [sol_x,~,~] = vpasolve([x*(1-x-a12*y-(d*(z^la)/((s*x^la)+z^la)))==0, y*(r2-r2*y-a21*x)==0,1-d3*z+(g*(((d*(z^la)/((s*x^la)+z^la))^2)*(x^2)/(h+((d*(z^la)/((s*x^la)+z^la))^2)*(x^2))))*z-a31*x*z == 0], [x,y,z],[0.06 0 6.55]);
    if(size(sol_x)~=0)
    x4(i) = sol_x;
    end
    
    [sol_x,~,~] = vpasolve([x*(1-x-a12*y-(d*(z^la)/((s*x^la)+z^la)))==0, y*(r2-r2*y-a21*x)==0,1-d3*z+(g*(((d*(z^la)/((s*x^la)+z^la))^2)*(x^2)/(h+((d*(z^la)/((s*x^la)+z^la))^2)*(x^2))))*z-a31*x*z == 0], [x,y,z],[0.1 0.74 3.02]);
    if(size(sol_x)~=0)
    x5(i) = sol_x;
    end
end

plot(a21vec,x3,'.','MarkerSize',6); hold on;
plot(a21vec,x4,'.','MarkerSize',6); 
plot(a21vec,x5,'.','MarkerSize',6); 

