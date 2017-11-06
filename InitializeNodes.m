function nodes = InitializeNodes( holder, size, step )
%INITIALIZENODES    Creates an array containing all nodes that will be analyzed
%   nodes = InitializeNodes( holder, size, step ) returns all the vertexes
%   that make the square grid centered in holder, each vertex separeted by
%   step and length size


%Starts with an empty array
nodes = [];

%Iteration to add each vertex
for i = holder(:,1)-size/2 : step : holder(:,1)+size/2
    for j = holder(:,2)-size/2 : step : holder(:,2)+size/2
        nodes = [nodes; [i j]];
    end
end

end

