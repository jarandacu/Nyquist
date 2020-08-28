function [v]=DoubleJ(t,alpha)
%Pulso Double Jump
T=1;
v=sinc(t/T) * ((1 - alpha) * cos(pi * alpha * t / T) + alpha * sinc(alpha * t / T));
end