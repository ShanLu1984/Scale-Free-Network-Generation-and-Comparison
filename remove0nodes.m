function A = remove0nodes(A)

n = size(A, 1);
D = sum(A);
rows2remove = D == 0;
cols2remove = D == 0;
A(rows2remove,:)=[];
A(:,cols2remove)=[];