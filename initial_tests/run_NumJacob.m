function main
df = NumJacob(@test_func,[0 1]',[1 2]')
end


% From http://youngmok.com/numerical-jacobian-matrix-matlab/
function df=NumJacob(f,x0,varargin)
epsilon = 1e-6; % delta
l_x0 = length(x0); % length of x0;
f0 = feval(f,x0,varargin{:}); % caclulate f0
l_f = size(f0,1); % check the size of f
% z = zeros(l_f,1);
  for i = 1:l_x0
      dx = [ zeros(i-1,1); epsilon; zeros(l_x0-i,1)];;
      df(:,i) = ( feval(f,x0+dx,varargin{:}) - f0 ) / epsilon;
  end
end


function y=test_func(x,c)
y=[x(1);x(2)^2;]+c;
end