function [Z] = F(t, Y)

Z = zeros(2,1);
Z(1) = 3*Y(1) + 5*Y(2);
Z(2) = -2*Y(1) - 8*Y(2);

end