% Usage: [y t] = midpoint(f,a,b,ya,n) or y = midpoint(f,a,b,ya,n)
% Midpoint method for initial value problems
%
% Input:
% f - Matlab inline function f(t,y)
% a,b - interval
% ya - initial condition
% n - number of subintervals (panels)
%
% Output:
% y - computed solution
% t - time steps
%
% Examples:
% [y t]=midpoint(@myfunc,0,1,1,10);          here 'myfunc' is a user-defined function in M-file
% y=midpoint(inline('sin(y*t)','t','y'),0,1,1,10);
% f=inline('sin(y(1))-cos(y(2))','t','y');
% y=midpoint(f,0,1,1,10);

function [y t] = midpoint(f,a,b,ya,n)
h = (b - a) / n;
halfh = h / 2;
y(1,:) = ya;
t(1) = a;
for i = 1 : n
    t(i+1) = t(i) + h;
    z = y(i,:) + halfh * f(t(i),y(i,:));
    y(i+1,:) = y(i,:) + h * f(t(i)+halfh,z);
end;
