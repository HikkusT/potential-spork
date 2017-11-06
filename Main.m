function Main

%% Variables
size = 30;
step = 0.5;
divisions = 1;      %Ignorar isso por enquanto. Seria o equivalente ao m.

%% Initializing
[players, holder, repulsores, closePlayers] = Initialize(size, step);       %Gets all data and plot some visual debug

%% Calculating Distances
[playersDistances playersPaths] = Dijkstra(closePlayers, holder, size, step, divisions); %Uses Dijkstra to find the path for each player

%% Visualizing the results
DrawUserInterface(playersPaths, closePlayers, holder, size, step, divisions); %Uses the data output from the dijkistra to plot an interface
end

