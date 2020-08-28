function [v]=NPF2(t,alpha)
s=sinc(t).*sinc(alpha*t);
p=(exp(0.22*(-t.^2.*pi^2)));
v=s.*p;
end
