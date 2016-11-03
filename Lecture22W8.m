clear all; close all; clc

x=-1:.01:1;
u=exp(x).*sin(5*x);
ux=exp(x).*sin(5*x)+5*exp(x).*cos(5*x);
uxx=-24*exp(x).*sin(5*x)+10*exp(x).*cos(5*x);

%plot(x,u,x,ux,x,uxx)

%cluster at ends, need to build a new x
N=20;
[D,x2]=cheb(N); %20 points for x2, 20 by 20 matrix for D
D2=D^2;

u2=exp(x2).*sin(5*x2);
u2x=D*u2; %derivative
u2xx=D2*u2;

figure(1)
subplot(3,1,1)
plot(x,u,'k-',x2,u2,'mo')
subplot(3,1,2)
plot(x,ux,'k-',x2,u2x,'mo')
subplot(3,1,3)
plot(x,uxx,'k-',x2,u2xx,'mo')
