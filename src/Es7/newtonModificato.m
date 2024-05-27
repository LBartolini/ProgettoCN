function [x, i] = newtonModificato(fun, deriv, x0, molt, tolx, maxiter)
%
% [x, i] = newton( fun, deriv, x0, molt, tolx , maxiter )
%
% Metodo di Newton per determinare una approssimazione della radice di f(x)=0
%   Input:
%        fun - funzione in input
%        deriv - derivata della funzione fun in input
%        x0 - punto iniziale
%       molt - molteplicita' della radice
%      tolx - tolleranza
%     maxiter - numero massimo di iterazioni
%
%  Output:
%         x - approssimazione dello zero della funzione
%      i - valore che indica il numero di iterazioni richieste per
%      trovare lo zero; vale -1 se la derivata si annulla o se la
%      tolleranza non è soddisfatta entro maxit iterazioni
%
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