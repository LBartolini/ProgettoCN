function [x, i] = secanti(fun, x0, x1, tolx, maxiter)
%
%   [x,i]=secanti(fun,x0,x1,tol,itmax) restituisce una approssimazione 
%       dello zero della funzione con il metodo delle secanti
%   Input:
%           fun - funzione
%         x0,x1 - punti iniziali
%           tol - tolleranza
%         itmax - numero massimo di iterazioni
%   Output:
%           x - approssimazione dello zero della funzione
%           i - numero iterazioni necessarie

fx0 = feval(fun, x0);
fx1 = feval(fun, x1);
for i=1:maxiter
    x = x1 - ((x0-x1)*fx1)/(fx0-fx1);
    err = abs(x-x1);
    if abs(err)<= tolx
        return
    end
    x0=x1;
    fx0=fx1;
    x1=x;
    fx1=feval(fun, x1);
end
end