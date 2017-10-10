function [ lambda alpha ] = coef_computing(A,B)

Deg = sum(A,2);

DM = diag(sum(A,1));

L = DM^(-1/2) * (DM - A) * DM^(-1/2);

Bd = sort(B,'descend');

sb = size(Bd,1);

for j = 1:sb
   i = Bd(j);
   Deg(i) = [];
   L(i,:) = [];
   L(:,i) = [];
end

[vec value] = eig(L);

sn = size(vec,1);
e_vec = vec;

lambda = sum(value,1);

alpha = zeros(sn,1);
for j = 1:sn
    temp = vec(:,j);
    alpha(j) = sum(temp)^2;
end

end

