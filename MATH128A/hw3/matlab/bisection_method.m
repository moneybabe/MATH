function root = bisection_method(a, b, tol, f)
    % Check if the provided interval [a, b] is valid
    if f(a)*f(b) > 0
        error('f(a) and f(b) should have opposite signs.');
    end
    
    % Initial midpoint
    c = (a + b) / 2;
    
    while abs((b - a)/2) > tol
        if f(a)*f(c) < 0
            b = c;
        else
            a = c;
        end
        c = (a + b) / 2;
    end
    
    root = c;
end
