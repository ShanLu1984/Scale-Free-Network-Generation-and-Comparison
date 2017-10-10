function B = Boundary(percent,A)

Deg = sum(A,2);

sn = size(A,1);
sb = round(percent * sn);

%sb = percent * sn;
B = zeros(sb,1);

BigNum=10;
degtemp = max(Deg)+BigNum;

for i = 1:sb
    mintemp = find(Deg == min(Deg));
    rdi = randi(size(mintemp,1));
    B(i) = mintemp(rdi);
    Deg(mintemp(rdi)) = degtemp;
end