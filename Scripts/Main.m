function Main

%% Variables
size = 30;
step = 0.5;
divisions = 1;      %Ignorar isso por enquanto. Seria o equivalente ao m.

%% Initializing
disp('Iniciando...')
[players, holder, repulsors, closePlayers] = Initialize(size, step);       %Gets all data and plot some visual debug

%% Calculating Distances
disp('Fazendo o dijkstra...')
[playersDistances playersPaths] = Dijkstra(closePlayers, repulsors, holder, size, step, divisions); %Uses Dijkstra to find the path for each player

%% Visualizing the results
disp('Printando os resultados...')
DrawUserInterface(playersPaths, closePlayers, repulsors, holder, size, step, divisions); %Uses the data output from the dijkistra to plot an interface
end

