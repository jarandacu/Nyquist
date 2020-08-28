function [v]=ParametricL1(t,alpha)
%Pulso ParametricLinear de orden 1
T=1;
v=sinc(t/T) * sinc(alpha * t / (2 * T));
end