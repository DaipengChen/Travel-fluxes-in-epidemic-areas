function [L]=Laplacian(N,delta,D)
m=length(D(1,:));
E=eye(m);
k=zeros(m);
k1=zeros(m);
P=zeros(m);
b=zeros(1,m);
d=zeros(1,m);
for i=1:m
    for j=1:m
        k(i,j)=(delta/pi)^(0.5*N)*exp(-delta*(D(i,j)^2));
    end
    b(i)=sum(k(i,:));
end

for i=1:m
    for j=1:m
        k1(i,j)=k(i,j)/sqrt(b(i)*b(j));
    end
    d(i)=sum(k1(i,:));
end

for i=1:m
    for j=1:m
        P(i,j)=k1(i,j)/(d(i));
    end
end
L=4*delta*(P-E);
end