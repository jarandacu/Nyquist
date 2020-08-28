function [r]=R(t,alpha)
%Pulso R definido en la ecuacion (3) en:
%"Construction of new ISI-free pulses using a linear combination of two
%polynomial pulses" - Alexandra Ligia Balan 2014


%% Parametros
T=1;
B=1/(2*T);

%atrapamos excepcion de valor muy pequeño
if abs(t)<=(1e-4)
    t=1e-3;
end

%% polynomial pulses para r(t)
%Elegir los valores de a2,a3 y a4 según el valor de alpha (ver paper)

if alpha==0.2
    a2=40; a3=-100; a4=85;
elseif alpha==0.35
    a2=31; a3=-80; a4=69;
elseif alpha==0.5
    a2=25; a3=-64; a4=55;
else a2=31; a3=-80; a4=69; %usaremos éste por defecto alpha=0.35
end

%Parametros b3 y b4 definidos optimos en el paper
b3=32; b4=-30;  

s2=sinc(2*B*t)*((1 + a2/2 + a3/4 + a4/8)*sinc(2*alpha*B*t) - a2/2*(sinc(alpha*B*t)^2) + (3*a3/2)*((sinc(2*alpha*B*t)-1)/((2*pi*alpha*B*t)^2)) +  (3*a4/8)*(((sinc(alpha*B*t)^2)-1)/((pi*alpha*B*t)^2)) );
s3=sinc(2*B*t)*( (1 + b3/4 + b4/8)*(sinc(alpha*B*t)^2) + (3*b3/2)*((sinc(2*alpha*B*t)-1)/((2*pi*alpha*B*t)^2)) + (3*b4/8)*(((sinc(alpha*B*t)^2)-1)/((pi*alpha*B*t)^2)) );

%factor de ponderacion lineal 
a=1.2; %Valor definido en el paper
r=a*s2+(1-a)*s3; %Pulso final r



end