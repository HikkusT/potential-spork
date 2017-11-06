function answer = Distance( position1, position2 )
%DISTANCE   Finds the distance between two points
%   answer = Distance( position1, position2 ) returns the distance between
%   the two coordinates position1 and position2
%Not sure why matlab doesnt have this implemented


answer = sqrt((position1(1) - position2(1))^2 + (position1(2) - position2(2))^2);   %Classic euclidian distance
end

