clear all; close all; clc;

dx=0.1;
L=4;
x=-L:dx:L;
N=length(x);
Diagnal=[x(2)+2/(3*dx^2),(x(2):dx:x(N-2)).^2+2/(dx^2),x(N-1)+2/(3*dx^2)];
A1=diag(Diagnal);

Up=[ones(1,N-3)*(-1/(dx^2)),-2/(3*dx^2)];
A2=diag(Up,1);
Down=[-2/(3*dx^2),ones(1,N-3)*(-1/(dx^2))];
A3=diag(Down,-1);

A=A1+A2+A3;

E=eigs(A,5,'sm')