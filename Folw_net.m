% This code is used to visualize estimated potential and net folw matrix

clc
clear
close all

%% Input
load('C:\Users\Daipeng1993\Desktop\Code\Data\Growth_rate.mat');
load('C:\Users\Daipeng1993\Desktop\Code\Data\Diffusion_distance.mat');

%% Parameters
N=2;
T=18;
eps=0.5;

%% Calculation
[~,~,A,~,~]=Net_flow(N,T,eps,par,S);

%% Output figure
tiledlayout(2,2)                                    %Requires R2019b or later
nexttile([1 2])
xvalues={'Langfang','Suzhou','Beijing','Changsha','Wuxi','Ningbo'};
yvalues=xvalues;
h=heatmap(xvalues,yvalues,A');
h.Title='Net flow matrix (\epsilon=0.5)';
h.GridVisible = 'off';
colorbar off

%% Calculation
eps=0.4;
[V,Id,A,D,~]=Net_flow(N,T,eps,par,S);

%% Output figure
nexttile
scatter(V,sum(A,2),'MarkerEdgeColor',[.5 .5 0],'MarkerFaceColor',[.7 .7 0],'LineWidth',1.5);
xlabel('Potential')
ylabel('Total outflow (per-city)')
title('\epsilon=0.4');
xticks([0.0172 0.0175 0.0178])
box on
nexttile
B=[];C=[];
for i=1:length(V)
    for j=i+1:length(V)
        plot(D(Id(i),Id(j)),A(i,j),'.')
        hold on
    end
end
title('\epsilon=0.4');
xlabel('Diffusion distance')
ylabel('Net outflow (city-city)')
