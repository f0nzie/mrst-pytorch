% https://www.mathworks.com/matlabcentral/answers/407316-how-can-i-take-the-jacobian-of-a-function
function main
x = [5 7];
b = [2 3];
h = numerical_jacobian(@qn, x, b)
end

function df=numerical_jacobian(f,x,b) 
n = length(x); 
E = speye(n)
e = eps^(1/3); 
  for i=1:n 
   % df(:,i) = (f(x+e*E(:,i),b)-f(x-e*E(:,i),b))/(2*e);  % error
   df(:,i) = (f(x+e,b)-f(x-e,b))/(2*e);
   % Eye = E(:,i)
   % df(:,i) = ( feval(f, x+e, b) - feval(f, x-e, b) ) / (2*e); % works
 
  end 
end

function demand = qn(x,b)
  z1 = b(1)-b(2)*x(1)+b(1)*x(2);
  z2 = b(1)-b(2)*x(2)+b(1)*x(1);
  demand = [z1;z2];
end