function [x, i] = newtonModificato(fun, deriv, x0, molt, tolx, maxiter)
    for i=1:maxiter
        deriv_x0 = feval(deriv,x0);

         if deriv_x0==0
            break
         end

        x = x0 - molt*(feval(fun, x0)/deriv_x0);
        err = abs(x-x0);
        if err <= tolx
            return
        end
        x0 = x;
    end
return