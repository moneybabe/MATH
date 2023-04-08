function flops = B_times_x(A, B, x)

flops = 0;
y = zeros(size(x));
for i = 1:size(B,1)
    for j = 1:size(x,1)
        y(i) = y(i) + B(i,j) * x(j);
        flops = flops + 2;
    end
end

z = zeros(size(y));
for i = 1:size(A,1)
    for j = 1:size(y,1)
        z(i) = z(i) + A(i,j) * y(j);
        flops = flops + 2;
    end
end
end