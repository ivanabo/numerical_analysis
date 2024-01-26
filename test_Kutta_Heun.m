% test metoda Kutta i Heun

y0 = 1;
n = 40;
t0 = 0;
T = 3;

f = @(x,y) -y-5*exp(-x)*sin(5*x);

% matrica M za metodu Kutta
M = zeros(4,4);
M(2,1) = 1/2;
M(3,1) = 1;
M(2,2) = 1/2;
M(3,2) = -1;
M(4,2) = 1/6;
M(3,3) = 2;
M(4,3) = 2/3;
M(4,4) = 1/6;

[y,t] = KuttaHeun(f, t0, y0, T, n, M);

% matrica N za metodu Heun
N = zeros(4,4);
N(2,1) = 1/3;
N(3,1) = 1;
N(2,2) = 1/3;
N(4,2) = 1/4;
N(3,3) = 2/3;
N(4,4) = 3/4;

[py,pt] = KuttaHeun(f, t0, y0, T, n, N);

plot(t,y,'g.');
hold on;
fplot('exp(-x)*cos(5*x)',[0 3],'r');
grid on;
xlabel('t');
ylabel('y(t)');

hold on;

plot(pt,py,'b--');
legend('Kutta','egzaktno rješenje','Heun');