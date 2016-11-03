clear all;close all;

m=4;
n=m*m;

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

matA = spdiags([e1 e1 e5 e2 -4*e1 e3 e4 e1 e1],[-n+m -m -m+1 -1 0 1 m-1 m n-m],n,n);
figure(1)
spy(matA)
matB=spdiags([e1 -e1 e1 -e1],[-n+m -m m n-m],n,n);
figure(2)
spy(matB)
matC=spdiags([e5 -e2 e3 -e4],[-m+1 -1 1 m-1],n,n);
figure(3)
spy(matC)