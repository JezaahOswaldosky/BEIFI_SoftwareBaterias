%   Valores 
V_oc1 = 0      % Voltaje en circuito abierto
V_oc2 = 4.2
SOC = 80;       % Estado inicial de carga (Porcentaje)
R_int = 0.1;    % Resistencia itnerna 

% Vector tiempo 
t = 0:0.1:3600*8;       % Vector tiempo en segundos con pasos de 0.1 

% Corriente de carga (positivo)
I_charge = 6; 

% Corriente de carga (negativo) 
I_discharge = -6; 

% Vector Voltaje iniciaizado 
V_t_charge = zeros(size(t));
V_t_discharge = zeros(size(t));

% Simulacion de la carga 
for i=1:length(t)
    SOC = SOC + (I_charge/(3600));    %   Asumiento que es de una hora 
    V_t_charge(i) = V_oc1 + I_charge*R_int*SOC/100;
end

    SOC = 80; 
%Simulacion de la descarga 
for i = 1:length(t)
    SOC = SOC+(I_discharge/(3600)); 
    V_t_discharge(i) = V_oc2 - I_discharge*R_int*SOC/100;
end


% Graficamos 
figure; 
subplot(2,1,1);
plot(t,V_t_charge); 
title('Charging: Terminal Voltaje vs Time'); 
xlabel('Time(s)');
ylabel('Terminal Voltage(V)');


subplot(2,1,2); 
plot(t,V_t_discharge); 
title('Discharging: Terminal Voltaje vs Time'); 
xlabel('Time(s)');
ylabel('Terminal Voltage(V)');
