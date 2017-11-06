function [ distances paths ] = Dijkstra( closePlayers, repulsors, holder, size, step, divisions )
%DIJKSTRA   Find the results from applying Dijkstra in the grid
%   [ distances paths ] = Dijkstra( closePlayers, holder, size, step,
%   divisions ) returns all the distances and paths to each closePlayers found by
%   applying Dijkistra in the grid


%TODO: OPTIMIZATIONS PLEASEEEEE

%Setting up vectors
nodes = InitializeNodes(holder, size, step);    %Creating the vector containg the nodes
distances = [];                                 %Vector that will return the distances
paths = [];                                     %Vector that will return the paths
paths = zeros(length(closePlayers), length(nodes)); %Allocating the space fot the paths vector

%Applying Dijkstra to each player in closePlayers
for i = 1:length(closePlayers)
    [distances(i) path] = FindPath(closePlayers(i, :), repulsors, holder, nodes, step, divisions); %ISSO � BURRO. MUDAR ISSO.
    paths(i, 1:length(path)) = path;
end

end


%%Dijkstra algorithm
function [targetDistance targetPath] = FindPath(start, repulsors, target, nodes, step, divisions)

%Setting up the Dijkstra 
dist = Inf(length(nodes), 1);
dist(:,2) = false;
prev = zeros(length(nodes), 1);


dist(Find2D(start, nodes), 1) = 0;         %Setting the initial distance to 0. Note that dist is used like a map
targetIndex = Find2D(target, nodes);

while dist(targetIndex, 2) == false
    %Finding the node with minimum distance
    minDist = Inf;
    currentNode = -1;
    
    for i = 1:length(dist)
        if dist(i,1) < minDist && dist(i, 2) == false
            currentNode = i;
            minDist = dist(i,1);
        end
    end
    
    if currentNode == -1
        
    end
    
    dist(currentNode, 2) = true;        %Mark as visited
    
    if nodes(currentNode)==target       %Check if it is the target (change to currentNode == targetIndex)
        break
    end
    
    %Calculate the distance for every neighbor
    neighbors = GetNeighbors(currentNode, nodes, step, divisions);
    for i = 1:length(neighbors)
        distance = dist(currentNode) + EdgeWeight(nodes(currentNode, :), nodes(neighbors(i), :), repulsors);
        if distance < dist(neighbors(i))
            dist(neighbors(i)) = distance;
            prev(neighbors(i)) = currentNode;
        end
    end
end

%Setting what the distance and path that the function returns
targetDistance = dist(targetIndex);
targetPath = [targetIndex];
while targetPath(length(targetPath)) ~= 0
    targetPath = [targetPath prev(targetPath(length(targetPath)))];
end

end