V_oc = 5.5;    % Open-circuit voltage
SOC = 80;      % Initial State of Charge (percentage)
R_int = 0.1;   % Internal resistance
K = 0.01;      % Constant

% Time vector
t = 0:0.1:3600*3;  % Time vector from 0 to 10 seconds with a step of 0.1 seconds

% Charging current (positive)
I_charge = 2;

% Discharging current (negative)
I_discharge = -2;

% Initialize terminal voltage vectors
V_t_charge = zeros(size(t));
V_t_discharge = zeros(size(t));
% Simulacion de la carga 
for i = 1:length(t)
    % Update SOC based on charging current
    SOC = SOC + (I_charge / 3600);  % Assuming 1-hour time steps (3600 seconds)
    
    % Calculate terminal voltage
    V_t_charge(i) = V_oc - (R_int + K/SOC) * I_charge;
end

% Simulacion de la descarga 
    % Reinicio de SOC para la descarga 
    SOC = 80; 
for i = 1:length(t)
    % Update SOC based on discharging current
    SOC = SOC + (I_discharge / 3600);
    
    % Calculate terminal voltage
    V_t_discharge(i) = V_oc + (R_int + K/SOC) * I_discharge;
end

% Graficamos 
figure;
subplot(2, 1, 1);
plot(t, V_t_charge);
title('Charging: Terminal Voltage vs Time');
xlabel('Time (s)');
ylabel('Terminal Voltage (V)');

subplot(2, 1, 2);
plot(t, V_t_discharge);
title('Discharging: Terminal Voltage vs Time');
xlabel('Time (s)');
ylabel('Terminal Voltage (V)');