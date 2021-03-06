function [BER]=BERISICCISin(str,alpha,snr,sir,L)
%Alpha: Factor de roll-off
%BER: Valores del Bit-Error rate para cada offset
%Cada columna corresponde a los offsets t/T [0.05, 0.1, 0.2, 0.25]
%(modificable)
%% Parametros de Simulaci�n 
T=1;                        %Per�odo 
nbits = 2^10;                % number of bits to interfere
N     = floor(nbits/2);     
Nm    = 50;
M     = Nm*2-1;                
omega = 2*pi/60;
%snr = 15;                           %SNR in [dB]
%sir = 20;                           %SIR in [dB]
%L=2;                                %Number of interferers
R=ones(1,L);           
coeff = 10^(snr/20);                %SNR in linear
coeff2= coeff/(sqrt(L)*10^(sir/20));      %SIR in linear
offset = [0.05 0.1 0.2] ;   %Conjunto de offsets t/T
%alpha=0.5;                          %Factor de Roll-Off 
a=linspace(-N,-1,N);
b=linspace(1,N,N);
ab=[a b];

fh=str2func(str);
%% Computo BER

cd('Pulsos') 
sumaT2=zeros(1,length(offset));
for c=1:length(offset)
    g0 = coeff * fh(offset(c) * T,alpha);
    gk=zeros(length(ab),1);
    for i=1:length(ab)
        gk(i) = coeff * datasample([1 -1],1) * fh((offset(c) - ab(i)) * T,alpha);
    end
    sum(gk);
    suma=0;
    mult=1;
    pit1=1;
    pit2=1;
    for m=1:2:M
        for k=1:length(gk)
            pit1=double(pit1 * cos(m*omega*gk(k)));
            gk(k);
        end
        pit1;
        for l=1:L
            pit2=double(pit2*besselj(0,m*omega*R(l)*coeff2));
        end
        mult=pit2*pit1;
        suma= double(suma + ((exp(-(m * omega)^2 / 2) * sin(m * omega * g0))/m) * mult);
        pit1=1;
        pit2=1;
    end
    sumaT2(c) = (1./2. - (2./pi) * suma);
end

BER=sumaT2;
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