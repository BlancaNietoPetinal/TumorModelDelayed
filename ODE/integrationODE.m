%% PLOT TUMOR CELLS VS TIME
clear; clc;

T0 = 0.15; H0 = 1; E0 = 0.1;
tspan = [0 30];
[t,y] = ode23(@modelODE, tspan, [T0 H0 E0]);

figure
plot(t,y(:,1), t,y(:,2), t,y(:,3), 'LineWidth',1.2)
xlabel('tiempo'); ylabel('Número de células')
legend('Tumor', 'Healthy', 'Effector');
set(gca, 'FontSize', 12)
%% Lysis vs Ratio
clc; clear;
T0 = 0.8; H0 = 1;
ratio = 0:0.01:4;
E0 = ratio*T0;
lysisratio = zeros(size(E0));
for i=1:size(E0,2)
    [t,y] = ode23(@modelODE,[0 1], [T0 H0 E0(i)]);
    lysisratio(i) = (T0-y(end,1))/T0;
end

plot(ratio, lysisratio)
% ylim([0 1])

% figure,
% plot(t,y(:,1), t,y(:,2), t ,y(:,3))
% title('Tumor lysis without delay')
% legend('Tumor', 'Healthy', 'Effector')

% plot E0/T0 ratio

%%
clc; clear;
T0 = 0.03; H0 = 0; E0 = 0.5;
tspan = [0 5];
sol = dde23(@modelDDE,0.00001, [T0 H0 E0], tspan);
plot3(sol.y(1,:),sol.y(2,:),sol.y(3,:))

