function y = f(x)

numerator = sin(3*x) + 3*exp(-2*x)*sin(x) - 3*exp(-x)*sin(2*x) - exp(-3*x);

denominator = 3*exp(-3*x)*(exp(3*x)*cos(3*x) + exp(2*x)*sin(2*x) - ...
    2*exp(2*x)*cos(2*x) - 2*exp(x)*sin(x) + exp(x)*cos(x) + 1);

y = x - numerator / denominator;

end

