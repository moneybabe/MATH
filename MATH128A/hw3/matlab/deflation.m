function b = deflation(a, x0)

b = zeros(1, length(a) - 1);
b(1) = a(1);

for i = 2:length(a)-1
    b(i) = a(i) + b(i-1)*x0;
end

end

