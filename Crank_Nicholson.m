function [z,x,t] = Crank_Nicholson(a,b,T,u,ro0,ro1,m,n)

dx = (b-a)/(n+1);
dt = T/(m+1);

RO0 = zeros(n,1);
RO1 = zeros(n,1);

x = zeros(n+2,1);
t = zeros(m+2,1);

z = zeros(m+2,n+2);

for i = 1:n+2
    x(i,1) = a + (i-1)*dx;
end

for i = 1:m+2
    t(i,1) = (i-1)*dt;
end

for i = 1:m+2
    RO0(i,1) = ro0(t(i));
    RO1(i,1) = ro1(t(i));
end

for i = 1:n+2
    z(1,i) = u(x(i),1);
end

c = dt/(dx)^2;

T = zeros(n,n);
for i = 1:n
    d(i) = -2/(dx*dx);
    d1(i) = 1/(dx*dx);
end

T = diag(d) + diag(d1(1:n-1),-1) + diag(d1(1:n-1),1);

r = zeros(n,1);
for j=2:m+1
    r(1,1) = RO0(j)/(dx*dx);
    r(n,1) = RO1(j)/(dx*dx);
    z(j,2:n+1) = T*(z(j-1,2:n+1))'+r;
end

A = eye(n,n) - dt*T/2;
B = eye(n,n) + dt*T/2;
ro = zeros(n,1);


for j = 2:m+1
    ro(1,1) = RO0(j,1)+RO0(j+1,1);
    ro(n,1) = RO1(j,1)+RO1(j+1,1);
    z(j,2:n+1) = (A\B)*(z(j-1,2:n+1))'+A\ro*c/2;
end

end