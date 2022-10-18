clear;clc;
r = 0:0.01:100;

for i = 1:length(r)
    sol = ode23(@(t,y)lorenzModel(t,y,r(i)),[0 25],[1 1 1]);
    plot(r(i),sol.y(3,end-5:end),'.','MarkerSize',1)
    hold on;
end

function f = lorenzModel(t,w,r)
    x = w(1); y = w(2); z = w(3);
    f = [10*(y-x); r*x-y-x*z; x*y-6*z];
end