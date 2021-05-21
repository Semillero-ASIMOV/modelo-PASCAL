function [Vxp, Vyp, w, t_e] = desplazamiento(xi, yi, t_i, xf, yf)
% t_i | Angulo del robot

k_owr =  0.7; % Circulo de seguridad del robot [m]
k_r = 0.1; % Circulo de seguridad del punto de llegada [m]

Vxmax = 0.5; % Velocidad maxima del robot [m/s]
Vymax = 0.5; % Velocidad máxima del robot [m/s]
Wmax = 0.4; % Velocidad angular maxima del robot [rad/s]

dg = sqrt((xf-xi)^2+(yf-yi)^2); % Magnitud vector de punto deseado [m]

t_g = atan((yf-yi)/(xf-xi)); % Angulo con el punto dg [rad]
t_e = t_i - t_g; % Angulo de error [rad]
w = Wmax*sin(t_e); % Velocidad angular del robot

if dg>(k_r+k_owr)
    Vxp = Vxmax*sin(t_e);
    Vyp = Vymax*cos(t_e);
elseif dg<(k_r + k_owr)
    Vxp = (Vxmax/(k_r+k_owr))*dg*sin(t_e);
    Vyp = (Vymax/(k_r+k_owr))*dg*cos(t_e);
else
    Vxp = 0;
    Vyp = 0;
end