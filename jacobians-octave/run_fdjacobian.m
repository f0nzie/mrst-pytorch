% another jacobian
% https://www.mathworks.com/matlabcentral/answers/3794-jacobian-matrix-of-partial-derivatives-of-a-nonlinear-system
function run_fdjacobian
df = fdjacobian(@test_func,[0 1]',0.01)
end



function J = fdjacobian(f,x,dx)
y = f(x);
m = length(y);
n = length(x);
J = zeros(m,n);
for k = 1:n
    xnew = x;
    xnew(k) = xnew(k)+dx;
    ynew = f(xnew);
    J(:,k) = ynew-y;
end
J = J/dx;
end

function y=test_func(x)
% y=[x(1);x(2)^2;]+c;
y = [x(1); x(2)^2];
end

