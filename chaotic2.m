clear all
clc

%% Choose a chaos function
chaosfct = 'logistic';
%chaosfct = 'Q_c';           % The quadratic family
%chaosfct = @(x) x.^2 - 1;   % Can also define fct via function handle

%% Parameters
N = 40;     % Iterations

lambda = linspace(0,4,100);
%lambda = linspace(-.5,.5,100);
seed = linspace(0,1,10);
%seed = 0.1;
%lambda = 1

%% Populate the point array P
P = zeros(length(seed),length(lambda),N+1); % Initialise array

for l = 1:length(seed)

    for k = 1:length(lambda)
        % Get the orbit for the parameters:
        P(l,k,:) = orbit2(seed(l),N,chaosfct,lambda(k));
    end

end

%%
%Show all surface plots as a time series
for l = 1:length(seed)
   
    %show(:,:) = P(l,:,:);
    
    surf(show);
    
    pause(.5)
end
%%
% Condense all points and keep lambda to show a distribution of points:
for k = 1:length(lambda)
        s(:) = P(:,k,:);
        points(k,:) = s(:);
end

%plot(lambda,points(:,5:end),'.')
plot(lambda,points,'.')
xlabel('lambda')



% plot(show,'.')
% figure
% plot(P');
% figure
% plot(P)