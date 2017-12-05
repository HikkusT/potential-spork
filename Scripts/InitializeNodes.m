function [nodeList, posHolder] = InitializeNodes( holder, side, step )
%INITIALIZENODES    Creates an array containing all nodes that will be analyzed
%   nodes = InitializeNodes( holder, size, step ) returns all the vertexes
%   that make the square grid centered in holder, each vertex separeted by
%   step and length size


%Starts with an empty array
nodeList = [];
posHolder = -1;
minDist = inf;

%Iteration to add each vertex
for i = holder(1)-side/2 : step : holder(1)+side/2
    for j = holder(2)-side/2 : step : holder(2)+side/2
        nodeList = [nodeList; [i j]];
        if hypot(i-holder(1), j-holder(2)) < minDist
            minDist = hypot(i-holder(1), j-holder(2));
            posHolder = size(nodeList,1);
        end
    end
end

end

