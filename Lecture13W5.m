clear all; close all; clc

L=20;
n=32; %number of Fourier modes, 2^m

x2=linspace(-L/2,L/2,n+1); %dont need to track last point n+1
x=x2(1:n);

u=sech(x);
ud=-sech(x).*tanh(x);

ut=fft(u);
%utt=fftshift(abs(ut));

k=(2*pi/L)*[0:(n/2-1) (-n/2):-1]; %wave numbers, rescale, accounted for shifting by constructing this way
u1dt=1i*(k.*ut); %transform of first derivative of u
u1d=ifft(u1dt);

plot(x,u,'k',x,ud,'m',x,u1d,'go')

y=0;
ud1=-sech(y).*tanh(y);
abs(ud1-u1d(n/2+1))