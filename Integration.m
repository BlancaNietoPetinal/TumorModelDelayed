%% PLOT LYSIS DELAY vs LYSIS NO DELAY
% lysis no delay
clear; clc;
ratio = 0:0.01:10;
lys = zeros(size(ratio));
T0 = 0.15; H0 = 1; E0 = ratio*T0;
tspan = [0 0.5];
delay = 0.1;
for i = 1:length(ratio)
    sol = ode23(@modelODE, tspan, [T0 H0 E0(i)]);
    solDel = dde23(@modelDDE, delay, [T0 H0 E0(i)],tspan);
    T = sol.y(1,end);
    TDel = solDel.y(1,end);
    lys(i) = (T0-T)/T0;
    lysDel(i) = (T0-TDel)/T0;
end

plot(ratio, lys, ratio, lysDel, 'LineWidth',1.5)
xlabel('E_0/T_0')
ylabel('Tumor lysis')

set(gca, 'FontSize', 12)
legend('Sin retardo', 'Con retardo')
%% PLOT CELLS VS TIME (DELAY AND NO DELAY)
clc; clear;
tspan = [0 5];
T0 = 0.30; H0 = 1; E0 = 0.1;
delay = 0.1;

[t,y] = ode23(@modelODE, tspan, [T0 H0 E0]);
solDelay = dde23(@modelDDE, delay, [T0 H0 E0], tspan);
plot(t, y(:,1), 'Color',[0.6 0 0], 'LineWidth',1.2);
hold on;
plot(t, y(:,2), 'Color',[0 0.6 0],'LineWidth',1.2);
plot(t, y(:,3), 'Color',[0 0 0.6], 'LineWidth',1.2);
plot(solDelay.x, solDelay.y(1,:), 'Color', [1 0.41 0.41], 'LineWidth',1.2); 
plot(solDelay.x, solDelay.y(2,:), 'Color',[0.41 1 0.41], 'LineWidth',1.2)
plot(solDelay.x, solDelay.y(3,:),'Color',[0.41 0.41 1], 'LineWidth',1.2)

text(1.9, 0.3,'Células tumorales', 'Color', [0.6 0 0])
text(0.2, 0.65 ,'Células efectoras', 'Color', [0 0 0.6])
text(3, 0.8 ,'Células sanas', 'Color', [0 0.6 0])

xlabel('tiempo'); ylabel('Número de células');
ylim([0 2])
set(gca, 'fontsize', 12)