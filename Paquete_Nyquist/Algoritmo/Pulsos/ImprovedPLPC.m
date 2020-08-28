function [iplpc]=ImprovedPLPC(t,alpha)
% Valores angelo mu=1.6, gamma=1.0, epsilon=0.1
T=1;
mu=1.6;
gamma=1.0;
epsilon=0.1;
plp1  = sinc(t/T) * sinc(alpha * t / T); %PL1
plp2  = sinc(t/T) * sinc(alpha * t / (2 * T))^2; %PL2
plpc  = mu * plp1 + (1. - mu) * plp2;
iplpc = exp(-epsilon * (pi * t / T)^2) * plpc^gamma;
end