function flops = A_times_B(A, B, x)

flops = 0;
C = A;
for i = 1:size(A,1)
    for j = 1:size(A,2)
        foo = 0;
        for k = 1:size(A,2)
            foo = foo + A(i,k) * B(k,j);
            flops = flops + 2;
        end
        C(i,j) = foo;
    end
end

y = zeros(size(x));
for i = 1:size(C,1)
    for j = 1:size(x,1)
        y(i) = y(i) + C(i,j) * x(j);
        flops = flops + 2;
    end
end
end