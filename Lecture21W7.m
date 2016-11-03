clear all; close all; clc

tspan=0:1:40;
mu=0.001;
L=20; n=64;
x2=linspace(-L/2,L/2,n+1); x=x2(1:n);

kx=(2*pi/L)*[0:n/2-1 -n/2:-1]; kx(1)=10^(-6); ky=kx;

y=x;
[X,Y]=meshgrid(x,y);
[KX,KY]=meshgrid(kx,ky);
K=KX.^2+KY.^2;
K2=reshape(K,n^2,1);

w=exp(-0.25*(X-2).^2-2*Y.^2)-exp(-0.25*(X+2).^2-2*Y.^2);
%pcolor(X,Y,w)
wt=fft2(w); %in Fourier domain
wt2=reshape(wt,n^2,1);

[t,wt2_sol]=ode45('wvort_rhs',tspan,wt2,[],mu,K,K2,n,KX,KY);

for j=1:length(t)
   w=real(ifft2(reshape(wt2_sol(j,:),n,n)));
   pcolor(X,Y,w), shading interp
   drawnow
   pause(0.2)
end