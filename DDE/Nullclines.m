clear; clc;
x = 0:0.01:0.75; y = 0:0.01:1; z = 0:0.01:22;
% a12 = 0.214; d = 17.51; s = 32.41; l = 0.61; r2 = 0.35; a21 = 0.92;
% d3 = 0.12; g = 0.073; h = 7.96e-11; a31 = 5.34;

a12 = 0.195; s = 11.5; l = 0.21;
d3 = 0.112; g = 0.29; r2 = 0.35; a21 = 0.954;
h = 7.95e-11; a31 = 5.25; d = 6;

% ------------------------------- PLANES ----------------------------------

% First nullcline
[X, Y] = meshgrid(x,y);
Z = ((s*X.^(l+1)-s*X.^(l)+a12*s*(X.^(l)).*Y)./(1-X-a12*Y-d)).^(1/l);

figure(1);
s1 = surf(X, Y, Z, 'DisplayName', 'Células tumorales');
s1.EdgeColor = 'None';
s1.FaceColor = [1 0 0];
s1.FaceAlpha = 0.5;
xlim([0,0.7]), ylim([0,1]),zlim([0,10]);
xlabel('X'), ylabel('Y'), zlabel('Z');
hold on;

% Second nullcline
[X, Z] = meshgrid(x,z);
Y = -(a21/r2)*X+1;

s2 = surf(X,Y,Z,[0 1 0], 'DisplayName', 'Células sanas');
s2.EdgeColor = 'None';
s2.FaceColor = [0 1 0];
s2.FaceAlpha = 0.5;
xlabel('X'), ylabel('Y'), zlabel('Z');
hold on;

% Third nullcline
D = @(x,z) d*(z.^l)./(s*(x.^l)+(z.^l));
f = @(x,y,z) 1-d3*z+g*z.*((D(x,z).^2).*(x.^2))./(h+((D(x,z).^2).*(x.^2)))-a31*x.*z;

s3 = fimplicit3(f,'DisplayName', 'Células efectoras');
s3.EdgeColor = 'None';
s3.FaceColor = [0 0 1];
s3.FaceAlpha = 0.5;
hold on;

% Fourth nullcline (Plane x-z)
[X, Z] = meshgrid(x,z);
Y = zeros(size(X));

s2 = surf(X,Y,Z,[0 1 0]);
s2.EdgeColor = 'None';
s2.FaceColor = [0 1 0];
s2.FaceAlpha = 0.2;
s2.Annotation.LegendInformation.IconDisplayStyle = 'off';
xlabel('X'), ylabel('Y'), zlabel('Z')

% Fifth nullcline
[Y, Z] = meshgrid(y,z);
X = zeros(size(Y));

s2 = surf(X,Y,Z,[0 1 0]);
s2.EdgeColor = 'None';
s2.FaceColor = [0 1 0];
s2.FaceAlpha = 0.2;
s2.Annotation.LegendInformation.IconDisplayStyle = 'off';
xlim([0,0.75]), ylim([0,1]);
xlabel('X'), ylabel('Y'), zlabel('Z')

text(0.4, 0.5, 1, '\Pi_1','FontSize', 16, 'Color', [1 0 0]); % P1
text(0.3, 0.5, 6, '\Pi_2','FontSize', 16, 'Color', [0 1 0]); % P2
text(0.1, 0.2, 6, '\Pi_3','FontSize', 16, 'Color', [0 0 1]); % P3

% --------------------------- FIXED POINTS --------------------------------

% pf1 = plot3(0, 1, 8.4, '.', 'MarkerSize', 20, 'Color', [0 0.61 0.063]); % x1
% pf2 = plot3(0.71, 0, 0.26, '.', 'MarkerSize', 20, 'Color', [0 0.61 0.063]); % x2
% pf3 = plot3(0, 1, 21.21, '.', 'MarkerSize',20, 'Color', [0 0.61 0.063]); % x3
% pf4 = plot3(0, 0, 8.4, '.', 'MarkerSize', 20, 'Color', [0 0 0]); % x4
% pf5 = plot3(0.36, 0, 0.51, '.', 'MarkerSize', 20, 'Color', [0 0 0]); % x5
% pf6 = plot3(0.37, 0.031, 0.5, '.','MarkerSize', 20, 'Color', [0 0 0]); % x6


% pf1.Annotation.LegendInformation.IconDisplayStyle = 'off';
% pf2.Annotation.LegendInformation.IconDisplayStyle = 'off';
% pf3.Annotation.LegendInformation.IconDisplayStyle = 'off';
% pf4.Annotation.LegendInformation.IconDisplayStyle = 'off';
% pf5.Annotation.LegendInformation.IconDisplayStyle = 'off';
% pf6.Annotation.LegendInformation.IconDisplayStyle = 'off';

% text(0.0, 1.2, 8.4, 'x_1','FontSize', 16, 'Color', [0 0.61 0.063]); % x1
% text(0.6, 0, 0.6, 'x_2','FontSize', 16, 'Color', [0 0.61 0.063]); % x2
% text(0.0, 0.2, 8.4, 'x_4','FontSize', 16, 'Color', [0 0 0]); % x4
% text(0.3, 0, 0.6, 'x_5','FontSize', 16, 'Color', [0 0 0]); % x5
% text(0.4, 0, 0.6, 'x_6','FontSize', 16, 'Color', [0 0 0]); % x6


set(gca, 'Fontsize', 13)
legend()

