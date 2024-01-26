function [z,x,t] = nrpdj(a,b,t0,T,g,ro0,ro1,m,n)

dx = (b-a)/(n+1);
dt = (T-t0)/(m+1);

RO0 = zeros(n,1);
RO1 = zeros(n,1);

x = zeros(n+2,1);
t = zeros(m+2,1);

z = zeros(m+2,n+2);

for i = 1:n+2
    x(i,1) = a + (i-1)*dx;
end

for i = 1:m+2
    t(i,1) = t0 + (i-1)*dt;
end

for i = 1:m+2
    RO0(i,1) = ro0(t(i));
    RO1(i,1) = ro1(t(i));
end

for i = 1:n+2
    z(1,i) = g(x(i),0);
end

c = dt/(dx^2);
c

T = zeros(n,n);
for i = 1:n
    d(i) = 1-2*c;
    d1(i) = c;
end

T = diag(d) + diag(d1(1:n-1),-1) + diag(d1(1:n-1),1);

r = zeros(n,1);
for j=2:m+1
    r(1,1) = RO0(j);
    r(n,1) = RO1(j);
    z(j,2:n+1) = T*z(j-1,2:n+1)' + r;
end

end