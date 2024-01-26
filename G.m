function [Z] = G(t, Y)

Z = zeros(2,1);
Z(1) = 2*Y(1);
Z(2) = Y(2);

end