function dydt = modelDDE(t, y, Z)
%     l = 0.21; s = 11.5; d = 5;
%     a12 = 0.195; r2 = 0.35; a21 = 0.954; d3 = 0.112; g = 0.29;
%     h = 7.95e-11; a31 = 5.25;
%     d = 9; l = 0.61;

    l = 0.61; s = 32.4; d = 17.51;
    a12 = 0.214; r2 = 0.35; a21 = 0.92; d3 = 0.12; g = 0.073;
    h = 7.96e-11; a31 = 5.34;

    xx = y(1); xlag = Z(1);
    yy = y(2);
    zz = y(3); zlag = Z(3);
    K = d*(zlag^l)/(s*(xlag^l) + zlag^l);
    dydt = [xx*(1-xx)-a12*yy*xx-K*xx; r2*yy*(1-yy)-a21*xx*yy; 1 - d3*zz+g*zz*(K*K*xx*xx/(h+K*K*xx*xx))-a31*xlag*zlag];
end

%% DIMENSIONAL
% function dydt = modelDDE(t, y, Z)
%     r1 = 5.14e-1; k1 = 9.8e8; a12 = 1.1e-10; r2 =1.8e-1;
%     k2 = 1e9; a21 = 4.8e-10; sigma = 0; a31 = 2.8e-9; d3 = 6.12e-2;
%     % d = 3.8; s = 0.5; l = 6.2e-1;
%     s = 0.15;
%     % Spherical maxdelay = 0.045
%     d = 9; l = 0.61;
%     % Other tumors params
%     % Papillary
%     % d = 19; s = 0.15; l = 0.87;
%     % Filamentary
%     % d = 0.89; l = 0.89;
%     % Disconnected
%     % d = 0.13; l = 0.63;
%     h = 2.02e7;
%     g = 3.75e-2;
%     T = y(1); Tlag = Z(1);
%     H = y(2);
%     E = y(3); Elag = Z(3);
%     K = d*(E^l)/(s*(T^l) + E^l);
%     dydt = [r1*T*(1-(T/k1))-a12*T*H-K*Tlag; r2*H*(1-(H/k2))-a21*T*H; sigma - d3*E+g*(K*K*T*T/(h+K*K*T*T))-a31*Tlag*Elag];
% end