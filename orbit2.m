function [ Y ] = orbit2( seed, N, orbitfct, varargin )
%Returns N numbers of the orbit of a (chaotic) function recursively
% Arugments needed for the chaotic funtion need t be specified as arguments in varargin
% The used function needs to be written in ''
% Initial Seed is also output!!

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

