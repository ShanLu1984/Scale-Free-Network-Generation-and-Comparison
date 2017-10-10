function A = BAModel(n,m0)

disp('Generating a Barabasi-Albert Graph...')
tic;

A = zeros(n,n);

for i=1:m0-1
    A(i,i+1)=1;
    A(i+1,i)=1;
end
A(m0,1)=1;
A(1,m0)=1;

for t = m0+1:n
    ba_step = t;
    Deg_temp = sum(A(1:t-1,:));
    
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
        while (A(t,node) >= 1)
            rd = rand(1);
           % node=0;
    
            for k = 1:size(P,2)
                if rd <= P(1,k)                  
                    node = k;
                break;
                end
            end
        end
        
        A(t,node) = A(t,node)+1;
        A(node,t) = A(t,node);
    end
    
end

toc;