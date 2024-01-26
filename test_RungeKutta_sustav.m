Y0 = [2, 5]'; % Y0 = (x0, y0)
n = 30;
t0 = 0;
T = 1;

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

[Rj, t] = Runge_Kutta_sustav(@F, t0, Y0, T, n, M);

plot(t, Rj(1,:), 'r', t, Rj(2,:), 'b');
grid on;
hold on;
fplot('5*exp(2*x)-3*exp(-7*x)',[0 1], 'm');
fplot('-1*exp(2*x)+6*exp(-7*x)',[0 1], 'c');
legend('Euler x', 'Euler y', 'egzaktno x', 'egzaktno y');
hold off;