function p = fp_iter(func, p0, max_iter, tol)

i = 0;
while i < max_iter
    p = func(p0);

    if abs(p - p0) < tol
        return
    end

    p0 = p;
    i = i + 1;
end

error("Sequence fails to converge after %d iterations", i)
end