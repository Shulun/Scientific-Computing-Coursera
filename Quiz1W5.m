clear all; close all; clc

L=20;
n=128;
x2=linspace(-L/2,L/2,n+1);
x=x2(1:n);
u=exp(-x.*x);
ut=fft(u);
utt=fftshift(abs(ut));

max(abs(utt))
plot(utt)