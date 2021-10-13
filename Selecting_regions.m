function [x,R]=Selecting_regions(T,eps,par)
[R,RI,~]=Reproduction_density(par,eps);
f=-ones(1,29);
ic=1:29;
A=RI(T:34,1:29);
b=zeros(35-T,1);
lb=zeros(29,1);
ub=ones(29,1);
[x,~,~]=intlinprog(f,ic,A,b,[],[],lb,ub);
end