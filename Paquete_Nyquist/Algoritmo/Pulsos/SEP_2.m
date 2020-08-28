function[v]=SEP_2(t,alpha)
%Pulso ELP

%Parameter "b" is used to control the phase and "p" representes the power
%of PLP.
beta=1;
phi=1.8;
T=1;

SRC_1=sinc(beta*t/T);
SRC_2=((1-(2*cos(alpha*pi*t/T)))/((3*alpha*t/T)^2-1));
%SRC_2=(sinc(beta*t/T))/((1-(2*cos(alpha*pi*t/T)))/((3*alpha*t/T)^2-1));
SRC=SRC_1*SRC_2;
v=exp(-phi*(t/T)^2) * SRC; %SEP
end