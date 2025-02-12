% Small script to plot the different types of (damped) harmonic motion for
% some given input conditions (feel free to change them).

% Dr. Roberto Merino-Martinez (Delft University of Technology, 2025.
% r.merinomartinez@tudelft.nl

clear;close all; clc

T = 4; % Simulation time, [s]
dt = 0.01; % Time step, [s]
A = 0.5; % Amplitude of oscillations, [m]
m = 5; % Mass of the oscillator, [kg]
k = 100; % Spring stiffness constant, [N/m]
phi = 0; % Initial phase, [rad]

t = 0:dt:T; % Time vector, [s]

% Undamped case
b_undamped = 0; % No damping case, [kg/s]
omegap_undamped = sqrt(k/m-b_undamped^2/(4*m^2)); % Undamped oscillation frequency, [rad/s]
x_undamped = A*cos(omegap_undamped*t+phi); % Undamped displacement over time, [m]

% Underdamped case
b_under = sqrt(4*m*k)/3; % Damping constant, [kg/s] CHOOSE SMALLER THAN b_critical
gamma_under = b_under/(2*m); % Gamma coefficient 
omegap_under = sqrt(k/m-b_under^2/(4*m^2)); % Underdamped oscillation frequency, [rad/s]
x_under = A.*exp(-gamma_under.*t).*cos(omegap_under*t+phi); % Underdamped displacement over time, [rad/s]

% Critically damped case
b_critical = sqrt(4*m*k); % Damping constant, [kg/s]
gamma_critical = b_critical/(2*m); % Gamma coefficient 
omegap_critical = sqrt(k/m-b_critical^2/(4*m^2)); % Critically damped oscillation frequency, [rad/s]
x_critical = A.*exp(-gamma_critical.*t).*cos(omegap_critical*t+phi); % Critically damped displacement over time, [rad/s]

% Overdamped case
b_over = sqrt(4*m*k)*3; % Damping constant, [kg/s] CHOOSE LARGER THAN b_critical
gamma_over = b_over/(2*m); % Gamma coefficient 
omegap_over = sqrt(k/m-b_over^2/(4*m^2)); % Overdamped oscillation frequency, [rad/s]
x_over = A.*exp(-gamma_over.*t).*cos(omegap_over*t+phi); % Overdamped displacement over time, [rad/s]

%% Plot results

fig=figure();
plot(t,x_undamped,'g--','LineWidth',1.5)
hold on
plot(t,x_under,'k-','LineWidth',1.5)
plot(t,x_critical,'r-','LineWidth',1.5)
plot(t,x_over,'b-','LineWidth',1.5)
plot([t(1) t(end)], [0 0],'k-','LineWidth',1.5)
axis ([0 T -2*A 2*A])
legend ('Undamped', 'Underdamped','Critically damped','Overdamped','Location','NorthEast','NumColumns',2)
xlabel ('Time, [s]'); ylabel('Displacement x, [m]')
grid on
set(gca,'FontName','Times New Roman','FontSize',16)


