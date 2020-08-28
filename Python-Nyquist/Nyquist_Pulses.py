import numpy as np

def Raised_C(t,alpha,trunc):
    T=1
    v=np.empty(len(t))
    for i in range (0,len(t)):
        print(i)
        if (np.abs(np.abs(alpha * t[i] / T) - 0.5) > 1e-5):
            v[i]=np.sinc(t[i]/T) * np.cos(np.pi * alpha * t[i] / T) / (1 - np.power((2 * alpha * t[i] / T),2))  #typical case
        else:
            v[i]=np.sinc(t[i]/T) * np.pi * np.sin(np.pi * alpha * t[i] / T) / (8 * alpha * t[i] / T);  #'Hopital limit for alpha * tau = 0.5
    return v

def SPLCP (t,alpha,trunc):
    #Pulso SPLCP 
    #Párametros mu=2.5, b=1.5 y gamma =3 son los óptimos segun el paper "Family
    #of Nyquist I Pulses to Enhance OFDM System Performance" 

    #Gamma, Beta y Mu están definidos para todos los numeros reales
    mu=2.5; # mu is used to minimize the relative magnitude of the 2 largest side lobes.
    b=1.5; #b is used to control the phase of the modified sinc 
    gamma=3; #Provides additional degree of freedom by increasing the power
    T=1; # Periodo
    v=np.empty(len(t))

    for i in range (0,len(t)):
        if abs(t[i])<10e-3:
            t1=1-mu
            t2=mu
            PLCP=1
            v[i]=1

        #Límites de l'hopital (en caso de)
        else:
            t1 = (4*(1-mu)*np.power((np.sin(np.pi * alpha * t[i]/T * 0.5)),2))/np.power((np.pi*alpha*t[i]/T),2)
            t2 = (np.pi * alpha * mu * t[i]/T * np.sin(np.pi*alpha*t[i]/T))/np.power((np.pi*alpha*t[i]/T),2)
            PLCP = np.sinc(t[i]/T)*(t1+t2)
            v[i] = np.power((np.sin(b*t[i]/T)/(b*t[i]/T)),gamma)*PLCP

    return v




