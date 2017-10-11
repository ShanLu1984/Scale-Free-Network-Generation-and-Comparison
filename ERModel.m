function A_er = ERModel(n,mean_deg)

disp('Generating a Erdos-Renyi graph...')
tic;

p = mean_deg/n;
A_er=zeros(n,n);

for i=1:n
    for j=i+1:n
        rd=rand(1);
        if rd<=p
            A_er(i,j)=1;
            A_er(j,i)=1;
        end
    end
end

% Remove isolate nodes;
A_er = remove0nodes(A_er);

toc;
