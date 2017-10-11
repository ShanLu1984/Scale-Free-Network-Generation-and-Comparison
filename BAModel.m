function A_ba = BAModel(n,m0)

disp('Generating a Barabasi-Albert Graph...')
tic;

A_ba = zeros(n,n);

for i=1:m0-1
    A_ba(i,i+1)=1;
    A_ba(i+1,i)=1;
end
A_ba(m0,1)=1;
A_ba(1,m0)=1;

for t = m0+1:n
    ba_step = t;
    Deg_temp = sum(A_ba(1:t-1,:));
    
    P = Deg_temp./sum(Deg_temp);
    
    for j = 2:size(P,2)
        P(1,j) = P(1,j)+P(1,j-1);
    end
    
    
    for m = 1:m0
        rd = rand(1);
        node = 0;
    
        for k = 1:size(P,2)
            if rd <= P(1,k)                  
            node = k;
            break;
            end
        end
        while (A_ba(t,node) >= 1)
            rd = rand(1);
           % node=0;
    
            for k = 1:size(P,2)
                if rd <= P(1,k)                  
                    node = k;
                break;
                end
            end
        end
        
        A_ba(t,node) = A_ba(t,node)+1;
        A_ba(node,t) = A_ba(t,node);
    end
    
end

toc;
