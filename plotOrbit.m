function [] = plotOrbit(orbitfct,seed,N)
% Plot the orbit of a function for N iterations and
% plot the function
% plot the line y = x
% Use this for a graphical analysis

[x,y] = orbitCoords(seed,N,orbitfct);

plotmax = max(abs([x,y]))*1.1;
plotmin = -plotmax;
%plotmax = max(coords)*1.1;
%plotmin = min(coords)*1.1;

% Orbit:
plot(x,y)
hold on
title([func2str(orbitfct),', iter = ',num2str(N)])
% Function:
fplot(orbitfct,[plotmin plotmax]*2)
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

