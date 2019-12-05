% From http://mathcs.holycross.edu/~spl/MATLAB/matlab.html
% Jacobian, linear transformation
 A=[11 -3 14 7;5 7 9 2;8 12 -6 3]
 syms x1 x2 x3 x4
 x = [x1;x2;x3;x4]
 T = A*x
 % find the Jacobian
 JT=jacobian(T)
 % The Jacobian of T is precisely A