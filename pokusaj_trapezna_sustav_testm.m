Y0 = [2, 5]'; % Y0 = (x0, y0)
n = 30;
t0 = 0;
T = 1;

[Rj, t] = trapezna_sustav(@F, t0, Y0, T, n);

plot(t, Rj(1,:), 'r', t, Rj(2,:), 'b');
grid on;
hold on;
fplot('5*exp(2*x)-3*exp(-7*x)',[0 1], 'm');
fplot('-1*exp(2*x)+6*exp(-7*x)',[0 1], 'c');
legend('Euler x', 'Euler y', 'egzaktno x', 'egzaktno y');
hold off;