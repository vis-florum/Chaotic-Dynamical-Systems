clear all
clc

% Analyse the path of a seed during iteration of a function


%% Plot the development of the orbit for a function:
clear all
clc
% Intressant: Q_-2 mit seed 0.3
N = 4;
fifi = @(x) x.^2 -.1;
seed = 0.8;

[x,y] = orbitCoords(seed,N,fifi);

plotmax = max(abs([x,y]))*1.1;
plotmin = -plotmax;
%plotmax = max(coords)*1.1;
%plotmin = min(coords)*1.1;

for i = 1:1:length(x)
    % Orbit:
    plot(x(1:i),y(1:i))
    hold on
    title(['iter = ',num2str(floor(i/2))])
    % Function:
    fplot(fifi,[plotmin plotmax]*2)
    % Diagonal:
    fplot(@(x) x,[plotmin plotmax]*2,'Linewidth',2,'--')
    % Vertical:
    line([0 0],[plotmin plotmax],'Color','k')
    % Horizontal:
    horizl = refline(0);
    horizl.Color = 'k';
    % Seed Marker:
    plot(x(1),y(1),'o','MarkerSize',10)
    hold off
    
    xlim([plotmin plotmax])
    ylim([plotmin plotmax])
    %axis equal
    grid on
    
    pause(.2)
end

%% Plot orbits for different seeds sequentially for a function:
clear all
clc
N = 20;
fifi = @(x) x.^2 -.1;

plotmax = 1.5;
plotmin = -plotmax;

for seed = -1:.01:1
    
    [x,y] = orbitCoords(seed,N,fifi);
    
    % Orbit:
    plot(x,y)
    hold on
    title(['seed = ',num2str(seed)])
    % Function:
    fplot(fifi,[plotmin plotmax]*2)
    % Diagonal:
    fplot(@(x) x,[plotmin plotmax]*2,'Linewidth',2,'--')
    % Vertical:
    line([0 0],[plotmin plotmax],'Color','k')
    % Horizontal:
    horizl = refline(0);
    horizl.Color = 'k';
    % Seed Marker:
    plot(x(1),y(1),'o','MarkerSize',10)
    hold off
    
    xlim([plotmin plotmax])
    ylim([plotmin plotmax])
    %axis equal
    grid on
    
    pause(.02)
end


%% Plot orbits for different parameter sequentially
clear all
clc
N = 20;
seed = 0.1;

plotmax = 2;
plotmin = -plotmax;

for c = 2:-.01:-2
    
    %fifi = @(x) x.^2 + c;
    %fifi = @(x) x.^-c - 1;
    [x,y] = orbitCoords(seed,N,fifi);
    
    % Orbit:
    plot(x,y)
    hold on
    title(['c = ',num2str(c)])
    % Function:
    fplot(fifi,[plotmin plotmax]*2)
    % Diagonal:
    fplot(@(x) x,[plotmin plotmax]*2,'Linewidth',2,'--')
    % Vertical:
    line([0 0],[plotmin plotmax],'Color','k')
    % Horizontal:
    horizl = refline(0);
    horizl.Color = 'k';
    % Seed Marker:
    plot(x(1),y(1),'o','MarkerSize',10)
    hold off
    
    xlim([plotmin plotmax])
    ylim([plotmin plotmax])
    %axis equal
    grid on
    
    pause(.01)
end