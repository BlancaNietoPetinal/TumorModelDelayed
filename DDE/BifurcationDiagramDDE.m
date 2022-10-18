%% DDE BIFURCATION DIAGRAM
clc; clear;
syms x y z
a12 = 0.214; s = 32.4;
la = 0.61; r2 = 0.35; a21 = 0.915; d3 = 0.119;
g = 0.073; h = 7.96e-11; a31 = 5.34;
d = 17.5;

%%  d
dvec = 19:0.01:20.5;

x2 = zeros(size(dvec));
x5 = zeros(size(dvec));

for i=1:length(dvec)
    d = dvec(i);

%     [sol_x,~,~] = vpasolve([x*(1-x-a12*y-(d*(z^la)/((s*x^la)+z^la)))==0, y*(r2-r2*y-a21*x)==0,1-d3*z+(g*(((d*(z^la)/((s*x^la)+z^la))^2)*(x^2)/(h+((d*(z^la)/((s*x^la)+z^la))^2)*(x^2))))*z-a31*x*z == 0], [x,y,z],[0 1 8.4]);
%     if(size(sol_x)~=0)
%     x1(i) = sol_x;
%     end

    [sol_x,~,~] = vpasolve([x*(1-x-a12*y-(d*(z^la)/((s*x^la)+z^la)))==0, y*(r2-r2*y-a21*x)==0,1-d3*z+(g*(((d*(z^la)/((s*x^la)+z^la))^2)*(x^2)/(h+((d*(z^la)/((s*x^la)+z^la))^2)*(x^2))))*z-a31*x*z == 0], [x,y,z],[0.71 0 0.26]);
    if(size(sol_x)~=0)
    x2(i) = sol_x;
    end

%     [sol_x,~,~] = vpasolve([x*(1-x-a12*y-(d*(z^la)/((s*x^la)+z^la)))==0, y*(r2-r2*y-a21*x)==0,1-d3*z+(g*(((d*(z^la)/((s*x^la)+z^la))^2)*(x^2)/(h+((d*(z^la)/((s*x^la)+z^la))^2)*(x^2))))*z-a31*x*z == 0], [x,y,z],[0 1 21.21]);
%     if(size(sol_x)~=0)
%     x3(i) = sol_x;
%     end
%     [sol_x,~,~] = vpasolve([x*(1-x-a12*y-(d*(z^la)/((s*x^la)+z^la)))==0, y*(r2-r2*y-a21*x)==0,1-d3*z+(g*(((d*(z^la)/((s*x^la)+z^la))^2)*(x^2)/(h+((d*(z^la)/((s*x^la)+z^la))^2)*(x^2))))*z-a31*x*z == 0], [x,y,z],[0 0 8.4]);
%     if(size(sol_x)~=0)
%     x4(i) = sol_x;
%     end
    [sol_x,~,~] = vpasolve([x*(1-x-a12*y-(d*(z^la)/((s*x^la)+z^la)))==0, y*(r2-r2*y-a21*x)==0,1-d3*z+(g*(((d*(z^la)/((s*x^la)+z^la))^2)*(x^2)/(h+((d*(z^la)/((s*x^la)+z^la))^2)*(x^2))))*z-a31*x*z == 0], [x,y,z],[0.36 0 0.51]);
    if(size(sol_x)~=0)
    x5(i) = sol_x;
    end

%     [sol_x,~,~] = vpasolve([x*(1-x-a12*y-(d*(z^la)/((s*x^la)+z^la)))==0, y*(r2-r2*y-a21*x)==0,1-d3*z+(g*(((d*(z^la)/((s*x^la)+z^la))^2)*(x^2)/(h+((d*(z^la)/((s*x^la)+z^la))^2)*(x^2))))*z-a31*x*z == 0], [x,y,z],[0.37 0.031 0.5]);
%     if(size(sol_x)~=0)
%     x6(i) = sol_x;
%     end
end

dvec = dvec(1,1:118);
x2 = x2(1,1:118);
x5 = x5(1,1:118);
plot(dvec,x2,'.','MarkerSize',6); hold on;
plot(dvec,x5,'.','MarkerSize',6); 
xlabel('d');
ylabel('x');
set(gca,'FontSize',16);
legend('x2','x5');

%% g
clc; clear;
syms x y z
a12 = 0.214; s = 32.4;
la = 0.61; r2 = 0.35; a21 = 0.915; d3 = 0.119;
g = 0.073; h = 7.96e-11; a31 = 5.34;
d = 17.5;

% Calculamos d
gvec = 0:0.01:0.75;

x2 = zeros(size(gvec));
x5 = zeros(size(gvec));
x6 = zeros(size(gvec));

for i=1:length(gvec)
    g = gvec(i);

    [sol_x,~,~] = vpasolve([x*(1-x-a12*y-(d*(z^la)/((s*x^la)+z^la)))==0, y*(r2-r2*y-a21*x)==0,1-d3*z+(g*(((d*(z^la)/((s*x^la)+z^la))^2)*(x^2)/(h+((d*(z^la)/((s*x^la)+z^la))^2)*(x^2))))*z-a31*x*z == 0], [x,y,z],[0.71 0 0.26]);
    if(size(sol_x)~=0)
    x2(i) = sol_x;
    end

    [sol_x,~,~] = vpasolve([x*(1-x-a12*y-(d*(z^la)/((s*x^la)+z^la)))==0, y*(r2-r2*y-a21*x)==0,1-d3*z+(g*(((d*(z^la)/((s*x^la)+z^la))^2)*(x^2)/(h+((d*(z^la)/((s*x^la)+z^la))^2)*(x^2))))*z-a31*x*z == 0], [x,y,z],[0.36 0 0.51]);
    if(size(sol_x)~=0)
    x5(i) = sol_x;
    end

    [sol_x,~,~] = vpasolve([x*(1-x-a12*y-(d*(z^la)/((s*x^la)+z^la)))==0, y*(r2-r2*y-a21*x)==0,1-d3*z+(g*(((d*(z^la)/((s*x^la)+z^la))^2)*(x^2)/(h+((d*(z^la)/((s*x^la)+z^la))^2)*(x^2))))*z-a31*x*z == 0], [x,y,z],[0.37 0.031 0.5]);
    if(size(sol_x)~=0)
    x6(i) = sol_x;
    end
end

plot(gvec,x2,'.','MarkerSize',7);  hold on;
plot(gvec,x5,'.','MarkerSize',7); 
plot(gvec,x6,'.','MarkerSize',7); 
xlabel('g');
ylabel('x');
set(gca,'FontSize',16);
legend('x2','x5','x6');

%%  l
lavec = 0.1:0.001:0.7;

% x1 = zeros(size(lavec));
x2 = zeros(size(lavec));
% x3 = zeros(size(lavec));
% x4 = zeros(size(lavec));
x5 = zeros(size(lavec));
x6 = zeros(size(lavec));

for i=1:length(lavec)
    la = lavec(i);

%     [sol_x,~,~] = vpasolve([x*(1-x-a12*y-(d*(z^la)/((s*x^la)+z^la)))==0, y*(r2-r2*y-a21*x)==0,1-d3*z+(g*(((d*(z^la)/((s*x^la)+z^la))^2)*(x^2)/(h+((d*(z^la)/((s*x^la)+z^la))^2)*(x^2))))*z-a31*x*z == 0], [x,y,z],[0 1 8.4]);
%     if(size(sol_x)~=0)
%     x1(i) = sol_x;
%     end

    [sol_x,~,~] = vpasolve([x*(1-x-a12*y-(d*(z^la)/((s*x^la)+z^la)))==0, y*(r2-r2*y-a21*x)==0,1-d3*z+(g*(((d*(z^la)/((s*x^la)+z^la))^2)*(x^2)/(h+((d*(z^la)/((s*x^la)+z^la))^2)*(x^2))))*z-a31*x*z == 0], [x,y,z],[0.71 0 0.26]);
    if(size(sol_x)~=0)
    x2(i) = sol_x;
    end

%     [sol_x,~,~] = vpasolve([x*(1-x-a12*y-(d*(z^la)/((s*x^la)+z^la)))==0, y*(r2-r2*y-a21*x)==0,1-d3*z+(g*(((d*(z^la)/((s*x^la)+z^la))^2)*(x^2)/(h+((d*(z^la)/((s*x^la)+z^la))^2)*(x^2))))*z-a31*x*z == 0], [x,y,z],[0 1 21.21]);
%     if(size(sol_x)~=0)
%     x3(i) = sol_x;
%     end
%     [sol_x,~,~] = vpasolve([x*(1-x-a12*y-(d*(z^la)/((s*x^la)+z^la)))==0, y*(r2-r2*y-a21*x)==0,1-d3*z+(g*(((d*(z^la)/((s*x^la)+z^la))^2)*(x^2)/(h+((d*(z^la)/((s*x^la)+z^la))^2)*(x^2))))*z-a31*x*z == 0], [x,y,z],[0 0 8.4]);
%     if(size(sol_x)~=0)
%     x4(i) = sol_x;
%     end
    [sol_x,~,~] = vpasolve([x*(1-x-a12*y-(d*(z^la)/((s*x^la)+z^la)))==0, y*(r2-r2*y-a21*x)==0,1-d3*z+(g*(((d*(z^la)/((s*x^la)+z^la))^2)*(x^2)/(h+((d*(z^la)/((s*x^la)+z^la))^2)*(x^2))))*z-a31*x*z == 0], [x,y,z],[0.36 0 0.51]);
    if(size(sol_x)~=0)
    x5(i) = sol_x;
    end

    [sol_x,~,~] = vpasolve([x*(1-x-a12*y-(d*(z^la)/((s*x^la)+z^la)))==0, y*(r2-r2*y-a21*x)==0,1-d3*z+(g*(((d*(z^la)/((s*x^la)+z^la))^2)*(x^2)/(h+((d*(z^la)/((s*x^la)+z^la))^2)*(x^2))))*z-a31*x*z == 0], [x,y,z],[0.37 0.031 0.5]);
    if(size(sol_x)~=0)
    x6(i) = sol_x;
    end
end

% a21vec = a21vec(1,1:118);
% x2 = x2(1,1:118);
% x5 = x5(1,1:118);
% plot(lavec,x1,'.','MarkerSize',6); 
plot(lavec,x2,'.','MarkerSize',6); hold on;
% plot(lavec,x3,'.','MarkerSize',6); 
% plot(lavec,x4,'.','MarkerSize',6); 
plot(lavec,x5,'.','MarkerSize',6); 
plot(lavec,x6,'.','MarkerSize',6); 
xlabel('\lambda');
ylabel('x');
set(gca,'FontSize',16);
legend('x2','x5','x6');

%% DELAY
clc;clear;
delay = 0.1:0.001:1;
tspan = [0 7];
IC1 = [0 1 8.4];
IC2 = [0.71 0 0.26];
IC5 = [0.36 0 0.51];
IC6 = [0.37 0.031 0.5];

figure,
for i = 1:length(delay)
%     sol = dde23(@modelDDE, delay(i), IC1, tspan);
%     plot(delay(i),sol.y(1,end),'.','MarkerSize',3); hold on;
    sol = dde23(@modelDDE, delay(i), IC2, tspan);
    plot(delay(i),sol.y(3,end-5:end),'.','MarkerSize',3); hold on;
%     sol = dde23(@modelDDE, delay(i), IC5, tspan);
%     plot(delay(i),sol.y(1,end),'.','MarkerSize',3); hold on;
%     sol = dde23(@modelDDE, delay(i), IC6, tspan);
%     plot(delay(i),sol.y(1,end),'.','MarkerSize',3); hold on;
end

xlabel('\tau');
ylabel('x');
set(gca,'FontSize',12)
