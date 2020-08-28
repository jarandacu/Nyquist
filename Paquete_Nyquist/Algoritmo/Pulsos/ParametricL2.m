function [v]=ParametricL2(t,alpha)
%Pulso ParametricLinear de orden 2
T=1;
v=sinc(t/T) * sinc(alpha * t / (2 * T))^2;
end