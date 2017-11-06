function index = Find2D(element, list)
%FIND2D     Searches the nx2 matrix for a 1x2 element(ordered pair)
%   index = Find2D(element, list) returns the index(the row) in which you
%   can find element in list
%TODO: Improve the script, as it is really inefficient atm
%TODO: Stop using find. Beware of equality with floats


firstElement = find(list(:,1) == element(1));       %Get every index where the first column matches the first column of element
secondElement = find(list(:,2) == element(2));      %Get every index where the second column matches the second column of element

index = intersect(firstElement, secondElement);     %Get the index from the two sets
end

