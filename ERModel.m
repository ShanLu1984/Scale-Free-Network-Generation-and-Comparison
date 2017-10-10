function A = ERModel(n,mean_deg)

disp('Generating a Erdos-Renyi graph...')
tic;

p = mean_deg/n;
A=zeros(n,n);

for i=1:n
    for j=i+1:n
        rd=rand(1);
        if rd<=p
            A(i,j)=1;
            A(j,i)=1;
        end
    end
end

toc;