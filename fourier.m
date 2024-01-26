
T = 2*pi;
n = 100;

f = @(x) cos(x)^2;

for k = 1:n
    x(k) = (k-1)*T/n;
end

for k = 1:n
    F(k) = f(x(k));
end

gama1 = fft(F)/n;

Omega = ones(n,n);

w = exp(j*2*pi/n);
for i = 2:n
    for l = 2:n
        Omega(i,l) = w^((i-1)*(l-1));
    end
end

if mod(n,2) == 0
    m = n/2;
    for k = 1:m
        a1(k) = 2*real(gama1(k));
        a1(m+1) = gama1(m+1);
        b1(k) = -2*imag(gama1(k));
        b1(m) = 0;
    end
else m = (n-1)/2;
    for k = 1:m
        a1(k) = 2*real(gama1(k));
        b1(k) = -2*imag(gama1(k));
    end
    a1(m+1) = 2*real(gama1(m+1));
end

for k = 1:n
    suma = 0;
    for j = 1:m
        suma = suma + a1(j+1)*cos(j*x(k)*2*pi/T) + b1(j)*sin(j*x(k)*2*pi/T);
    end
    Phi1(k) = (a1(1)/2) + suma;
end

plot(x,F,'r.');
hold on;
plot(x,Phi1,'g');