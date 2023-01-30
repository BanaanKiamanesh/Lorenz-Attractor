clear
close all
clc

%% Parameter Declaration

% Initial Condition
X = 1;
Y = 1;
Z = 1;
InitialCond = [X, Y, Z]';

% Model Parameters
Sigma = 10;
Rho = 28;
Beta = 8/3;

% Time Specs
dt = 0.01;
SimulationTime = 50;

%% Create Attractor Object And Simulate for Results

Attractor = Lorenz(Sigma, Rho, Beta, dt, InitialCond, SimulationTime);
Motion = Attractor.Simulate();

%% Plot Results
plot3(Motion.Out(:, 1), Motion.Out(:, 2), Motion.Out(:, 3), ...
    'Color', [0, 1, 1], "LineWidth", 3)

% set(gcf, 'Color', 'k');
axis equal
axis off

title("Lorenz Attractor")
