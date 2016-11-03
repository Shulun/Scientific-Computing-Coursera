clear all; close all;


m=64;
n=m*m;
L=10;
x2=linspace(-L,L,m+1);
x=x2(1:m);
del=mean(diff(x));
y=x;
[X,Y]=meshgrid(x,y);
U=exp(-X.^2-(Y.^2)./20);
u0=reshape(U,n,1);

e0=zeros(n,1);
e1=ones(n,1);

e2=e1;
e4=e0;
for j=1:m
    e2(m*j)=0;
    e4(m*j)=1;
end

e3(2:n,1)=e2(1:n-1,1); e3(1,1)=e2(n,1);
e5(2:n,1)=e4(1:n-1,1); e5(1,1)=e4(n,1);

A = spdiags([e1 e1 e5 e2 -4*e1 e3 e4 e1 e1],[-n+m -m -m+1 -1 0 1 m-1 m n-m],n,n)*(1/del^2);
A1=A;
A1(1,1)=2/del^2;
B=spdiags([e1 -e1 e1 -e1],[-n+m -m m n-m],n,n)*(1/(2*del));

C=spdiags([e5 -e2 e3 -e4],[-m+1 -1 1 m-1],n,n)*(1/(2*del));

tspan=0:0.5:4;
k=0.001;
%[t,w]=ode45(@(t,w) rhs(t,w,A,A1,B,C,k),tspan,u0);
[t,w]=ode45('rhs',tspan,u0,[],A,A1,B,C,k);
for j=1:length(t)
    u=reshape(w(j,:),m,m);
    pcolor(u)
end


