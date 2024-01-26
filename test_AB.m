% test metoda Runge-Kutta
y0 = 1;
n = 3;
t0 = 0;
T = 0.2;

F = @(x,y) -y-5*exp(-x)*sin(5*x);

% matrica M za metodu Runge-Kutta
M = zeros(5,5);
M(2,1) = 1/2;
M(3,1) = 1/2;
M(4,1) = 1;
M(2,2) = 1/2;
M(5,2) = 1/6;
M(3,3) = 1/2;
M(5,3) = 1/3;
M(4,4) = 1;
M(5,4) = 1/3;
M(5,5) = 1/6;

[y,t] = Runge_Kutta(F, t0, y0, T, n, M);

f=zeros(4,1);
for i = 1:4
    f(i)=F(t(i),y(i));
end

T = 6;
t0 = t(4);
n=80;
h = (T-t0) / n;
[rj,t] = AB(F,y,f,t,n,h);

plot(t,rj,'g');
hold on;
fplot('exp(-x)*cos(5*x)',[0 6],'r');
grid on;
xlabel('t');
ylabel('y(t)');
legend('AB','egzaktno');