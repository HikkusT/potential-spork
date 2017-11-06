function [ players, holder, repulsores, closePlayers ] = Initialize( size, step )
%% Initialization


%Initializing Grid (Not really important)
[X,Y] = meshgrid(-50:50);

%Initializing field (Not really important)
field = [];
for i = -50:50;
    for j = -50:50;
        field = [field; [i j]];
    end
end

%Initializing players
playersFile = fopen('Configs/Players.txt', 'r');
players = fscanf(playersFile, '%d %d', [2 Inf]);
players = players';

%Initializing holder
holderFile = fopen('Configs/Holder.txt', 'r');
holder = fscanf(holderFile, '%d %d', [2 Inf]);
holder = holder';

%Initializing points of repulsion
repulsoresFile = fopen('Configs/Repulsores.txt', 'r');
repulsores = fscanf(repulsoresFile, '%d %d', [2 Inf]);
repulsores = repulsores';

%Calculating search area
xSearch = holder(:, 1) - size/2;
ySearch = holder(:, 2) - size/2;
searchPos = [xSearch ySearch size size];
[xSearchGrid,ySearchGrid] = meshgrid(xSearch:step:(xSearch+size), ySearch:step:(ySearch+size));

%Calculating Searchable players
closePlayers = [];
for i = 1:length(players)
    %Checking if player is inside search area
    if(CheckIfIsClose(players(i,:), holder(1, :), size))
        closePlayers = [closePlayers; players(i,:)];
    end
end
%

%% First Debug (Bem in�til agora, ignorar. Depois eu devo tirar do c�digo)
% %Visual Debug
% figure;
% hold on;
% %Plotting grid
% plot(X,Y, 'k', 'linewidth', 0.01);
% plot(Y,X, 'k', 'linewidth', 0.01);
% %Plotting field
% %plot(field(:, 1), field(:, 2), 'b.');
% %Plotting players
% plot(players(:, 1), players(:, 2), 'mo', 'MarkerFaceColor', 'm', 'MarkerSize', 10);
% %Plotting holder
% plot(holder(:, 1), holder(:, 2), 'bx', 'MarkerFaceColor', 'b', 'MarkerSize', 10);
% %Plotting points of repulsion
% plot(repulsores(:, 1), repulsores(:, 2), 'rs', 'MarkerFaceColor', 'r', 'MarkerSize', 10);
% axis ij;
% axis off;
%

%% Visualizing
figure;
hold on;

%Plotting field
rectangle('Position', [-54.5, -34, 109, 68], 'FaceColor', [0, 0.48, 0.04], 'EdgeColor', 'w', 'linewidth', 3);
rectangle('Position', [-54.5, -15, 15, 30], 'EdgeColor', 'w', 'linewidth', 3);
rectangle('Position', [39.5, -15, 15, 30], 'EdgeColor', 'w', 'linewidth', 3);
rectangle('Position', [-10, -10, 20, 20], 'EdgeColor', 'w', 'linewidth', 3, 'Curvature',[1 1]);
plot([0 0], [54.5 -54.5], 'w', 'linewidth', 3);

%Plotting players
plot(players(:, 1), players(:, 2), 'yo', 'MarkerFaceColor', 'y', 'MarkerSize', 10);

%Plotting holder
plot(holder(:, 1), holder(:, 2), 'bx', 'MarkerFaceColor', 'b', 'MarkerSize', 10);

%Plotting points of repulsion
plot(repulsores(:, 1), repulsores(:, 2), 'rs', 'MarkerFaceColor', 'r', 'MarkerSize', 10);

%Plotting search area
rectangle('Position', searchPos, 'EdgeColor', 'c', 'linewidth', 2);
p1 = plot(xSearchGrid,ySearchGrid, 'k');
p2 = plot(xSearchGrid',ySearchGrid', 'k');
for i = 1:length(p1) %Opacity of the grid
    p1(i).Color(4) = 0.3;
    p2(i).Color(4) = 0.3;
end

%Marking close players
plot(closePlayers(:, 1), closePlayers(:, 2), 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 4);

%Axis options
axis ij;
xlim([-54.5 54.5]);
ylim([-34 34]);
pbaspect([1.6 1 1])
%
end