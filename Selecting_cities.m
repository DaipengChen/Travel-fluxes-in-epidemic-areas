% This code is used to find the time and location where the lockdown can be released 

clc
clear
close all

%% Input
load('C:\Users\Daipeng1993\Desktop\Code\Data\Growth_rate.mat'); %estimated growth rate

%% Parameters
eps=0.53;
T=20;

%% Calculation
[R,RI]=Reproduction_density(par,eps);
f=-ones(1,29);
ic=1:29;
A=RI(T:34,1:29);
b=zeros(35-T,1);
lb=zeros(29,1);
ub=ones(29,1);
[x,fval,flag]=intlinprog(f,ic,A,b,[],[],lb,ub); 
%the binary vector x=1 means a city was selected 
