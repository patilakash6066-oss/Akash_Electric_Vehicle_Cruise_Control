clc;
clear;
close all;

%% ELECTRIC VEHICLE CRUISE CONTROL
% Vehicle Transfer Function:
% G(s) = 1 / (5s + 1)

s = tf('s');

%% Plant Model
G = 1/(5*s + 1);

disp('Vehicle Transfer Function:')
G

%% PI Controller Design
% Tuned values to satisfy:
% Steady-state error < 2%
% Overshoot < 5%

Kp = 2.5;
Ki = 0.8;

C = Kp + Ki/s;

disp('PI Controller:')
C

%% Closed Loop System
T = feedback(C*G,1);

%% Step Response
figure;
step(T,30);
grid on;

title('EV Cruise Control - Step Response');
xlabel('Time (seconds)');
ylabel('Vehicle Speed');

%% Performance Metrics
info = stepinfo(T);

disp('Performance Metrics:')
disp(info)

%% Check Steady State Error
ess = abs(1 - dcgain(T));

fprintf('\nSteady State Error = %.4f\n', ess);

%% Disturbance Introduction at t = 10 sec
% Simulating road slope disturbance

t = 0:0.01:30;

% Unit step input (desired speed)
u = ones(size(t));

% Disturbance signal
d = zeros(size(t));
d(t >= 10) = -0.2;   % disturbance after 10 sec

% Closed-loop response
[y1,t1] = lsim(T,u,t);

% Disturbance response
[y2,t2] = lsim(G,d,t);

% Total output
y = y1 + y2;

%% Plot Response with Disturbance
figure;
plot(t,y,'b','LineWidth',2);
hold on;
xline(10,'r--','Disturbance at t = 10s');

grid on;

title('EV Cruise Control with Road Disturbance');
xlabel('Time (seconds)');
ylabel('Vehicle Speed');

legend('Vehicle Speed','Disturbance Applied');

%% Root Locus (Optional Analysis)
figure;
rlocus(C*G);
grid on;
title('Root Locus of EV Cruise Control System');

%% Bode Plot (Optional)
figure;
bode(T);
grid on;
title('Bode Plot of Closed Loop System');
