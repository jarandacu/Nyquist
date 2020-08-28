function [v]=V(t,alpha)
%Pulso V definido en la ecuacion (10) en:
%"Construction of new ISI-free pulses using a linear combination of two
%polynomial pulses" - Alexandra Ligia Balan 2014

%nota: el pulso px2 tiene errores de tipeo en el paper, seguir la ecuación
%puesta acá. (la ecuación correcta fue consultada con los autores del paper)


%% Parametros
T=1;
B=1/(2*T);

%atrapamos excepcion de valor muy pequeño
if abs(t)<=(1e-4)
    t=1e-3;
end

%% Pulsos polinomiales para v(t)
if alpha==0.25
    a1=0.17; b=0.65;
elseif alpha==0.35
    a1=0.19; b=0.73;
else a1=0.34; b=0.72; %parametros por defecto del paper original 
end

px2=((2*sin(pi*t))/(((pi*t)^3)*(a1^2)))*( (-1*(b-1)*((pi*t*a1)^2)*cos(pi*t*alpha)) + ((2*b)-1)*(-1 + cos(pi*t*a1) + pi*t*a1*sin(pi*t*a1)));
px3=(sin(pi*t)/(((pi*t)^4)*(a1^3))) * ( -2*(b-1)*((pi*t*a1)^3)*cos(pi*t*alpha) + 3*(2*b-1)*(2*pi*t*a1*cos(pi*t*a1) + (((pi*t*a1)^2)-2)*sin(pi*t*a1))); 
%ponderación lineal
a=1.14; 
v=a*px2+(1-a)*px3; 


end