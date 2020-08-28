function [v] = PFE(t,b,alpha)
x=alpha*pi*t;
C=log(2^3)+log(b)*log(4*b);
if t==0
    v=1;
else
v=(sin(pi*t)*(2*cos(x)*(C+(1-b)*x^2+2*b*x*log(2*b)*sin(x))-C))/(pi*t*(x^2+C));
end
end
