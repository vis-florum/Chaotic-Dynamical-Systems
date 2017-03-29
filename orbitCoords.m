function [ x,y ] = orbitCoords( seed, N, orbitfct, varargin )
%Calculates the orbit of a function and returns the coordinates of the
%orbit for iteration Analysis

%% Calculate the orbit:
orbit = orbit2(seed,N,orbitfct,varargin{:});

%% Cordinates:
% Make two identical rows of the orbit.
% Then read columnwise and transpose to receive doubling of all values in
% sequence. This is the sequence of x values. Take away the last two values as
% it is only the reflection point on the diagonal.
coords = repmat(orbit,2,1);
coords = coords(:)';
x = coords(1:end-2);

% For the y values take away the first (seed) value and make its copy to
% zero as the seed starts there. Take away last value too
y = coords(2:end-1);
y(1) = 0;

end

