clc; clear;

sol = dde23(@modelDDE, 0.9, [0.71 0 0.26],[0 10]);
xx = [sol.y(3,:)' sol.y(1,:)' sol.y(2,:)' ];
plane.norm = 10; plane.dist = 0.715;
P = poincareMap(xx, plane);
plot( P(1:end-1), P(2:end) , '.', 'MarkerSize',8); xlabel z_{n-1}; ylabel z_n; title 'Poincare Map'
xlim([-0.1 0.8])
ylim([-0.1 0.3])
%%

clc;clear;
delay = 0.01:0.01:1;
tspan = [0 7];
IC2 = [0.71 0 0.26];

 plane.norm = 1; plane.dist = 0.71;
figure,
for i = 1:length(delay)
%     sol = dde23(@modelDDE, delay(i), IC1, tspan);
%     plot(delay(i),sol.y(1,end),'.','MarkerSize',3); hold on;
    sol = dde23(@modelDDE, delay(i), [0.71 0 0.26],[0 10]);
    xx = [sol.y(2,:)' sol.y(3,:)' sol.y(1,:)'];
   
    P = poincareMap(xx, plane);
    if(size(P,1) ~= 0)
        plot(delay(i),P(:,3),'.','MarkerSize',3); hold on;
    end
end

xlabel('\tau');
ylabel('x');
set(gca,'FontSize',12)



