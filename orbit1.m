function [ Y ] = orbit1( seed, N, orbitfct, varargin )
% Returns N numbers of the orbit of a function recursively
% Arugments required for the chaotic funtion can be specified in varargin
% The used function needs to be written in quotation marks ''
% Initial seed is not output in Y at the end.

% Default is one iteration:
if nargin < 2
    N = 1;
end

%% Actual function call:
Y = feval(orbitfct,seed,varargin{:});   % Evaluate function

%% Recursion N times:
if N > 1
    Y = [Y, orbit1(Y,N-1,orbitfct,varargin{:})];
end

end

