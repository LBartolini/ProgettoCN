function LDLt = mialdlt(A)
% 
%   LDLt = mialdlt(A)
% 
% Restituisce la fattorizzazione LDLt di A 
% 
% Input:
%   A: matrice n x n
% 
% Output:
%   LDLt: Matrice fattorizzata
% 
%Controlli di consistenza

[m, n] = size(A);

if m ~= n
    error("Matrice non quadrata");
end
% A simmetrica e definita positiva

if A(1, 1) <= 0
    error("La matrice non è sdp");
end

LDLt = A;
LDLt(2:n) = LDLt(2:n) / LDLt(1, 1);

for j=2:n
    v = LDLt(j, 1:j-1)'.*diag(LDLt(1:j-1, 1:j-1));
    LDLt(j,j) = LDLt(j,j) - LDLt(j, 1:j-1)*v;
    if LDLt(j, j) <= 0
        error("Matrice non sdp");
    end
    LDLt(j+1:n, j) = (LDLt(j+1:n, j) - LDLt(j+1:n, 1:j-1)*v)/LDLt(j,j);
end
return;
end 