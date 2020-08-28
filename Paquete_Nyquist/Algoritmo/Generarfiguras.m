%Pruebas
clear all
clc
SNRdb=0:1:21;
SIRdb=10;
for i=1:1:length(SNRdb)
    i
   Sin1(i)=BERCCISin('Paper1',0,SNRdb(i),SIRdb,1);
   Prec1(i)=BERCCIPrec2('Paper1',0,SNRdb(i),SIRdb,1);
   Gauss1(i)=BERCCIGauss('Paper1',0,SNRdb(i),SIRdb,1);
   Sin6(i)=BERCCISin('Paper1',0,SNRdb(i),SIRdb,6);
   Prec6(i)=BERCCIPrec2('Paper1',0,SNRdb(i),SIRdb,6);
   Gauss6(i)=BERCCIGauss('Paper1',0,SNRdb(i),SIRdb,6);
end
figure('rend','painters','pos',[10 10 500 600])
semilogy(SNRdb,double(Sin1),'b')
hold on
semilogy(SNRdb,double(Prec1),'r')
hold on
semilogy(SNRdb,double(Gauss1),'k')
hold on
semilogy(SNRdb,double(Sin6),'b--')
hold on
semilogy(SNRdb,double(Prec6),'r--')
hold on
semilogy(SNRdb,double(Gauss6),'ko')
legend('Sinusoidal Model L=1','Precise Model L=1','Gaussian Model L=1','Sinusoidal Model L=6','Precise Model L=6','Gaussian Model L=6');
xlabel('SNR [dB]')
ylabel('Bit Error Rate (BER)')
axis([0 21 1e-7 1])
%xlim([0 21])
%ylim([10e-7 0])
title(strcat('BER en función del CCI para SIR=',int2str(SIRdb)))

