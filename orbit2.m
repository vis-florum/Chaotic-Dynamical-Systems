function [ Y ] = orbit2( seed, N, orbitfct, varargin )
% Returns N numbers of the orbit of a function recursively
% Arugments required for the chaotic funtion can be specified in varargin
% The used function needs to be written in quotation marks ''
% Initial seed is now also output in Y at the end

% Default is one iteration:
if nargin < 2
    N = 1;
end

%% Actual function call:
nextstep = feval(orbitfct,seed,varargin{:});   % Evaluate function

%% Recursion N times:
if N > 0
    Y = [seed orbit2(nextstep,N-1,orbitfct,varargin{:})];
else
    Y = seed;
end

end

