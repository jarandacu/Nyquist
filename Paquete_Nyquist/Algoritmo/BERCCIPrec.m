function [BER]=BERCCIPrec(str,alpha,snr,sir,L)
%Alpha: Factor de roll-off
%BER: Valores del Bit-Error rate para cada offset
%Cada columna corresponde a los offsets t/T [0.05, 0.1, 0.2, 0.25]
%(modificable)
%% Parametros de Simulaci�n 
T=1;                        %Per�odo 
P=10;                       %2*P+1 number of symbols from each CCI signal affecting a symbol decision.
Tauinf=0;                   
Tausup=T;
Alphainf=0;
Alphasup=2*pi;
Nm    = 51;
M     = Nm*2-1;                
omega = 2*pi/60;           
%snr = SNR;                           %SNR in [dB]
%sir = 20;                           %SIR in [dB]
%L=2;                                %Number of interferers
R=ones(1,L);           
coeff = 10^(snr/20);                %SNR in linear
coeff2= coeff/(L*(10^(sir/20)));      %SIR in linear
offset = [0];
%alpha=0.5;                          %Factor de Roll-Off 

fh=str2func(str);
%% Computo BER

cd('Pulsos') 
sumaT2=zeros(1,length(offset));
for c=1:length(offset)
    g0 = coeff * fh(offset(c) * T,alpha);
    suma=0;
    for m=1:2:M
        s1=An(str,m,P,omega,coeff2);
        A=integral2(s1,Tauinf,Tausup,Alphainf,Alphasup)/(2*pi*T);
        suma= double(suma + ((exp(-(m * omega)^2 / 2) * sin(m * omega * g0))/m) * A);
    end
    sumaT2(c) = (1./2. - (2./pi) * suma);
end

BER=abs(sumaT2);
BER=vpa(BER,6); %Cambiamos precisi�n de Matlab
format shortE
cd('../') %Volvemos al directorio del c�lculo de Ber
%Cada columna corresponde a los offset [0.05, 0.1, 0.2, 0.25] y cada fila
%corresponde a los distintos pulsos en el orden
%RC,PE,PL1,PL2,DJ,IPLCP,IMBH,SPEP,SPLPC,SPLP,PSM









% %% Para un pulso individual


% 
% %% ParametricLinear1





end