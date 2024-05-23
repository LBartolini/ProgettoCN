function [If, err] = composita(fun, a, b, k, n)
%
% [If, err] = composita(fun, a, b, k, n)
%
% Function che calcola l'approssimazione dell'integrale
% ritornando errore di quadratura
%
% Input:
% fun: identificatore della function che calcoli la funzione integranda
% a, b: intervallo di integrazione
% k: grado formula di Newton-Cotes
% n: (n+1) ascisse equidistanti con n multiplo pari di k
%
% Output:
% If: approssimazione dell'integrale
% err: stima dell'errore di quadratura

% Controlli di consistenza
if k < 1
    error("Grado inserito errato");
end
if a > b
    error("Intervallo errato");
end
if mod(n/k, 2) ~= 0
    error("n deve essere un multiplo pari di k");
end

u=1;
if (mod(k,2) == 0)
    u=2;
end

c = pesiNewtonCotes(k);
x = linspace(a, b, (n+1)+(k-1)*n);
fx = feval(fun, x);
hf = (b-a)/((n+1)+(k-1)*n);
h = (b-a)/((n/2+1)+(k-1)*n/2);

I = 0;
for i=0:n/2-1
    tmp = (i*2*k:2:(i+1)*2*k)+1;
    I = I + h*sum(fx( tmp ).*c);
end

If = 0;
for i=0:n-1
    If = If + hf*sum(fx((i*k:(i+1)*k)+1).*c);
end

err = (If-I)/(2^(k+u) - 1);
return;
end