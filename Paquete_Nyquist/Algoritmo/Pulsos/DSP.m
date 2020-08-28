function[v]=DSP(t,alpha)
%Pulso DSP

phi=0.1;
n=2;
T=1;

DSP_1=sinc(t/T); %NEW FAMILY OF NYQUIST-I PULSES
DSP_2=(sinc(alpha*phi*t/T))^2;
v=(DSP_1*DSP_2)^n; %DSP
end