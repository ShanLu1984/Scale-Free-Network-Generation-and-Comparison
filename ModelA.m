function [A_ModelA]= ModelA(Deg_t)

disp('Generating a Model-A graph...')
tic;

Deg = Deg_t';
num_node = length(Deg);

%Deg=sum(A,1);

A_ModelA = zeros(num_node, num_node);

Open_connection = Deg;
sum_OC = sum(Open_connection);


%Nodelabel is used to indicate whether this node is already in the upper
%layers
NodeLabel = 1:size(Open_connection,2);

while sum_OC > 0

    CurrentNode_temp = find(Open_connection == max(Open_connection));
    CurrentNode = CurrentNode_temp(1);
    NodeLabel(NodeLabel == CurrentNode) = [];
    NodeDeg = Open_connection(CurrentNode);
        
    while(NodeDeg > 0)
        
         if isempty(NodeLabel)
             Open_connection = zeros(size(Open_connection));
             break;
         end
            
         num_node = length(NodeLabel);
         rnd = randi(num_node);
         ConnectTo = NodeLabel(rnd);
 
         while (A_ModelA(CurrentNode,ConnectTo)>0)
             rnd = randi(num_node);
             ConnectTo = NodeLabel(rnd);
         end
         
         A_ModelA(CurrentNode,ConnectTo) = A_ModelA(CurrentNode,ConnectTo)+1;
         A_ModelA(ConnectTo,CurrentNode) = A_ModelA(ConnectTo,CurrentNode)+1;
         Open_connection(CurrentNode) = Open_connection(CurrentNode)-1;
         Open_connection(ConnectTo) = Open_connection(ConnectTo)-1;
         
         if Open_connection(ConnectTo) == 0
             
             NodeLabel(NodeLabel==ConnectTo)=[];
         end
         
         NodeDeg = Open_connection(CurrentNode);
    end
    
    sum_OC=sum(Open_connection);
        
end
        
A_ModelA = remove0nodes(A_ModelA);

toc;