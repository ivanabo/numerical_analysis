
u = @(x,t) sin(pi*x);
ro0 = @(x) 0;
ro1 = @(t) 0;

a = 0;
b = 1;
T = 0.1;

m = 20;
n = 5;

[z,x,t] = nrpdj(a,b,T,u,ro0,ro1,m,n);

figure(1)
[X,Y] = meshgrid(x,t);
Z = sin(pi*X).*exp(-pi*pi*Y);
surf(X,Y,Z);
xlabel('x');
ylabel('t');

figure(2)
surf(X,Y,z);
xlabel('x');
ylabel('t');