function rhs=rhs_bvp1(x,y,beta)
rhs=[y(2); (beta-100)*y(1)-10*y(1)^3];