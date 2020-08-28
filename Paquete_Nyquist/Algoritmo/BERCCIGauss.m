function [BER]=BERCCIGauss(str,alpha,snr,sir,L)
T=1;
%snr = 15;                           %SNR in [dB]
%sir = 8;                           %SIR in [dB]
coeff = 10^(snr/20);                %SNR in linear
coeff2= coeff/(sqrt(L)*(10^(sir/20)));      %SIR in linear
fh=str2func(str);
R=1;
offset=0;
%% Computo BER
cd('Pulsos')
Rs=coeff*fh(T*offset,alpha);
Sigma=sqrt(1+L*R*coeff2.^2*(1-0.25*alpha));
BER=qfunc(Rs/Sigma);
BER=vpa(BER,6); %Cambiamos precisi�n de Matlab
format shortEng
cd('../') 
end
