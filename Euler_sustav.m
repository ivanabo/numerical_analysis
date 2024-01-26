% sustav jednadžbi
%   dx/dt = f(x,y)
%   dy/dt = g(x,y)
%      (x0,y0) inicijalni uvjet
%       h = duljina koraka
% iteracije: x(k+1) = x(k) + h*f(x(k),y(k))
%            y(k+1) = y(k) + h*g(x(k),y(k))
% ili u vektorskom zapisu:
% dY/dt = F(Y)

function [Y,t] = Euler_sustav(F_Handle, t0, Y0, T, n)

m = max(size(Y0));
Y = zeros(m,n);
t = zeros(n,1);
Y(:,1) = Y0;
t(1) = t0;
h = (T-t0) / n;

for i = 1:n
    t(i+1) = t(i) + h;
    Y(:,i+1) = Y(:,i) + h * feval(F_Handle, t(i), Y(:,i));
end