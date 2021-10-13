function [I] = Solu_Wuhan(parl)
F0=parl(5);
par=[parl(1) parl(2) parl(3) parl(4)];
[~,I]=ode45(@Model,1:1:100,F0,[],par);

function dF=Model(t,F,parl)
a=parl(1);b=parl(2);c=parl(3);d=parl(4);
dF=(a/(1+exp(t-c-1))-b)*F+d*heaviside(1-t+c)*F;
end

end