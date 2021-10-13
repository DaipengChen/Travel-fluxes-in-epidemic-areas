function [V,Id,A,D,I]=Net_flow(N,T,ep,par,S)
[X,R,I,D]=Potential(N,T,ep,par,S);
[V,Id]=sortrows(X,-1);
threshold=0.1;                     %control the level off population flow
for i=1:length(V)
    for j=1:length(V)
        if V(i)-V(j)>0
            A(i,j)=(V(i)-V(j))/D(Id(i),Id(j));
        else
            A(i,j)=0;
        end
    end
end
R=R(Id);I=I(Id)';
[row,~]=find(R>0);                                   %find the sources
col=setdiff(1:length(V),row)';                       %label of the sinks
Basic=A;

for i=1:length(V)-1                           %step1: turn off the source from sink
    j=length(V)-i+1;
    ll=1;
    while I*A(:,j)+I(j)*(R(j)-sum(A(j,:)))>threshold&&col(ll)<j
        A(col(ll),j)=eps*A(col(ll),j);
        ll=ll+1;
    end
end

for i=1:length(V)-1                            %step2: turn off the source from source
    j=length(V)-i+1;
    if I*A(:,j)+I(j)*(R(j)-sum(A(j,:)))>threshold
        alph1=max(eps,-(I(j)*(R(j)-sum(A(j,:))))/(I*A(:,j)));
        A(:,j)=alph1*A(:,j);
    end
end

for i=1:length(V)-1   %step3: trun on the previous cutoff
    j=length(V)-i+1;
    if I*A(:,j)+I(j)*(R(j)-sum(A(j,:)))<0
        alph2=-(I(j)*(R(j)-sum(A(j,:))))/(I*A(:,j));
        for k=1:length(V)
            A(k,j)=min(alph2*A(k,j),Basic(k,j));
        end
    end
end
end