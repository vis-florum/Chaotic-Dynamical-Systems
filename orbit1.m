function [ Y ] = orbit1( seed, N, orbitfct, varargin )
%Returns N numbers of the orbit of a (chaotic) function recursively
% Arugments needed for the chaotic funtion need t be specified as arguments in varargin
% The used function needs to be written in ''
% Initial Seeding point X is not output in Y at the end.

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

