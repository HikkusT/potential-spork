function DrawUserInterface( paths, closePlayers, repulsors, holder, size, step, divisions )
%DRAWUSERINTERFACE  Plots the data we found so that we can visualize the
%results

%Creating the vector containg the nodes
nodes = InitializeNodes(holder, size, step);

%%Plotting!!!
figure
hold on

%Plotting the grid 
for i=1:length(nodes)
    neighbors = GetNeighbors(i, nodes, step, divisions);
    plot([repelem(nodes(i, 1), length(neighbors))' nodes(neighbors,1)]', [repelem(nodes(i, 2), length(neighbors))' nodes(neighbors,2)]', 'k');
end

%Plotting the path
for i = 1:length(closePlayers)
    for j = 1: length(paths)
        if paths(i, j+1)~= 0                        %Check if we reached the target
            currentPos = nodes(paths(i, j), :);     %Get the position of the current node in path
            nextPos = nodes(paths(i, j+1), :);      %Get the position of the next node in path
            plot([currentPos(1) nextPos(1)], [currentPos(2) nextPos(2)], 'c', 'linewidth', 3); %Plot a line between them
        else
            break
        end
    end
end

%Plotting players
plot(closePlayers(:, 1), closePlayers(:, 2), 'ro', 'MarkerFaceColor', 'y', 'MarkerSize', 10);

closeRepulsors = [];

%Selecting opponents inside plot area
for i = 1:length(repulsors)
    if CheckIfIsClose( repulsors(i,:), holder, size)
        closeRepulsors = [ closeRepulsors; repulsors(i,:) ];
    end
end

%Plotting close opponents
plot(closeRepulsors(:, 1), closeRepulsors(:, 2), 'rs', 'MarkerFaceColor', 'r', 'MarkerSize', 10);

%Plotting holder
plot(holder(:, 1), holder(:, 2), 'bx', 'MarkerFaceColor', 'b', 'MarkerSize', 10);

%Inverting the axis
axis ij

end
