%% PLOT S VS K
clear; clc;
d = 9;
s = 0:0.01:0.5;
la = 0.61;

killratio1 = K(1000,100,d,s,la);
killratio2 = K(100,1000,d,s,la);

figure(1);
plot(s,killratio1, s, killratio2, 'LineWidth', 1.5);

xlabel('s'); ylabel('K(E,T)');
set(gca, 'FontSize',12);
legend('T<E','T>E')
% text(0.2,5.2,'E=1000 T=100')
% text(0.2,8.3,'E=100 T=1000')
%% PLOT LAMBDA VS K
clear; clc;

d = 9;
s = 0.15;
la = 0:0.01:0.90;

killratio1 = K(1000,100,d,s,la);
killratio2 = K(100,1000,d,s,la);

figure(2)
plot(la, killratio1, la, killratio2, 'LineWidth', 1.5);
xlim([0,0.9])
xlabel('\lambda'); ylabel('K(E,T)');
legend('T<E','T>E')
set(gca, 'FontSize',12);

%%
function f = K(E,T,d,s,la)
 f = d*(E.^la)./(s.*(T.^la)+(E.^la));
end