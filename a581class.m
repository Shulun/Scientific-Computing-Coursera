clear all; close all; clc;

beta=99;
init=bvpinit(linspace(-1,1,50),@bc_init,beta);
sol=bvp4c(@rhs_bvp1,@bc_bvp1,init);
x=linspace(-1,1,100);
BS=deval(sol,x);
plot(x,BS(1,:))