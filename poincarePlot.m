clc; clear;

sol = ode23(@modelODE, [0 1], [1 0.55 0.12]);
xx = [sol.y(1,:)' sol.y(2,:)' sol.y(3,:)'];
plane.norm = 1; plane.dist = 0.5;
P = poincareMap(xx, plane);
plot( P(1:end-1), P(2:end) , '.', 'MarkerSize',6); xlabel z_{n-1}; ylabel z_n; title 'Poincare Map'



