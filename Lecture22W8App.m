clear all; close all; clc

N=20;
[D,x]=cheb(N);
D2=D^2;

y=x;
[X,Y]=meshgrid(x,y); %chop up in intervals

%need initial condition
U=exp(-(X.^2+Y.^2)/0.1);
pcolor(X,Y,U)

I=eye(length(D2));
L=kron(I,D2)+kron(D2,I); %2d Laplacian