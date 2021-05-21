function [w1, w2, w3, w4] = cinematico(Vx,Vy,W)
%datos del robot
r = 0.05;
b = 0.15;
d = 0.2355;
w1 = (Vx/r) + (Vy/r) - (((b+d)/r)*W);
w2 = -(Vx/r) + (Vy/r) + (((b+d)/r)*W);
w3 = -(Vx/r) + (Vy/r) - (((b+d)/r)*W);
w4 = (Vx/r) + (Vy/r) + (((b+d)/r)*W);