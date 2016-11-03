close all; clear all; clc

n=30;
m=1:1:n;
x=cos((2*m-1)*pi/(2*n));
y=0;

figure(1)
plot(x,y,'o')
set(gca,'YTick',-1:1:1)
%axis([-1 1 -1 1])