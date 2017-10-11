function [A_Klsky]= KaliskyModel(Deg_t)

disp('Generating a Kalisky graph...')
tic;

Deg = Deg_t';

num_node = length(Deg);
A_Klsky = zeros(num_node, num_node);

Open_connection = Deg;

temp = find(Open_connection == max(Open_connection));
CurrentLayer = temp(1);
nextLayer = CurrentLayer;

currentLayerOC = Open_connection(CurrentLayer);

numOC = sum(Open_connection);
while numOC ~= 0
    
    flagOut = 0;
    tempOut = randi(sum(currentLayerOC));
    for i = 1:length(currentLayerOC)
        flagOut = flagOut + currentLayerOC(i);
        if tempOut <= flagOut
            outNodeNum = i;
            break;
        end
    end
    outNode = CurrentLayer(outNodeNum);
    
    restOC = Open_connection;
    restOC(outNode) = 0;
    
    if sum(restOC) == 0
        break;
    end
    
    flagIn = 0;
    tempIn = randi(sum(restOC));
    for j = 1:length(restOC)
        flagIn = flagIn + restOC(j);
        if tempIn <= flagIn
            inNode = j;
            break;
        end
    end
    
    if A_Klsky(outNode,inNode) == 0
        A_Klsky(outNode,inNode) = 1;
        A_Klsky(inNode,outNode) = 1;
        Open_connection(outNode) = Open_connection(outNode) - 1;
        Open_connection(inNode) = Open_connection(inNode) - 1;
        currentLayerOC(outNodeNum) = currentLayerOC(outNodeNum) - 1;
        
        if Open_connection(outNode) ~= currentLayerOC(outNodeNum)
            break;
        end
        
        if ~any(nextLayer == inNode)
            nextLayer = [nextLayer, inNode];
        else
            currentLayerOC(CurrentLayer == inNode) = currentLayerOC(CurrentLayer == inNode) - 1;
        end
    end
    
    if sum(currentLayerOC) == 0
        CurrentLayer = nextLayer;
        currentLayerOC = Open_connection(CurrentLayer);
    end
    
    numOC = sum(Open_connection);
end

A_Klsky = remove0nodes(A_Klsky);

toc;