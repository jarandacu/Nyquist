function [v] = IMBH(t,alpha)
%Pulso IMBH
T=1; % Periodo 
n=1; % orden del IMBH
%alpha=0.22; %Roll-Off Factor
beta=1.2; % 0.5 =< beta =< 1.88 

%En caso de indefinición, sumamos un epsilon
if t==-1/(2*alpha) || t==-1/(2*alpha) 
   t=t+10e-5; 
end

v=(sinc(t/T)^n)* (((2*(1-beta)*cos(alpha * pi * t/T))/(1-4*(t/T * alpha)^2)) - (((1-2*beta)*sin(alpha * pi * t/T))/(alpha * pi * t/T)));

end

