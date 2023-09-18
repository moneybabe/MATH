function [i, aitken] = aitken_fp_iter(func, p0, max_iter, tol)

p1 = func(p0);
p2 = func(p1);
aitken0 = p0 - ((p1-p0)^2) / (p2 - 2*p1 + p0);
i = 2;

while i < max_iter
    p = func(p2);
    p0 = p1;
    p1 = p2;
    p2 = p;
    aitken = p0 - ((p1-p0)^2) / (p2 - 2*p1 + p0);
    i = i + 1;

    if abs(aitken -aitken0) < tol
        return
    end
    aitken0 = aitken;
end

error("Sequence fails to converge after %d iterations", i)
end