clear all; close all; clc;

nmax=100;
n=1;
x=zeros(nmax,1);
y=zeros(nmax,1);
z=zeros(nmax,1);
x(1)=1;
y(1)=2;
z(1)=2;
K=[];

while n<nmax
    x(n+1)=(-15+y(n)+5*z(n))/2;
    y(n+1)=(21+4*x(n)+z(n))/8;
    z(n+1)=7-4*x(n)+y(n);
    K=[x y z];
    n=n+1;
end

K(5,:)
