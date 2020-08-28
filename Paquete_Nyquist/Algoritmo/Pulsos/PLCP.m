function [v]=PLCP(t,alpha)
%PLCP: Parametric Linear Combination Pulse de "PAPR Reduction in SC-FDMA by
%Pulse Shaping Using Parametric Linear Combination Pulses" - Cesar Azurdia
%meza 2012

% if abs(t)<10e-4
%     t=t+10-3;
% end

T=1;
mu=1.6; %Constante Optima según el paper
if t==0;
    v=1;
else
    v=sinc(t/T) * ( (4*(1-mu)*sin(pi*alpha*t/T*0.5)^2 + mu*alpha*pi*t/T*sin(pi*alpha*t/T))/((pi*alpha*t/T)^2) ); %PLCP
end

% constante=1.60;
% 
% Exp1_Num=(4*(1-constante)*(sin(pi*t).*(sin(0.5*alpha*pi*t).^2)));
% Exp1_Den=alpha^2*pi^3*t.^3;
% 
% Exp1DenZero=find(abs(Exp1_Den) < 10^-10);
% Exp1_Total=Exp1_Num./Exp1_Den;
% Exp1_Total(Exp1DenZero)=0.5;
% 
% Exp2_Num=constante*sin(pi*t).*sin(pi*alpha*t);
% Exp2_Den=pi^2*alpha*t.^2;
% Exp2DenZero=find(abs(Exp2_Den) < 10^-10);
% Exp2_Total=Exp2_Num./Exp2_Den;
% Exp2_Total(Exp2DenZero)=0.5;
% 
% v=(Exp1_Total+Exp2_Total);
end