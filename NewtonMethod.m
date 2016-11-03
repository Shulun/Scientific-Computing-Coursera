clear all; close all; clc;

tol=10e-5;
nmax=100;
x=-3;
n=0;
xvals=x;
eps=1;

while eps>tol&n<nmax
    y=x-(exp(x)-sin(x))/(exp(x)-cos(x));
    xvals=[xvals;y];
    eps=abs(y-x);
    x=y;n=n+1;
end

xvals(end)
