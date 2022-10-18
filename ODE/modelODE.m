
function dydt = modelODE(t,y)
    T = y(1); H = y(2); E = y(3);

    % ADIMENSIONAL MODEL (S)
    l = 0.61; s = 32.4; d = 17.51;
    a12 = 0.214; r2 = 0.35; a21 = 0.92; d3 = 0.12; g = 0.073;
    h = 7.96e-11; a31 = 5.34;

%     a12 = 0.195; d = 5; s = 11.5; l = 0.21;
%     r2 = 0.35; a21 = 0.954; d3 = 0.112; g = 0.29;
%     h = 7.95e-11; a31 = 5.25;
    
    K = d*(E^l)/(s*(T^l) + E^l);
    dydt = [T*(1-T)-a12*T*H-K*T; r2*H*(1-H)-a21*T*H; 1-d3*E+g*E*(K*K*T*T/(h+K*K*T*T))-a31*T*E];
     
end


%% PARAMS FOR DIMENSIONALIZED SYSTEM
%  r1 = 5.14e-1; k1 = 9.8e8; a12 = 1.1e-10; r2 =1.8e-1;
%  k2 = 1e9; a21 = 4.8e-10; sigma = 0; a31 = 2.8e-9; d3 = 6.12e-2;
%  d = 9; l = 0.61; s = 0.15; 
% Spherical
%  h = 2.02e7; g = 3.75e-2;
% Papillary
%  d = 19; s = 0.15; l = 0.87;
% Filamentary
%  d = 0.89; l = 0.89;
% Disconnected
%  d = 0.13; l = 0.63;
%  fr = E/T; K = d*(fr^l)/(s+fr^l);

%      dydt = [r1*T*(1-T/k1)-a12*T*H-K*T; r2*H*(1-H/k2)-a21*T*H; sigma - d3*E+g*(K*K*T*T/(h+K*K*T*T))-a31*T*E]; 