function [v] = ParametricE(t,alpha)
beta=alpha*pi/log(2);
T=1;
v = sinc(t/T) * (2 * beta * t / T * sin(pi * alpha * t / T) + 2 * cos(pi * alpha * t / T) - 1)/((beta * t / T)^2 + 1);
end