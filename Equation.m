function rhs=Equation(x,ic,dummy,beta)
y1=ic(1);
y2=ic(2);
rhs=[y2;(x^2-beta)*y1];