function [v]=LCP(t,alpha)
%LCP: Linear Combination Pulse de "ISI-Free Linera Combination Pulses with
%Better Performance" - Cesar Azurdia meza
T=1;
beta=1.7; %Constante Optima según el paper
v=sinc(t/T) * ( beta*sinc(alpha*t/T) + (1-beta)*cos(pi*alpha*t/T)/(1-4*(alpha*t/T)^2));

% C=1.75;
% 
% Exp11_Num=((1-C)*cos(pi*alpha*t)).*sin(pi*t);
% Exp11_Den=(pi*t).*(1-(2*alpha*t).^2);
% Exp11DenZero=find(abs(Exp11_Den) < 10^-10);
% Exp11_Total=Exp11_Num./Exp11_Den;
% Exp11_Total(Exp11DenZero)=0.5;
% 
% Exp22_Num=(C)*sin(pi*t).*sin(pi*alpha*t);
% Exp22_Den=pi^2*alpha*t.^2;
% Exp22DenZero=find(abs(Exp22_Den) < 10^-10);
% Exp22_Total=Exp22_Num./Exp22_Den;
% Exp22_Total(Exp22DenZero)=0.5;
% 
% v=(Exp11_Total+Exp22_Total);

end

