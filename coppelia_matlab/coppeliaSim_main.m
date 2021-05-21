clear all
close all
clc
%% Coppelia

sim=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
sim.simxFinish(-1); % just in case, close all opened connections
clientID=sim.simxStart('127.0.0.1',19999,true,true,5000,5);

if (clientID>-1)
    disp('Connected to remote API server');
    
    %% Main code
    % joints handle
    h = [0, 0, 0, 0];
    [r, h(1)]=sim.simxGetObjectHandle(clientID, 'rollingJoint_fl', sim.simx_opmode_blocking);
    [r, h(2)]=sim.simxGetObjectHandle(clientID, 'rollingJoint_fr', sim.simx_opmode_blocking);
    [r, h(3)]=sim.simxGetObjectHandle(clientID, 'rollingJoint_rl', sim.simx_opmode_blocking);
    [r, h(4)]=sim.simxGetObjectHandle(clientID, 'rollingJoint_rr', sim.simx_opmode_blocking);
    % robot handle
    [r, robot] = sim.simxGetObjectHandle(clientID, 'ME_Platfo2_sub1', sim.simx_opmode_streaming);
    [r, rotacion] = sim.simxGetObjectOrientation(clientID, 16, -1, sim.simx_opmode_streaming);
    
    %posicion_inicial = [0, 0 , 0, 0];
    [r, posicion_inicial]=sim.simxGetObjectPosition(clientID, 16, -1, sim.simx_opmode_streaming);

    % Posición deseada
    posicion_final = [2.0 2.0]; % [m]
    
    p1 = [0.5, 0.0];
    p2 = [0.5, 0.5];
    p3 = [1.0, 0.5];
    p4 = [1.0, 1.0];
    p5 = [1.5, 1.0];
    p6 = [2.0, 2.0];
    positions = {p1, p2, p3, p4, p5, p6};
    
    
    
    xf = posicion_final(1);
    yf = posicion_final(2);
    j = 0;
    k = 1;
    for y = 1:1:length(positions)
        
        xf = positions{y}(1);
    	yf = positions{y}(2);
        
         while true
        [r, posicion_inicial] = sim.simxGetObjectPosition(clientID, 16, -1, sim.simx_opmode_buffer);
        [r, rotacion] = sim.simxGetObjectOrientation(clientID, 16, -1, sim.simx_opmode_buffer);
        if j>20
            xi = posicion_inicial(1);
            yi = posicion_inicial(2);
            t_i = rotacion(2); % radians
            t_i = t_i+(pi/2);

            [Vxp, Vyp, w, t_e] = desplazamiento(xi, yi, t_i, xf, yf);
            if t_e>pi/2
                t_e = pi/2;
            elseif t_e<0
                t_e = 0;
            end
            
            
            
            if y~=6
                w = 0; % Velocidad angular
            end
            disp([xi, yi, xf, yf, t_i, t_e, Vxp, Vyp, w, y])
            
            [w1, w2, w3, w4] = fcn(Vxp, Vyp, w);
    %         plot(j, w1,'bo', 'MarkerSize', 1, 'color', 'k');
            sim.simxSetJointTargetVelocity(clientID, h(1), w1, sim.simx_opmode_streaming);
            sim.simxSetJointTargetVelocity(clientID, h(2), w2, sim.simx_opmode_streaming);
            sim.simxSetJointTargetVelocity(clientID, h(3), w3, sim.simx_opmode_streaming);
            sim.simxSetJointTargetVelocity(clientID, h(4), w4, sim.simx_opmode_streaming);
    %         break
    
            if abs(xi-xf)<0.005 && abs(yi-yf)<0.005
                sim.simxSetJointTargetVelocity(clientID, h(1), 0, sim.simx_opmode_streaming);
                sim.simxSetJointTargetVelocity(clientID, h(2), 0, sim.simx_opmode_streaming);
                sim.simxSetJointTargetVelocity(clientID, h(3), 0, sim.simx_opmode_streaming);
                sim.simxSetJointTargetVelocity(clientID, h(4), 0, sim.simx_opmode_streaming);
                break
            end
        end
        
        j = j+1;
        
         end
    
    end
   
    %% end main code
else
    disp('Failed connecting to remote API server');
end

sim.delete(); % call the destructor!
    
disp('Program ended');
%%