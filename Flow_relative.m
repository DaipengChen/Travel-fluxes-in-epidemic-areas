% This code is used to visualize estimated potential and net folw matrix

clc
clear
close all

%% Input
load('C:\Users\Daipeng1993\Desktop\Code\Data\Growth_rate.mat');
load('C:\Users\Daipeng1993\Desktop\Code\Data\Diffusion_distance.mat');

%% Parameter
N=2;
T=18;
eps=0.39;

%% Calculation
[V,Id,A,D,I]=Net_flow(N,T,eps,par,S);A=A';

%% Output figure
for i=1:length(V)
    for j=1:length(V)
        B(i,j)=(1-A(j,i))*I(i)/I(j)+A(i,j);
    end
end
B=log10(B);
tiledlayout(2,8)                                  %Requires R2019b or later
nexttile([2 7])
xvalues={'Wuhan','Zhoukou','Chengdu','Foshan','Kunming','Guangzhou','Chongqing',...
    'Hangzhou','Huizhou','Fuyang','Zhengzhou','Wenzhou','Tianjin','Dongguan',...
    'Zhongshan','Xi`an','Jinan','Guiyang','Shenzhen','Nanjing','Shanghai',...
    'Langfang','Nanning','Hefei','Suzhou','Beijing','Changsha','Wuxi','Ningbo'};
yvalues=xvalues;
h=heatmap(xvalues,yvalues,B);
h.Title='Relative flow matrix (\epsilon=0.39)';
colormap jet
h.GridVisible = 'off';
nexttile([2 1])
text(-1,0.335,'log_{10}(B_{i,j} | B_{j,i}=1)','rotation',90)
axis off