clear
close all
clc

%% Parameter Init

% Starting Point
X = 1; Y = 1; Z = 1;

% Model Parameters
Sigma = 10;
Rho = 28;
Beta = 8/3;

% Curve Animator Obj
Curve = animatedline('Color', [0, 1, 1], 'LineStyle', '-', 'Marker'...
    , 'none', 'MarkerSize', 2);

% Plot Properties
set(gcf, 'Color', 'k'); axis equal; axis off

% Time Frame
dt = 0.001;

while 1

    dx = (Sigma * (Y-X)) * dt;
    dy = (X * (Rho-Z) - Y) * dt;
    dz = (X*Y - Beta*Z) * dt;
    X = X + dx;
    Y = Y + dy;
    Z = Z + dz;

    Curve.addpoints(X, Y, Z);
    drawnow limitrate
end