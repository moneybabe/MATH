function index = max_entry(A, i)

if (i > size(A,2))
    error('i is out of bound')
end

n = size(A,1);
maxi = abs(A(i,i));
index = i;
count = i;

for k = A(i:n, i)'
    if (abs(k) > maxi)
        maxi = abs(k);
        index = count;
    end
    count = count + 1;
end

end