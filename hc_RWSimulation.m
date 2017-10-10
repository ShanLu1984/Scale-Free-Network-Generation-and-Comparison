function [ hc_sim ] = hc_RWSimulation(A,B,step_t,lazy_value,initial_quantity,color)

% A is the adjacency matrix of the graph.
% b_percent is the percent of boundary nodes, in our experiment we use 0.04. 
% step_t is the number of steps for the random walk simulation
% lazy_value is the probability that a random walker move out ( <= 1 ) in lazy random walk.
% initial_quantity is how many random walkers are generated per node initially.

% hc is the simulation result of heat content before normalization.

% Calculate the random walk matrix
sA = size(A,1);
P = zeros(sA,sA);
for i = 1:sA
    P(i,:) = A(i,:) / sum(A(i,:));
end

Degree = sum(A,1);

% initialization of the random walk
% no random walker on the boundary nodes
step=step_t*1 / lazy_value;

ini_dist = ones(1,sA);
sb = length(B);
if B(1,1) ~= 0
    for i = 1:sb
        ib = B(i);
        ini_dist(ib) = 0;
    end
end

ini_dist = ini_dist .* initial_quantity;

hc_sim = zeros(step+1,1);
hc_sim(1) = sum(ini_dist);

% rnd_wal is a matrix contains all the information of the random walkers in 
% simulation, rnd_wal(x,1) is a label, rnd_wal(x,2) is the initial node of random walker x,
% rnd_wal(x,3) is the current node of random walker x

rnd_wal = zeros(sum(ini_dist),3);

x = 1;
for i = 1:sA
    if ini_dist(i) ~= 0
        for j = 1:ini_dist(i)
            rnd_wal(x,1) = 1;
            rnd_wal(x,2) = i;
            rnd_wal(x,3) = i;
            x = x + 1;
        end
    end
end

rnd_wal_size = size(rnd_wal,1);

for i = 1:step
    
    next_hc = hc_sim(i);
    
    for j = 1:rnd_wal_size
        
        flag = rnd_wal(j,1); 
        
        if(flag == 1)
            if (rand < lazy_value)
                
                begin_node = rnd_wal(j,3);
                m = rnd_wal(j,2);
                n = rnd_wal(j,3);
                
                delta_minus = 1 * sqrt(Degree(m)/Degree(n));
                next_hc = next_hc - delta_minus;
                
                temp = rand;
                sumtemp = P(begin_node,1);
                x = 1;
                
                %find the target node the random walker go in next step
                while(temp > sumtemp)
                    x = x + 1;
                    sumtemp = sumtemp + P(begin_node,x);
                end
                if all(B-x) == 1 
                    delta_plus = 1 * sqrt(Degree(m)/Degree(x));
                    next_hc = next_hc + delta_plus;
                    
                    rnd_wal(j,3) = x;
                else
                    % the random walker is labelled to be 0 when it reaches
                    % the boundary
                    rnd_wal(j,1) = 0;
                end
            end
        end
        
    hc_sim(i+1) = next_hc;
    end
    
end
hc_sim=hc_sim./hc_sim(1);

t=0:lazy_value:step_t;
plot(t,hc_sim,color,’LineWidth',1);
