function [v]= SPLCP(t,alpha)
%Pulso SPLCP 
%Párametros mu=2.5, b=1.5 y gamma =3 son los óptimos segun el paper "Family
%of Nyquist I Pulses to Enhance OFDM System Performance" 

%Gamma, Beta y Mu están definidos para todos los numeros reales

%alpha=0.22; %Roll Off Factor 0<alpha<1
mu=2.5; % mu is used to minimize the relative magnitude of the 2 largest side lobes.
b=1.5; %b is used to control the phase of the modified sinc 
gamma=3; %Provides additional degree of freedom by increasing the power
T=1; % Periodo
%Límites de l'hopital (en caso de)
if abs(t)<10e-3
    t1=1-mu;
    t2=mu;
    PLCP=1;
    v=1;
else
    t1= (4*(1-mu)*sin(pi * alpha * t/T * 0.5)^2)/(pi*alpha*t/T)^2;
    t2= (pi * alpha * mu * t/T * sin(pi*alpha*t/T))/((pi*alpha*t/T)^2);

    %PLCP=sinc(pi*(t/T))*(t1+t2);
    PLCP=sinc(t/T)*(t1+t2);
    v= ((sin(b*t/T)/(b*t/T))^gamma)*PLCP;
end
end