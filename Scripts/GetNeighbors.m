function neighboorsIndex = GetNeighbors(currentNode, nodes, step, divisions)
%GETNEIGHBORS Gets the index of all neighbors in the grid of a vertex
%   neighborsIndex = GetNeighbors(currentNode, nodes, step, divisions)
%   returns all the indexes of neighbors of the currentNode, given that the
%   list of nodes is nodes, each separated by step

%TODO: Script can easily be improved

node = nodes(currentNode, :);   %Getting the position of the currentNode

%Creating the vector containing the directions we can find neighbors
dirs = [];
for i = -1:1/divisions:1
    for j = -1:1/divisions:1
        dir = [i*step j*step];
        dirs = [dirs; dir];
    end
end

%Getting the actual neighbors using the position of currentNode and the
%directions
neighboors = [];
for i = 1:length(dirs)
    neighboor = [node(1) + dirs(i, 1), node(2) + dirs(i, 2)];
    if (ismember(neighboor, nodes, 'rows'))    %F�cil de otimizar, usar infBound<value<supBound
        neighboors = [neighboors; neighboor];
    end
end

%Returning to index form
for i = 1:length(neighboors)
    neighboorsIndex(i)=Find2D(neighboors(i, :), nodes);
end

end
