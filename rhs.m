function wt = rhs( t,w,dummy,A,A1,B,C,k )
psi=A1\w;
wt=k*A*w-(B*psi).*(C*w)+(C*psi).*(B*w);
end

