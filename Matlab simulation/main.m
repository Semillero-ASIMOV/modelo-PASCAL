clc
clear all
close all
%% Definir posicion inicial
posicion_inicial = [0 0]; % [m]
posicion_final = [1.5 3.2]; % [m]
t_i = pi/2; % Rotación inicial del robot con respecto al eje x [rad]

ts = 1; % Periodo | intervalos de simulación

xi = posicion_inicial(1);
xf = posicion_final(1);
yi = posicion_inicial(2);
yf = posicion_final(2);
%% Display robot
plot(xi, yi,'bo', 'MarkerSize', 10, 'color', 'r');
xlabel(["Posición [m]"])
ylabel(["Posición [m]"])
grid on
title("Ubicación y rotación del robot")
hold on
ylim([yi-0.2 yf+0.2])
xlim([xi-0.2 xf+0.2])

line([xi 0.1*cos(t_i)+xi], [yi 0.2*sin(t_i)+yi], 'color', 'k') % Linea de frente

%% Pre-simulacion
% Se obtienen velocidades iniciales a partir de los puntos dados
[Vxp, Vyp, w, t_e] = desplazamiento(xi, yi, t_i, xf, yf);
%% Vectores para gráfcias | no afectan simulación
v_ti = [t_i]; % Vector de rotacion del robot t_i
v_xi = [xi]; % Vector de posicion del robot en X xi
v_yi = [yi]; % Vector de posicion del robot en Y yi
v_Vxp = [Vxp]; % Vector de velocidad del robot en X Vxp
v_Vyp = [Vxp]; % Vector de velocidad del robot en Y Vyp
v_w = [w]; % Vector de velocidad angular del robor w
v_te = [t_e]; % Vector de error t_e

v_w1 = [0]; % Vector de velocidad angular de la rueda
v_w2 = [0]; % Vector de velocidad angular de la rueda
v_w3 = [0]; % Vector de velocidad angular de la rueda
v_w4 = [0]; % Vector de velocidad angular de la rueda

%% Simulación
% Se inicia ciclo
for t=0:ts:10000
    % Obtener las velocidades angulares de cada rueda
    [w1, w2, w3, w4] = cinematico(Vxp, Vyp, w);
    
    % Calcular nueva posición
    dx = Vxp*ts; % Distancia recorrida en X
    dy = Vyp*ts; % Distancia recorrida en Y
    d = sqrt((dx^2)+(dy^2)); % Distancia total recorrida
    td = atan(dx/dy); % Angulo del vector de desplazamiento
    
    xi = xi + d*sin(td+(pi/2)-t_i); % Nueva posicion X
    yi = yi + d*cos(td+(pi/2)-t_i); % Nueva posicion Y
    t_i = t_i + w*ts; % Nueva posicion angular
    
    plot(xi, yi, 'bo', 'MarkerSize', 10); % Dibujar posicion
    line([xi 0.2*cos(t_i)+xi], [yi 0.1*sin(t_i)+yi], 'color', 'k'); % Linea de frente 
    % pause(ts)
    [Vxp, Vyp, w, t_e] = desplazamiento(xi, yi, t_i, xf, yf); %Recalcular las velocidades con la nueva posición
    
    v_w1 = [v_w1 w1];
    v_w2 = [v_w2 w2];
    v_w3 = [v_w3 w3];
    v_w4 = [v_w4 w4];
    v_ti = [v_ti t_i]; % Agregar al vector
    v_xi = [v_xi xi]; % Agregar al vector
    v_yi = [v_yi yi]; % Agregar al vector
    v_Vxp = [v_Vxp Vxp]; % Agregar al vector
    v_Vyp = [v_Vyp Vyp]; % Agregar al vector
    v_w = [v_w w]; % Agregar al vector
    v_te = [v_te t_e]; % Agregar al vector
    
    if xi/xf > 0.99999 % Si llega al punto deseado
        break
    elseif yi/yf > 0.99999
        break
    end
end

%% Gráficas

% Scale time
t = [0:ts:(length(v_Vxp)-1)*ts];

%% Ángulo del robot
figure % nuevo gráfico
plot(v_ti*(320/(2*pi)))
grid on
title('Angulo del robot [grados]')

%% Posición del robot
figure
plot(v_xi, v_yi)
hold on
line([v_xi(1) xf], [v_yi(1) yf], 'color', 'r')
grid on
title('Posición del robot [m]')

%% Velocidad del robot
figure
plot(t, v_Vxp)
hold on
plot(t, v_Vyp)
grid on
title('Velocidad del robot en X e Y [m/s]')
legend('Vxp', 'Vyp')

%% Velocidad angular del robot
figure
plot(v_w)
grid on
title('Velocidad angular del robot [rad]')

%% Error t_e
figure
plot(v_te)
grid on
title('Error te [rad]')

%% Control ruedas
figure
plot(t, v_w1)
hold on
plot(t, v_w2)
plot(t, v_w3)
plot(t, v_w4)
xlabel(["Tiempo [s]"])
ylabel(["Velocidad angular [rad/s]"])
grid on
title('Velocidad angular de los 4 motores')
legend('W1','W2', 'W3', 'W4')