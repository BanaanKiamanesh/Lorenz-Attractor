classdef Lorenz < handle

    properties
        Sigma
        Rho
        Beta

        SimTime         % Simulation Time
        InitialCond     % Initial Conditions
    end


    methods
        % Constructor
        function obj = Lorenz(Sigma, Rho, Beta, InitialCond, SimTime)
            obj.Sigma = Sigma;
            obj.Rho = Rho;
            obj.Beta = Beta;

            obj.SimTime = SimTime;
            obj.InitialCond = InitialCond(:);
        end

        % ODE Function
        function StateDiff = Integrator(obj, ~, State)
            X = State(1);
            Y = State(2);
            Z = State(3);

            dX = (obj.Sigma * (Y-X));
            dY = (X * (obj.Rho-Z) - Y);
            dZ = (X*Y - obj.Beta*Z);

            StateDiff = [dX, dY, dZ]';
        end


        % ODE Solve Function
        function Motion = Simulate(obj)

            tSpan = [0 obj.SimTime];
            Y0 = obj.InitialCond;

            ODEFun = @(t, y) obj.Integrator(t, y);

            [tSpan, Out] = ode45(ODEFun, tSpan, Y0);

            Motion.Out = Out;
            Motion.Time = tSpan;
        end
    end
end
