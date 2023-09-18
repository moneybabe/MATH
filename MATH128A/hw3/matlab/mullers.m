function p = mullers(p0, p1, p2, tol, max_iter, f)
h1 = p1 - p0;
h2 = p2 - p1;
del1 = (f(p1) - f(p0)) / h1;
del2 = (f(p2) - f(p1)) / h2;
d = (del2 - del1) / (h2 + h1);
i = 3;
while i < max_iter
    b = del2 + h2 * d;
    D = (b^2 - 4*f(p2)*d)^(1/2);

    if abs(b - D) < abs(b + D)
        E = b + D;
    else
        E = b - D;
    end

    h = -2*f(p2) / E;
    p = p2 + h;

    if abs(h) < tol
        return
    end

    p0 = p1;
    p1 = p2;
    p2 = p;
    h1 = p1 - p0;
    h2 = p2 - p1;
    del1 = (f(p1) - f(p0)) / h1;
    del2 = (f(p2) - f(p1)) / h2;
    d = (del2 - del1) / (h2 + h1);
    i = i + 1;
end
error("Sequence fails to converge after %d iterations", i)
end

