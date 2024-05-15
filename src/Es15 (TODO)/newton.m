function [x, nit] = newton(fun, x0, tol, maxit)
% 
%   [x, nit] = newton(fun, x0, tol, maxit)
% 
% Metodo di newton per la risoluzione di sistemi di equazioni non lineari
%  
% Input:
%   fun: forma [f, jacobian] = fun(x) se il sistema da risolvere è f(x)=0
%   x0: vettore valori iniziali
%   tol: tolleranza
%   maxit: numero massimo di iterazioni
% 
% Output:
%   x: soluzione del sistema 
%   nit: numero di iterazioni eseguite
%
% Criterio d'arresto: |Xn+1 - Xn| <= tol * (1 + |Xn|)

% Controlli di consistenza
if tol <= 0
    error('Tolleranza non valida'); 
end   
if maxit <= 0
    error('Numero di iterazioni non valido');
end  
%Valori di default per i parametri in ingresso
if  nargin == 3
    tol = 1e-3; 
    maxit = 1000;
else if nargin == 4        
        maxit = 1000;
    end
end   
x = x0;
for i=1:maxit
    x0 = x;
    f, jacobian = feval(fun, x0);
    
    b = -f;
    A = jacobian;

    x = x0 + mialu(A, b); % Fattorizzazione e aggiornamento di xn+1

    % Controllo sul criterio di arresto
    if abs(x - x0) <= tol * (1 + abs(x0))        
        break; 
    end   
end   
nit = i;
if abs(x - x0) > tol * (1 + abs(x0))
    disp('Tolleranza non raggiunta');
end   
return
end