clear all; close all; clc;

nmax=20;
n=1;
x=zeros(nmax,1);
y=zeros(nmax,1);
z=zeros(nmax,1);
x(1)=1;
y(1)=2;
z(1)=2;
K=[];

while n<nmax
    x(n+1)=(7+y(n)-z(n))/4;
    y(n+1)=(21+4*x(n+1)+z(n))/8;
    z(n+1)=(15+2*x(n+1)-y(n+1))/5;
    K=[x y z];
    n=n+1;
end

K(5,:)
