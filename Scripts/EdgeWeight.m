function answer = EdgeWeight( vert1, vert2, repulsors )
%EdgeWeight():    Finds the edge weight between two vertices
%
% vert1: A pair (x,y) with the first vertex
% vert2: A pair (x,y) with the second vertex
% repulsors: A Col-Vector with all repulsors the acts in the edge
% ==answer: The double value of the edge weight

% Trapezoidal rule

% Simple repultion
%y1 = 1 + CostFunc(vert1, repulsors, 1, 1);
%y2 = 1 + CostFunc(vert2, repulsors, 1, 1);

% Strong repulsion
y1 = 1 + CostFunc(vert1, repulsors, 1, 1000);
y2 = 1 + CostFunc(vert2, repulsors, 1, 1000);

% Distance with repulsive potential influence
answer = (y1 + y2)*EuclidDist(vert1, vert2)/2;

% Classic euclidean distance
%answer = hypot(vert1(1)-vert2(1), vert1(2)-vert2(2));

end

function result = CostFunc(position, repulsors, degree, factor)
%CostFunc():    Calculates the Cost Function in a given 2D point
%
% position: A (x,y) pair with the position of interest
% repulsors: Colum-Vector with all repulsors acting on the position
% degree: The exponent of repulsion. Must be positive.
%         Default = 1.
% factor: A multiplicative factor of repulsion for scaling
%         Default = 1.
% ==result: A double value with the net repulsion on position

if nargin < 4
    factor = 1;
end

if nargin < 3 || degree <= 0
    degree = 1;
end

% Quantity of repulsors
len = length(repulsors);
result = 0;

for i = 1:len
    cost = Repulsion(position, repulsors(i,:), degree, factor);
    if isfinite(cost)
        result = result + cost;
    else
        result = Inf;
        break;
    end
end

end

function result = Repulsion(position, rep, degree, factor)
%Repulsion():   Calculates repulsion between two given points in a plane given
%               the repulsive parameters
%
% position: A (x,y) pair with the position to calculate repulsion
% rep: A (x,y) pair with the position of the repulsor
% degree: The exponent of repulsion. Must be positive.
%         Default = 1.
% factor: A multiplicative factor of repulsion for scaling
%         Default = 1.
% ==result: Double value with the value of repulsion function
%           Returns Inf if points are too close

if nargin < 4
    factor = 1;
end

if nargin < 3 || degree <= 0
    degree = 1;
end

% Precision epsilon for evaluating zeroed values
EPS = 1e-6;
% Euclidean distance between points
dist = EuclidDist(position,rep);

% Repulsion = A*(1/d)^B
if dist < EPS
    result = Inf;
else
    result = factor*power(1/dist, degree);
end
    
end

function result = EuclidDist(a, b)
% EuclidDist():   Calculates the euclidean distance between two points in a
%                 cartesian plane
%
% a: A (x,y) pair 
% b: A (x,y) pair
% ==result: Double value with classical euclidean distance between a and b

result = sqrt((a(1) - b(1))^2 + (a(2) - b(2))^2);   %Classic euclidian distance
    
end