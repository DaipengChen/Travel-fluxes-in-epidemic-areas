% This code is used to visualize the relationship between
% estimated potential and other factors

clc
clear
close all

%% Input
load('C:\Users\Daipeng1993\Desktop\Code\Data\Growth_rate.mat');
load('C:\Users\Daipeng1993\Desktop\Code\Data\Diffusion_distance.mat');

%% Parameters
N=10;
T=18;
eps=0.39;

%% Calculation
[X,R,I,D]=Potential(N,T,eps,par,S);

%% Output figure
subplot(1,3,1)
plot(R(1:end),X(1:end),'o','MarkerFaceColor',[0 0 0.6]);
axis([-0.1 0.1 0.017 0.0185])
xlabel('Growth rate')
ylabel('Estimated potential with \epsilon=0.39')

subplot(1,3,2)
plot(log(I(1:end)),X(1:end),'o','MarkerFaceColor',[0 0.7 0.6]);
axis([-2 6 0.017 0.0185])
set(gca,'yticklabel',[])
xlabel('Logarithmic cases')

subplot(1,3,3)
plot(sum(D)/28,X(1:end),'o','MarkerFaceColor','y');
set(gca,'yticklabel',[])
axis([0.09 0.14 0.017 0.0185])
xlabel('Diffusion distance')