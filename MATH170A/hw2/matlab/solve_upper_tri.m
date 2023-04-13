function x = solve_upper_tri(U,b)

x = b;
n = size(b,1);

x(end) = b(end) / U(end, end);

for i = (n-1):-1:1
    for k = n:-1:(i+1)
        x(i) = x(i) - x(k) * U(i, k);
    end
    
    x(i) = x(i) / U(i,i);
end

end