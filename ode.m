
%h = (b-a)/(n+1);
n = 4;
A = diag(-ones(n-1,1),-1)+diag(-ones(n-1,1),1);

for i = 1:n
    A(i,i) = 2+feval(r_handle,x(i))*h^2;
end
