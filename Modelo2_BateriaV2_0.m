% % %   Modelo de carga y descarga de baterias v2.0 
% % Vo = 3.3           %   Voltaje en circuito abierto 
% % Ro =  1.1     %   Resistencia inicial para determinar la resistencia interna de la bateria
% % SOC = 80        %   Stado de carga de la bateria 
% % A = 1;      %   Constantes
% % B = A;      %   Constantes 
% % 
% % %   Determinar Rint y Voc 
% % Rint = Ro - (B*D);    %  Determinar la resistencia interna de la bateria 
% % 
% % %   Determinamos Voc o el voltaje en circuito abierto      
% % Voc = Vo - (A*D);   %   Determinamos el voltaje en circuito abierto 
% % 
% % %   Determinar el voltaje de salida de la malla... 
% % V_out = 
% 


% Define functions
voc_soc = @(soc) 3.7 + 0.1 * soc;
rint_soc = @(soc) 0.05 + 0.02 * soc;

% % % % % Set initial conditions
% % % % soc_0 = 80;   % Initial state of charge in percentage
% % % % current = 2;  % Current in Amperes
% % % % 
% % % % % Calculate Terminal Voltage at initial state of charge
% % % % vt_initial = voc_soc(soc_0) - current * rint_soc(soc_0);
% % % % disp(['Terminal Voltage at SOC = ', num2str(soc_0), '%:', num2str(vt_initial)]);
% % % % % Simulate for different states of charge
% % % % soc_values = soc_0:-20:0;  % Simulate for decreasing SOC
% % % % i = 1; 
% % % % for soc = soc_values
% % % %     vt = voc_soc(soc) - current * rint_soc(soc);
% % % %     disp(['SOC:', num2str(soc), '%, Terminal Voltage:', num2str(vt)]);
% % % %     volt_t(i) = vt;
% % % %     i = i+1; 
% % % % end
% % % % 
% % % % plot(volt_t); 


% Define functions
Voc = @(SOC) 5.5 + 0.1 * SOC;  % Example function for open-circuit voltage
Rint = @(SOC) 0.05 + 0.02 * SOC;  % Example function for internal resistance

% Set values
SOC = 50;  % Example State of Charge in percentage
I = 2;    % Example current (negative for charging)
t = 0:0.5:10;  % Example time vector

% Aging term that decreases the open-circuit voltage over time
DeltaV_aging = 0.01 * t;

% Calculate terminal voltage at each time point
Vt = Voc(SOC) - I * Rint(SOC) - DeltaV_aging;
Rint_plotable =  Rint(SOC)-DeltaV_aging;
% Display results
disp(['Time (s) | Terminal Voltage (V)']);
disp([t' Vt']);

% Plot the results
figure;
plot(t, Vt, 'o-');
xlabel('Time (s)');
ylabel('Terminal Voltage (V)');
title('Battery Terminal Voltage with Time');


