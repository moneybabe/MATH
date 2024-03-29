function x = Gauss_solve(A,b)

if (size(A,1) ~= size(A,2))
    error('A is not square')
end

if (size(A,2) ~= size(b,1))
    error("A and b dimensions don't match")
end

n = size(A,1);
L = eye(n);

for i = 1:n

    index = max_entry(A,i);
    A = swap(A, i, index);
    b = swap(b, i, index);

    if A(i,i) == 0
        error('A is not invertible')
    end

    for j = i+1 : n
    L(j,i) = A(j,i)/A(i,i);

        for k = i+1: n
        A(j,k) = A(j,k) - L(j,i)*A(i,k);
        end

    A(j,i) = 0;
    b(j) = b(j) - L(j,i)*b(i);
    end
end

% this is the function you'll write in HW2
% that solves upper triangular systems
x = solve_upper_tri(A,b);
end