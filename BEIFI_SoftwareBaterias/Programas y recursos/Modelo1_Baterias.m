%%%%    El prsente programa se encarga de Un modelo para la carga y
%%%%    descarga de una bateria. 

A = 50e-3;          %%% Se ocupara para el programa
c10 = 25;           %%% Se ocupara para el programa
t = 0:0.1:500-0.1;  %%% Se ocupara para el programa 
S = 1-(A/c10)*t;
%plot(t,S)

%Obtenemos la resistencia interna de la bateria 

R0 = 1;            %%%  Se ocupara para el programa 
Rint = R0./S; 

%Obtenemos la corriente de la bateria... 
Voc = 5.5;         %%% Se ocupara para el programa...
It =  Voc./Rint; 


%Obtenemos el voltaje de la baetria 
Vt =   It.*Rint ;  

%Graficamos todo.. 
figure (1); 
plot(t, It); 

figure (2); 
plot(t,Rint);

figure (3);
plot(t,Vt);




