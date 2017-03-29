function [ Y ] = logistic( X, lambda )
%Returns one iteration of the logistic function family
% Standardvalue for lambda is 1

if nargin < 2
    lambda = 1;
end

% Actual functional operation:
Y = lambda .* X .* (1-X);

end

