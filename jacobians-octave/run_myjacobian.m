function run_myjacobian
x = 1:3;
J = myjacobian(@the_function,x)
end


% ERROR
function [J]=myjacobian(func,x)
  % computes the Jacobian of a function
  n=length(x);
  fx=feval(func,x);
  eps=1.e-8;  % could be made better
  xperturb=x;
 for i = 1:n
    xperturb(i)=xperturb(i)+eps;
    J(:,i)=(feval(func,xperturb)-fx)/eps;
    xperturb(i)=x(i);
  end;
end
   
function y=the_function(x)
  y = [x(1)*x(2)^2;x(1)*x(3)^2;x(1)^2];
end   
 
 