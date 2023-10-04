pkg load statistics

% Source Code from Teacher
n = 10000
% 6430402024
% 6430401997
x0 = 997 + 24                     % sum of 3 last digits of 2 students
x1 = mod(112 * x0, 111) + 2       % (1021 * 112 mod 11) + 2 = 24
x2 = mod(112 * x1, 111) + 2       % (24 * 112 mod 11) + 2 = 26
p = 0.31 + x2 / 1000              % used in Problem 1.2
N = 10
% ------------------------------------------
% Generate the matrix of n ramdom samples from binomial distribution (10, p)
% in matrix from. dimension = sqrt(n) x sqrt(n)
  Bernmat = binornd(N, p, sqrt(n));
% ------------------------------------------
% convert Bernmat to Row Vector(dim 1 x n), X
X = (Bernmat'(:))'; % Random Variable
minX = min(X);
maxX = max(X);
e = [minX:maxX + 1] - 0.5;
H = histc(X, e);
nbins = length(e) - 1;
bin_centers = [minX:maxX];
bar(bin_centers, H(1:nbins) / n, 'w');
hold on   % prevent erasure last plot
k = [0 : nbins - 1]     % Range of pmf
Mn = mean(X); % Sample Mean
pn = Mn / N;  % estimate Bernoulli parameter p
prob = binopdf(k, N, pn);   %compute binomial(N, pn) pmf
stem(k, prob, 'filled')   % make the stem plot of pmf
fprintf("Mn = %g, pn = %g\n", Mn, pn);
hold off
