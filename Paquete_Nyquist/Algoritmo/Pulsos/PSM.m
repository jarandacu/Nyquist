function[v]=PSM(t,alpha)
%PULSO Sinc with modified phase 

%Los parámetros por defecto a=1, n=2, b=0.5, c=2 son los que muestran
%mejores resultados según el paper "ICI Reduction in OFDM Systems Using
%Phase Modified Sinc Pulse" 2009

%No hay factor alpha de roll-off, solo se puso para uniformar las demas
%funciones.
a=1; % Design parameter to adjust the amplitude
n=2; %Degree of the sinc function
%b and c are used to control the phase of the sinc function
b=0.5;
c=2;
T=1; % Período
if abs(t)<10e-5 
    v=1; %Limite L'hopital
else
    v=exp(-a*(t/T)^2) * ( (sin((pi * t/T) - b*sin(c*pi*t/T)))/((pi * t/T) - b*sin(c*pi*t/T)) )^n;
    %v=exp(-a*(t/T)^2) * ((sinc((pi * t/T) - b*sin(c*pi*t/T))))^n;
end
end