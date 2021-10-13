% This code is used to calculate the correlation between
% estimated potential and other factors

clc
clear
close all

%% Input
load('C:\Users\Daipeng1993\Desktop\Code\Data\Growth_rate.mat');
load('C:\Users\Daipeng1993\Desktop\Code\Data\Diffusion_distance.mat');

%% Parameters
N=2;
T=18;

%% Calculation
for i=1:10
    eps=0.01*i+0.33;
    [X,R,I,D]=Potential(N,T,eps,par,S);
    [C1,P1]=corrcoef(R,X);
    [C2,P2]=corrcoef(I,X);
    [C3,P3]=corrcoef(sum(D)/28,X);
    c1(i)=min(min(C1));
    c2(i)=min(min(C2));
    c3(i)=min(min(C3));
    p1(i)=min(min(P1));
    p2(i)=min(min(P2));
    p3(i)=min(min(P3));
    Y(i,:)=[c1(i) c2(i) c3(i)];
    P(i,:)=[p1(i) p2(i) p3(i)];
end
C=[];
for i=1:10
    for j=1:3
        if abs(P(i,j))<0.001
            C=[C Y(i,j)+0.05];
        end
    end
end

%% output figure
X1=[0.34,0.35,0.36,0.37,0.38,0.3876,0.39,0.3976,0.4076,0.4176,0.4276];
X2=[0.34,0.35,0.36,0.37,0.38,0.39,0.40,0.41,0.42,0.43];
plot(X1,C,'k*','markersize',5);
hold on
b=bar(X2,Y,'FaceColor','flat');
for k=1:size(Y,2)
    b(k).CData=k;
end
legend('Significant (p<0.001)')
xlabel('Variations in contact rate (\epsilon)')
ylabel('Correlation between potential and other factors')
axis([0.335 0.435 -0.5 1.5])
