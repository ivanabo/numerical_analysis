% rješavanje sustava jednadžbi Eulerovom metodom
%  dx/dt = 2x
%  dy/dt = y
%   x(0) = 1
%   y(0) = 3
% egzaktno rješenje:
%   x(t) = exp(2t)
%   y(t) = 3exp(t)

Y0 = [1, 3]'; % Y0 = (x0, y0)
n = 30;
t0 = 0;
T = 2;

[Rj, t] = Euler_sustav(@G, t0, Y0, T, n);

plot(t, Rj(1,:), 'r', t, Rj(2,:), 'b', 'LineWidth', 2);
grid on;
legend('x','y');
hold on;
fplot('exp(2*x)',[0 2], 'm');
fplot('3*exp(x)',[0 2], 'c');
legend('Euler x', 'Euler y', 'egzaktno x', 'egzaktno y');
hold off;