pkg load statistics

% Source Code from Teacher
n = 10000
% 6430402024
% 6430401997
x0 = 997 + 24                     % sum of 3 last digits of 2 students
x1 = mod(112 * x0, 111) + 2       % (1021 * 112 mod 111)+ 2 == 24
x2 = mod(112 * x1, 111) + 2       % (24 * 112 mod 111)+ 2 == 26
p = 0.31 + x2 / 1000
N = 10
% ------------------------------------------
% Generate the matrix of n ramdom samples from binomial distribution (10, p)
% in matrix from. dimension = sqrt(n) x sqrt(n)
  Bernmat = binornd(N, p, sqrt(n));
% ------------------------------------------
% use data X.txt from Problem 1.3
X = dlmread('X.txt', '', 5, 0);
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
% Problem 2
% follow by the teacher want to find binomial(N, pn)
pS2 = binopdf(bin_centers, N, pn);    % pS2 is a vector of binomial pmf
Z = sum(((H(1: nbins) - n * pS2) .^ 2) ./ (n * pS2));   % compute a statistic Z
r = 1;    % number of estimate parameter p
kDegree = nbins - 1 - r;    % degree of freedom
alpha = 0.05;
zThreshold = chi2inv(1 - alpha, kDegree);
% ------------------------------------------
% Condition for check a good fit to the data
if (Z <= zThreshold)
  statusLog = "A candidate pmf is a good fit to the data";
else
  statusLog = "A candidate pmf is NOT a good fit to the data";
endif
% ------------------------------------------
stem(k, prob, 'filled')   % make the stem plot of pmf
fprintf("Mn = %g, pn = %g\n, Z = %g, zThreshold = %g", Mn, pn, Z, zThreshold);
hold off
