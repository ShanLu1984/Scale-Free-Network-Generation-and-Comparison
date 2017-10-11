function [A_ModelB]= ModelB(Deg_t)

disp('Generating a Model B graph...')
tic;

Deg = Deg_t';

num_node=length(Deg);

A_ModelB=zeros(num_node, num_node);

Open_connection=Deg;
sum_OC=sum(Open_connection);


%Nodelabel is used to indicate whether this node is already in the upper
%layers
NodeLabel=zeros(size(Open_connection));

for i=1:length(NodeLabel)
    
    NodeLabel(i)=i;
    
end



while sum_OC>0

    
    CurrentNode=find(Open_connection==max(Open_connection));

    CurrentNode=CurrentNode(1);
    
    NodeLabel(NodeLabel==CurrentNode)=[];
        
    NodeDeg=Open_connection(CurrentNode);
    
    k=0;
        
    while(NodeDeg>0)
            
         k=k+1;
         
         if k>length(NodeLabel)
             
             Open_connection(CurrentNode)=0;
             break;
             
         end
         
         ConnectTo=NodeLabel(k);
         
         A_ModelB(CurrentNode,ConnectTo)=A_ModelB(CurrentNode,ConnectTo)+1;
         A_ModelB(ConnectTo,CurrentNode)=A_ModelB(ConnectTo,CurrentNode)+1;
         Open_connection(CurrentNode)=Open_connection(CurrentNode)-1;
         Open_connection(ConnectTo)=Open_connection(ConnectTo)-1;
         
         if Open_connection(ConnectTo)==0
             
             NodeLabel(NodeLabel==ConnectTo)=[];
             
             k=k-1;
         end
         
         NodeDeg=Open_connection(CurrentNode);
    end
    
    sum_OC=sum(Open_connection);
        
end

A_ModelB = remove0nodes(A_ModelB);

toc;