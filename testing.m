clear all
clc
fifi = @(x) x.^2 +1;

N = 10

seed = 1;
a=[seed orbit1(seed,N,fifi)];
b=orbit2(seed,N,fifi);

A = [a;b];
a-b