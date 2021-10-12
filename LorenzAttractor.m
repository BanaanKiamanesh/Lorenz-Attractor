clear
close all
clc

%% Parameter Init

X = 1;
Y = 1;
Z = 1;

Sigma = 10;
Rho = 28;
Beta = 8/3;

Curve = animatedline('Color', [0, 1, 1], 'LineStyle', '-', 'Marker'...
    , 'none', 'MarkerSize', 2);

set(gcf, 'Color', 'k')
axis equal
axis off

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