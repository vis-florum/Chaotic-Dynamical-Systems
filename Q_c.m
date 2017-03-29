function [ Y ] = Q_c( X, c )
%Returns one iteration of the a quadratic function family
% Standardvalue for c is 0

if nargin < 2
    c = 0;
end

% Actual functional operation:
Y = X.^2 + c;

end

