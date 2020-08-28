function[v]=SPEP(t,alpha)
%usar b<=0.5 y gamma=1 es lo recomendado por el paper "Nyquist I Pulses
%designed to supress the ICI power in OFDM systems".

beta=0.5; %b is used to control the phase of the sinc function
gamma=1; %gamma presents an increase in the power of PEP
T=1; %Periodo 

PEP=sinc(t/T)*(2*beta*t/T*sin(pi*alpha*t/T)+2*cos(pi*alpha*t/T)-1)/((beta*t/T)^2 + 1);
v=((sinc(beta*t/T))^2)*PEP^gamma; %SPEP


end