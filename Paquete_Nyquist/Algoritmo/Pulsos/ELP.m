function[v]=ELP(t,alpha)
%Pulso ELP

%Parameter "b" is used to control the phase and "p" representes the power
%of PLP.
beta=1;
T=1;
PLP=sinc(t/T)*sinc(alpha*t/T);
v=exp(-pi *((beta/2)*(t/T)^2)) * PLP; %ELP
end