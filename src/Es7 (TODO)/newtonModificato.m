function [x, i] = newtonModificato(fun, deriv, x0, tolx, maxiter)
    for i=1:maxiter
        x = x0 - feval(fun, x0)/feval(deriv, x0);
        err = abs(x-x0);
        if err <= tolx
            return
            
            
        end
        x0 = x;
    end
end