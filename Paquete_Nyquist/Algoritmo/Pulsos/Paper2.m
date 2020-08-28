function[v]=Paper2(t,alpha)
T=1;
A1=0.4023;A2=0.7163;w1=2.839;w2=1.176;phi1=0.7553;phi2=0.1602;theta1=0.4587;theta2=1.107;
v=(A1*cos(w1*abs(t)-phi1)*exp(-theta1*abs(t)))+(A2*cos(w2*abs(t)-phi2)*exp(-theta2*abs(t)));

end