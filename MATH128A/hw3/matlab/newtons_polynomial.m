function g = newtons_polynomial(coeff)

n = length(coeff) - 1;
deriv_coeff = zeros(1, n);

for i = 1:n
    deriv_coeff(i) = (n-i+1)*coeff(i);
end

g = @(x) x - polyval(coeff, x) / polyval(deriv_coeff, x);
end

