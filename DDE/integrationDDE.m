%% PLOT LYSIS OF TUMOR CELLS
clear; clc;

delay = 0.005;
tspan = [0 1];
T0 = 100; H0 = 1000; E0 = 0.5*T0;
solNDelay = dde23(@modelDDE, delay, [T0 H0 E0], tspan);
lys = (T0-solNDelay.y(1,:))/T0;
figure,
plot(solNDelay.x, lys)
title('Tumor cells')


%%
clear; clc;
tspan = [0 0.167];
delays = 0.001:0.001:0.167;
for i = size(delays)
    solNDelay = dde23(@modelDDE, delays(i), [0.15 1 0.1], tspan);
    if (isa(solNDelay.y, "double"))
        T(i) = solNDelay.y(1,end);
        H(i) = solNDelay.y(2,end);
        E(i) = solNDelay.y(3,end);
    else
        T(i) = 0;
        H(i) = 0;
        E(i) = 0;
    end
end
plot(delays,E)


%% PLOT NO-DELAY VS DELAY
clc; clear;
tspan = [0 1];
T0 = 1000; H0 = 100000; delay = 0.005;
delays = [0.05 0.5 5]; 
ratio = 0.01:0.01:1;
E0 = ratio*T0;

% no delay
lysisratioNDelay = zeros(size(delays,2), size(E0,2));
lysisratioDelay = zeros(size(delays,2), size(E0,2));

EDelay = zeros(size(delays,2), size(E0,2));
E = zeros(size(delays,2), size(E0,2));
    for i=1:size(E0,2)
        solNDelay = ode23(@modelODE, tspan, [T0 H0 E0(i)]);
        solDelay = dde23(@modelDDE, delay, [T0 H0 E0(i)], tspan);
        y = solNDelay.y;
        lysisratioNDelay(j, i) = (T0-y(1,end))/T0;
        y = solDelay.y;
        lysisratioDelay(j, i) = (T0-y(1,end))/T0;

    end
plot(ratio, lysisratioDelay(1,:), 'r', ratio, lysisratioNDelay(1,:), 'k');
title('Filamentary')
xlabel('E_0/T_0')
ylabel('Lysis')
legend(num2str(delay', 'delay = %0.2f'), 'delay = 0')
set(gca, 'fontsize', 12)

%% PLOT E/T VS LYSIS RATIO WITH DIFFERENT DELAYS
tspan = [0 0.5];
T0 = 1000; H0 = 100000; delay = 5;
delays = [0.05 0.5 5]; 
ratio = 0:0.01:1;
E0 = ratio*T0;

lysisratio = zeros(size(delays,2), size(E0,2));
lysisratioNDelay = zeros(1, size(E0,2));
for j= 1:size(delays,2)
    for i=1:size(E0,2)
        sol = dde23(@tumorlysisDDE, delays(j), [T0 H0 E0(i)], tspan);
        y = sol.y;
        lysisratio(j, i) = (T0-y(1,end))/T0;
    end
end

for i=1:size(E0,2)
        solNDelay = ode23(@tumorlysisODE, tspan, [T0 H0 E0(i)]);  
        y = solNDelay.y;
        lysisratioNDelay(1, i) = (T0-y(1,end))/T0;
end

plot(ratio, lysisratio);
% ylim([0.9 1.05])
% xlim([0 0.1]);
title('Filamentary')
xlabel('E_0/T_0')
ylabel('Lysis')
legendCell = cellstr(num2str(delays', 'delay = %0.3f'));
legend(legendCell);
set(gca, 'fontsize', 12)



