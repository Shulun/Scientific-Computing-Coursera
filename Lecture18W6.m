clear all; close all; clc

% initialize the grid, time steps and CFL
Time=4;
L=20; n=200;
x2=linspace(-L/2,L/2,n+1); x=x2(1:n);
dx=x(2)-x(1);
dt=0.05;
t=0:dt:Time;

CFL=dt/dx
%break
% initial condition

u0=exp(-x.^2).'; %sol in the past
u1=exp(-(x+dt).^2).'; %sol now
% u0(1)
% u0(1)=0;
% u0(1)
% u0(length(u0))=0;
usol(:,1)=u0;
usol(:,2)=u1;

% u_x matrix
e1=ones(n,1);
% A=spdiags([e1 -2*e1 e1],[-1 0 1],n,n);
% A(1,n)=1;A(n,1)=1;
A=spdiags([-e1 e1],[-1 1],n,n);
A(1,n)=-1;A(n,1)=1;

for j=1:length(t)-2
%     u2=u1+0.5*CFL*A*u1; % Euler Scheme
%     %u0=u1; % Step forward into future
%     u1=u2; % Step forward into future
%     usol(:,j+2)=u2;
    u2=u0+2*CFL*A*u1; % Lepfrog Scheme
    u0=u1; u1=u2; %my past is my current, my current is my future
    usol(:,j+2)=u1;
end
max(usol(:,length(t)))
% plot
waterfall(x,t,usol');
map=[0 0 0];
colormap(map);