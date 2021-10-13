function [X,R,I,D]=Potential(N,T,eps,par,S)
[~,~,U]=Reproduction_density(par,eps);
[x,r]=Selecting_regions(T,eps,par);
[row,~]=find(x>0);
I=U(row,T);
m=length(row);
D=zeros(m);
R=zeros(m,1);
for i=1:m
    for j=1:m
        D(i,j)=S(row(i),row(j));
    end
end
for i=1:m
    R(i)=r(row(i),T);
end
delta=1/(median(D(:)))^2;
[L]=Laplacian(N,delta,D);
X0=pinv(L)*(-R); 
error=L*X0+R;
if error<0 
    fun=@(t)norm(t-0.03.*log(I),2);
    options=optimset('Display','off','MaxIter', 20000, 'MaxFunEvals',20000);
    [X1,~,~,~]=fmincon(fun,X0,L,-R,[],[],[],[],[],options);
    X=X1;
else  
    X=X0;
end
end