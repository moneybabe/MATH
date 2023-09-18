function [i, p] = secant_iter(func, p0, p1, max_iter, tol)

i = 0;

while i < max_iter
    p = p1 - func(p1) * (p1 - p0) / (func(p1) - func(p0));

    if abs(p - p1) < tol
        return
    end

    p0 = p1;
    p1 = p;
    i = i + 1;
end

error("Sequence fails to converge after %d iterations", i)
end

