function isClose = CheckIfIsClose(player, holder, size)
%isClose():    Check if the player is in the search area
%
% player:   Pair (x,y) with position of player queried
% holder:   Pair (x,y) with position of ball holder
% size:   Pair (x,y) with size of square region of interest
% ==isClose:   True if the player is inside square of side size centered in holder

isClose = false;
if ( player(1)< (holder(1) + size/2) ...
     && player(1) > (holder(1)-size/2) ...
     && player(2)< (holder(2) + size/2) ...
     && player(2)> (holder(2)-size/2)  )
    isClose = true;
end

end
