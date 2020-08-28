function [v]=NP(t,alpha,l)
s=sinc(t).*sinc(alpha*t);
p=(exp(l*(-t.^2.*pi^2)));
v=s.*p;
end