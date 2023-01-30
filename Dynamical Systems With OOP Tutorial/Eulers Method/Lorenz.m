classdef Lorenz < handle

    properties
        Sigma
        Rho
        Beta

        SimTime         % Simulation Time
        dt              % Time Step

        X               % State Vector
    end


    methods
        % Constructor
        function obj = Lorenz(Sigma, Rho, Beta, dt, InitialCond, SimTime)
            obj.Sigma = Sigma;
            obj.Rho = Rho;
            obj.Beta = Beta;

            obj.dt = dt;
            obj.SimTime = SimTime;
            obj.X = InitialCond(:);
        end


        % ODE Solve Function
        function Motion = Simulate(obj)

            tSpan = 0:obj.dt:obj.SimTime;

            Out = zeros(3, length(tSpan));

            Out(:, 1) = obj.X;
            dX = zeros(3, 1);

            for i = 1:size(Out, 2) - 1

                dX(1) = (obj.Sigma * (obj.X(2) - obj.X(1)));
                dX(2) = (obj.X(1) * (obj.Rho - obj.X(3)) - obj.X(2));
                dX(3) = (obj.X(1) * obj.X(2) - obj.Beta * obj.X(3));

                obj.X = obj.X + dX * obj.dt;

                Out(:, i+1) = obj.X;
            end

            Motion.Out = Out';
            Motion.Time = tSpan;
        end
    end
end
