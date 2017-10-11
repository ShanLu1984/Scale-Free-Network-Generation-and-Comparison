function [A_MR] = MRModel(Deg)

disp('Generating a Molloy-Reed graph...')
tic;

num_node = length(Deg);

A_MR = zeros(num_node, num_node);

Open_connection = Deg';
sum_OC = sum(Open_connection);

while sum_OC > 0
    
    P = Open_connection/sum_OC;

    for j = 2:size(P,2)
        P(1,j) = P(1,j) + P(1,j-1);
    end

    rd1 = rand(1);
    rd2 = rand(1);

    if rd1 < rd2
        tgt1 = rd1;
        tgt2 = rd2;
    else
        tgt1 = rd2;
        tgt2 = rd1;
    end

    for i=1:size(P,2)
        if tgt1<=P(1,i)                  
            node1=i;
            break;
        end

    end
    for i=node1+1:size(P,2)
        if tgt2<=P(1,i)                  
            node2=i;
            break;
        end

    end

    iter_num=0;
    while (A_MR(node1,node2)>=1)
        
        iter_num=iter_num+1;
        
        if iter_num>1000
            break;
        end
        
        rd1=rand(1);
        rd2=rand(1);
        if rd1<rd2
            tgt1=rd1;
            tgt2=rd2;
        else
            tgt1=rd2;
            tgt2=rd1;
        end


        for i=1:size(P,2)
            if tgt1<=P(1,i)                  
                node1=i;
                break;
            end

        end
        for i=node1+1:size(P,2)
            if tgt2<=P(1,i)                  
                node2=i;
                break;
            end

        end

    end
    
    A_MR(node1,node2) = A_MR(node1,node2)+1;
    A_MR(node2,node1) = A_MR(node1,node2);
    
    Open_connection(node1) = Open_connection(node1)-1;
    Open_connection(node2) = Open_connection(node2)-1;
            
    sum_OC = sum(Open_connection);
end

A_MR = remove0nodes(A_MR);

toc;