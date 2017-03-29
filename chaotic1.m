% First file. Simple chaotic visualisation

clear
clc

lambda = 0:.01:4;

N = 40;

P = zeros(length(lambda),N);
P(:,1) = .5;

for k = 1:length(lambda)
    
    for i = 2:N
        P(k,i) = lambda(k) * P(k,i-1) * (1 - P(k,i-1));
    end

end

figure
plot(P');
figure
plot(P)