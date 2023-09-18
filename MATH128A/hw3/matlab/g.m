function y = g(x)

numerator = x^4 - 2*x^3 - 12*x^2 + 16*x - 40;

denominator = 4*x^3 - 6*x^2 - 24*x + 16;

y = x - numerator / denominator;

end

