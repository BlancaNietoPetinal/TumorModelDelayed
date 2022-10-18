%% PLOT FIXED POINTS

%% PLOT FIXED POINTS
clear; clc;

delay = 1;

% first [0 1 8.4]
IC = [0.1 1 8.4];
sol = dde23(@modelDDE,delay,IC,[0 5]);
plot(sol.x,sol.y(1,:),'LineWidth',1.1)
hold on;

% second [0.71 0 0.26]
IC = [0.6 0 0.26];
sol = dde23(@modelDDE,delay,IC,[0 5]);
plot(sol.x,sol.y(1,:),'LineWidth',1.1)
hold on;
IC = [0.8 0 0.26];
sol = dde23(@modelDDE,delay,IC,[0 5]);
plot(sol.x,sol.y(1,:),'LineWidth',1.1)
hold on;


% third [0 1 21.21]
% IC = ;
% sol = dde23(@modelDDE,delay,IC,[0 5]);
% plot(sol.x,sol.y(1,:))
% hold on;

% fourth [0 0 8.4]
% IC = ;
% sol = dde23(@modelDDE,delay,IC,[0 5]);
% plot(sol.x,sol.y(1,:))
% hold on;

% fifth [0.36 0.031 0.5]
IC = [0.35 0.031 0.5];
sol = dde23(@modelDDE,delay,IC,[0 5]);
plot(sol.x,sol.y(1,:),'LineWidth',1.1)
hold on;
IC = [0.4 0.031 0.5];
sol = dde23(@modelDDE,delay,IC,[0 5]);
plot(sol.x,sol.y(1,:),'LineWidth',1.2)
hold on;


% fifth [0.36 0.031 0.5]
% IC = ;
% sol = dde23(@modelDDE,delay,IC,[0 5]);
% plot(sol.x,sol.y(1,:),'LineWidth',1.3)
% hold on;

yline(0.36,'LineStyle','--');
yline(0.71,'LineStyle','--');
yline(0,'LineStyle','--');

text(4.6, 0.07, 'x_1^*','FontSize', 12, 'Color', [0 0 0]); % P1
text(4.6, 0.41, 'x_2^*','FontSize', 12, 'Color', [0 0 0]); % P2
text(0.1, 0.66, 6, 'x_5^*','FontSize', 12, 'Color', [0 0 0]); % P5


xlabel('tiempo (días)')
ylabel('x (células tumorales)')
set(gca,'FontSize',13)