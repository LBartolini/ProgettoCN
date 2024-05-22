function [x,flag] = newton( f, f1, x0, tolx, maxit )
%
% [x,flag] = newton( f, f1, x0, tolx , maxit )
%
% Metodo di Newton per determinare una approssimazione della radice di f(x)=0
%   Input:
%         f - identificatore della function della funzione
%        f1 - identicatore della function della derivata prima di f
%        x0 - punto di partenza
%      tolx - tolleranza accettata
%     maxit - numero massimo di iterazioni
%  Output:
%         x - approssimazione dello zero della funzione
%      flag - valore che indica il numero di iterazioni richieste per
%      trovare lo zero; vale -1 se la derivata si annulla o se la
%      tolleranza non è soddisfatta entro maxit iterazioni
%

if nargin<4
    error('numero argomenti insufficienti');
elseif nargin==4
    maxit = 100;
end

if tolx<eps
    error('tolleranza non idonea');
end

x = x0;
flag = -1;
for i = 1:maxit
    fx = feval( f, x );
    f1x = feval( f1, x );
    if f1x==0
        break
    end
    x = x - fx/f1x;
    if abs(x-x0)<=tolx*(1+abs(x0))
        flag = i;
        break
    else
        x0 = x;
    end
end
return