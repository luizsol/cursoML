%% Carrega dados

[X, Y] = data2();

%% Estimação dos parâmetros
theta = [0; 300; 100000];
num_alpha = 0.00000001;
delta = 0.0000000001;
iterations = 1000000;

theta = linReg(X, Y, theta, num_alpha, delta, iterations)

figure(1)
scatter(X(:,1), Y)
hold on

scatter(X(:,1), X(:,1) * theta(2,1) + X(:,2) * theta(3,1) + ones(size(Y)) * theta(1,1))
hold off

figure(2)
scatter(X(:,2), Y)
hold on

scatter(X(:,2), X(:,1) * theta(2,1) + X(:,2) * theta(3,1) + ones(size(Y)) * theta(1,1))
hold off