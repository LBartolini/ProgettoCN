function [x, nit] = newton(fun, x0, tol, maxit)
%
%   [x, nit] = newton(fun, x0, tol, maxit)
%
%   Risolve sistemi non lineare di equazioni con il metodo di Newton.
%
%   Input:
%   fun- funzione data, nella forma [f, Jacobian]
%   x0- ascisse iniziali
%   tol- tolleranza desiderata
%   maxit- massimo numero di iterazioni
%
%   Output:
%   x- soluzioni
%   nit- iterazioni svolte
%

% Controlli di consistenza
if nargin < 2 
    error('Numero di input errato');
elseif nargin==2
    tol=1e-3;
    maxit=1000;
elseif nargin==3
    maxit=1000;
end

if tol<0
    error('tol non può essere negativa');
elseif maxit<=0
    error('maxit non può essere negativo');
end

x = x0;
for nit = 1:maxit
    x0 = x;
    [f, jac] = feval(fun, x0);
    b = -f;
    A = jac;
    x = x0 + LU(A,b);
    if norm(x - x0, 1) <= tol * (1 + norm(x0, 1))
        break
    end
end

if norm(x - x0, 1) > tol * (1 + norm(x0, 1))
    disp('Tolleranza non raggiunta');
end

return;
end