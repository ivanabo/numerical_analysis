function [U] = Laplace(u1,u2,u3,u4,n,a,b)

h = (b-a)/(n+1);

x = zeros(n+2,1);
y = zeros(n+2,1);

for i = 1:n+2
    x(i,1) = a + (i-1)*h;
    y(i,1) = b + (i-1)*h;
end

T = delsq(numgrid('S',n+2));

T = T/(h*h);

f = zeros(n*n,1);

u = T\f;

U = zeros(n+2,n+2);

for i = 1:n
    U(:,i) = u((i-1)*n+1:i*n,1);
end

for i = 1:n+2
    U(1,i) = u1(a,y(i,1));
    U(end,i) = u2(b,y(i,1));
    U(i,1) = u3(x(i,1),a);
    U(i,end) = u4(x(i,1),b);
end

end