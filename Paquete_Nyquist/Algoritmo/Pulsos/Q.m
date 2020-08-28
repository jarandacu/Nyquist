function [q]=Q(t,alpha)
%Pulso Q definido en la ecuacion (6) en:
%"Construction of new ISI-free pulses using a linear combination of two
%polynomial pulses" - Alexandra Ligia Balan 2014

%nota: el pulso p tiene varios errores de tipeo en el paper, seguir la ecuación
%puesta acá (la ecuación correcta fue consultada con los autores del paper)

%% Parametros
T=1;
B=1/(2*T);

%atrapamos excepcion de valor muy pequeño
if abs(t)<=(1e-4)
    t=1e-3;
end

%%  Pulso CC3 para q(t)
%Parametros optimos del paper (para alpha=0.35)
m=0.34;
b=0.7;
b3=32;
b4=-30; 
s3=sinc(2*B*t)*( (1 + b3/4 + b4/8)*(sinc(alpha*B*t)^2) + (3*b3/2)*((sinc(2*alpha*B*t)-1)/((2*pi*alpha*B*t)^2)) + (3*b4/8)*(((sinc(alpha*B*t)^2)-1)/((pi*alpha*B*t)^2)) );
%pulso CC3
p=(1/(((m*(m-alpha))^2)*((pi*t)^3))) * 2*sin(pi*t)*( (2*b-1)*((m-alpha)^2) + (-(m^2) + 2*(2*b-1)*m*alpha + (1-2*b)*(alpha^2))*cos(m*pi*t) + 2*(b-1)*(m^2)*(-cos(pi*t*alpha) + pi*t*(m-alpha)*sin(pi*t*alpha))); 
%Pulso final ponderado
a=1.08;
q=a*p+(1-a)*s3;

end