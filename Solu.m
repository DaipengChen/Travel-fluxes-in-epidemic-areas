function [I,F1] = Solu(C,Parl)
[II]=Solu_Wuhan(Parl(1,:));
F0=Parl(C,5);
par=[Parl(C,1) Parl(C,2) Parl(C,3) Parl(C,4)];
[~,I]=ode45(@Model,1:1:80,F0,[],par);
T1=1:1:80;
F1=par(1)./(1+exp(T1-par(3)-1))-par(2);

function dF=Model(t,F,parl)
a=parl(1);b=parl(2);c=parl(3);d=parl(4);
dF=(a/(1+exp(t-c-1))-b)*F+d*heaviside(c-t+1)*II(round(t+Parl(1,3)-c));
end

end