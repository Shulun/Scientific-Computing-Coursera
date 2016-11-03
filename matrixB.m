%matrix B

m=4;
n=m*m;

e0=zeros(n,1);
e1=ones(n,1);

matB=spdiags([e1 -e1 e1 -e1],[-n+m -m m n-m],n,n);
%spy(matB)

e2=e0;
e3=e0;
e2(2,1)=1;
e3(n-1,1)=-1;

matC=spdiags([e2 -e1 e1 e3],[-n+2 -1 1 n-2],n,n);
spy(matC)