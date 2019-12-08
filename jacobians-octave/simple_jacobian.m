# https://stackoverflow.com/a/29795849/5270873
pkg load symbolic
syms x y z;
f = [x+2*y+z, x^3+y^2+3*z];
gradf = jacobian(f, [x,y,z])
