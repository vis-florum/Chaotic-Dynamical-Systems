% Playing with some visualisations of chaotic functions

clear all
clc

%% Choose a chaos function
chaosfct = 'logistic';
%chaosfct = 'Q_c';           % The quadratic family
%chaosfct = @(x) x.^2 - 1;   % Can also define fct via function handle

%% Parameters
N = 20;     % Iterations

lambda = linspace(0,4,60);
%lambda = linspace(-.5,.5,100);
seed = linspace(0,1,30);

%% Populate the point array P
P = zeros(length(seed),  length(lambda),  N+1);  % Initialise array

for l = 1:length(seed)

    for k = 1:length(lambda)
        % Get the orbit for the parameters:
        P(l,k,:) = orbit2(seed(l),N,chaosfct,lambda(k));
    end

end

%% Surface plots as a time series for different seeds
for l = 1:length(seed)
   
    % Squeeze out the singleton dimension (l) to visualise:
    surf(squeeze(P(l,:,:)));
    
    pause(.2)
end
%% Surface plots as a time series for different function parameters
for k = 1:length(lambda)
   
    % Squeeze out the singleton dimension to visualise:
    surf(squeeze(P(:,k,:)));
    
    pause(.04)
end

%% Surface plots as a time series for different iterations
for k = 1:N
   
    % Squeeze out the singleton dimension to visualise:
    surf(squeeze(P(:,:,k)));
    
    pause(.4)
end

%% Condense all points and keep lambda to show a distribution of points:
for k = 1:length(lambda)
    condLambda(k,:) = reshape(P(:,k,:),[],1);
end

%% Plot Point Distribution
%plot(lambda,condLambda(:,5:end),'.')  % Show later points
plot(lambda,condLambda,'.')            % Show all points
xlabel('lambda')

%% Animate different point paths for different seeds and nr of iterations
for i = 1:(N+1)*length(seed)
    plot(lambda,condLambda(:,i),'.')
    %hold on
    pause(1/((N+1)*length(seed)))
end
hold off
plot(lambda,condLambda,'.')            % Show all iterations
