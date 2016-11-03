close all; clear all; clc

tol=10^(-6);
L=2;
xspan=[-L L];

col=['r','b','g','c','m','k','y','w','r','g'];

beta=1;
count=1000;

A=1;
theta=0;
ic=[theta A]; 
addition=2;

for jj=1
dbeta=beta/10;
for j=1:count

[t,y]=ode45('Equation',xspan,ic,[],beta);

%tol=exp(sqrt(L^2-beta));

if abs(y(end,1))<tol
    break
end

if y(end,1)*((-1)^(jj))>0
    beta=beta-dbeta/2;
    dbeta=dbeta/2;
else
    beta=beta+dbeta/2;
    dbeta=dbeta/2;
end

end

beta
beta=beta+addition;
y(end,1)
norm=trapz(t,y(:,1).*y(:,1));
plot(t,y(:,1)/sqrt(norm),col(jj)); hold on
end
