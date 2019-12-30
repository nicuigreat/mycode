C=[191.1792,11.6313];
Pc=[18.5967,3.98599];
Pn=[18.5967,3.98599];
% return (vec_a.getX()*vec_b.getY()-vec_a.getY()*vec_b.getX()) / sqrt(vec_a*vec_a);


A=Pn-Pc;
B=C-Pc;
(A(1)*B(2)-A(2)*B(1))/sqrt(   A(1)*A(1)-A(2)*A(2) )