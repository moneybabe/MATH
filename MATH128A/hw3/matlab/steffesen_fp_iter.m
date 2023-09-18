function [i, p] = steffesen_fp_iter(func, p0, max_iter, tol)

i = 0;
while i < max_iter
    p1 = func(p0);
    p2 = func(p0);
    p = p0 - ((p1-p0)^2) / (p2 - 2*p1 + p0);
    i = i + 1;
    
    if abs(p - p0) < tol
        return
    end
    
    p0 = p;
end

% error("Sequence fails to converge after %d iterations", i)
end