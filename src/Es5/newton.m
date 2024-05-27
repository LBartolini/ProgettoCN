function [x, i] = newton(fun, deriv, x0, tolx, maxiter)
%
% [x, i] = newton( fun, deriv, x0, tolx , maxiter )
%
% Metodo di Newton per determinare una approssimazione della radice di f(x)=0
%   Input:
%        fun - funzione in input
%        deriv - derivata della funzione fun in input
%        x0 - punto iniziale
%      tolx - tolleranza
%     maxiter - numero massimo di iterazioni
%
%  Output:
%         x - approssimazione dello zero della funzione
%      i - valore che indica il numero di iterazioni richieste per
%      trovare lo zero; vale -1 se la derivata si annulla o se la
%      tolleranza non è soddisfatta entro maxit iterazioni
%

x=x0;
j = -1;
for i=1:maxiter
    f1x = feval(deriv, x0);
    if f1x == 0
        break
    end
    x = x0 - feval(fun, x0)/f1x;
    err = abs(x-x0);
    if err <= tolx
        j=i;
        break
    end
    x0 = x;
end

i=j;
return;

end