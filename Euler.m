% f je zadana funkcija
% y0 = y(t0) poznata zadana vrijednost
% t je vektor duljine n (koraci)

function [y,t] = Euler(f, t0, y0, T, n)

y = zeros(n,1);
y(1) = y0;
t(1) = t0;
h = (T-t0) / n;

for i = 1:n
    t(i+1) = t(i) + h;
    y(i+1) = y(i) + h * f(t(i),y(i));
end