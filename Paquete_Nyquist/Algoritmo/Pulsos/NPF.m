function [v]=NPF(t,alpha)
b=1;
s=sinc(t).*sinc(alpha*t);
p=0;
for i=1:1:5
p=(exp(i/10*(-t.^2.*pi^2)))+p;
end
p=p*0.2;
v=s.*p;
end