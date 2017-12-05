function [ magnetized ] = MagnetizePlayers(players, nodes)

magnetized = [];
for i = 1:length(players)
    bestDist = inf;
    pos = 0;
    for j = 1:length(nodes)
        dist = hypot(players(i,1)-nodes(j,1), players(i,2)-nodes(j,2));
        if dist < bestDist
            bestDist = dist;
            pos = j;
        end
    end
    magnetized = [magnetized; pos];
end

end