clear all
clc
Pulsos=[{'RaisedC'},{'ImprovedPLPC'},{'ELP'}];
Alpha=[0.25,0.35,0.5];
V=[];
for i=1:1:length(Alpha)
    for k=1:1:length(Pulsos)
        cd('Pulsos')
        p=Pulsos(k)
        cd('../')
        format shortE
        V=[V;num2cell(Alpha(i)) Pulsos(k) num2cell(double(BERISICCISin(p{:},Alpha(i),8,20,2)))]
    end
end
name={'alpha' 'Pulse' 'tau1' 'tau2' 'tau3'}
T=cell2table(V,'VariableNames',name)
writetable(T,'PE.xlsx')