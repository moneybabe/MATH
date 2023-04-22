function B = swap(A, i, j)

if (i > size(A,1) || j > size(A,1))
    error('index out of bound')
end

B = A;
B(i,:) = A(j,:);
B(j,:) = A(i,:);

end