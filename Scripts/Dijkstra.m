function [ distances paths ] = Dijkstra( closePlayers, repulsors, holder, size, step, divisions )
%DIJKSTRA   Find the results from applying Dijkstra in the grid
%   [ distances paths ] = Dijkstra( closePlayers, holder, size, step,
%   divisions ) returns all the distances and paths to each closePlayers found by
%   applying Dijkistra in the grid


%Setting up vectors
[nodes, holderPos] = InitializeNodes(holder, size, step);    % Creating the vector containg the nodes
magnetizedMates = MagnetizePlayers( closePlayers, nodes);      % Assigning close Players to graph nodes


%Applying Dijkstra starting from holder
[distances paths] = FindPaths(holderPos, repulsors, magnetizedMates, nodes, step, divisions);

end


%%Dijkstra algorithm
function [distances paths] = FindPaths(start, repulsors, targets, nodes, step, divisions)

    %Setting up the Dijkstra 
    dist = Inf(length(nodes), 1);
    dist(:,2) = false;
    prev = zeros(length(nodes), 1);

    dist(start,1) = 0;                  %Setting the initial distance to itself as 0. Note that dist is used like a map
    targetIndex = start;
    targetsComputed = 0;

    while true
        %Finding the node with minimum distance
        minDist = Inf;
        currentNode = -1;

        for i = 1:size(dist,1)
            if dist(i,1) < minDist && dist(i, 2) == false
                currentNode = i;
                minDist = dist(i,1);
            end
        end
        
        if currentNode == -1
            break;
        end
        
        dist(currentNode, 2) = true;        %Mark as visited

        for i = 1:length(targets)
            if currentNode == targets(i)
                targetsComputed = targetsComputed+1;
                break;
            end
        end

        if targetsComputed == length(targets)
            break;
        end

        %Calculate the distance for every neighboor
        neighboors = GetNeighbors(currentNode, nodes, step, divisions);
        for i = 1:length(neighboors)
            distance = dist(currentNode) + EdgeWeight(nodes(currentNode, :), nodes(neighboors(i), :), repulsors);
            if distance < dist(neighboors(i))
                dist(neighboors(i)) = distance;
                prev(neighboors(i)) = currentNode;
            end
        end
    end

    %Setting what the distance and path that the function returns
    distances = [];
    paths = {};
    for i = 1:length(targets)
        distances(i) = dist(targets(i),1);
        
        paths{i} = [targets(i)];
        it = length(paths{i});
        while paths{i}(it) ~= 0
            paths{i} = [ paths{i}, prev(paths{i}(it)) ];
            it = length(paths{i});
        end
    end

end