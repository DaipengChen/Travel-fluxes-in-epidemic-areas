function [R,RI,U]=Reproduction_density(par,eps)
delay=par(:,3);
C=zeros(1,29);
I=zeros(29,100);
F=zeros(29,100);
U=zeros(29,54);
V=zeros(29,54);
for i=1:29
    C(i)=i;
    [I1,F1]=Solu(C(i),par);
    I(i,:)=I1;
    F(i,:)=F1;
end

for i=1:29
    lag=round(delay(i));
    U(i,:)=I(i,1+lag-4:54+lag-4);
    V(i,:)=F(i,1+lag-4:54+lag-4);
end

L=length(U(1,:));
R=zeros(29,L);
RI=zeros(29,L);
for i=1:29
    for j=1:L
        R(i,j)=V(i,j)+eps*(V(i,1)-V(i,j));
        RI(i,j)=R(i,j)*U(i,j);
    end
end
RI=RI';

end