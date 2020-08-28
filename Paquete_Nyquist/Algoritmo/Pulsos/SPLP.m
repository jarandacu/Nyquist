function[v]=SPLP(t,alpha)
%Pulso SPLP 
%Usar b<=0.5 y p=1 es lo recomendado por el paper "Nyquist I Pulses
%designed to supress the ICI power in OFDM systems".

%Parameter "b" is used to control the phase and "p" representes the power
%of PLP.
 beta=0.5;
 p=1;
 T=1;
PLP=sinc(t/T)*sinc(alpha*t/T);
v=sinc(beta*t/T)^2 * PLP^p; %SPLP
end