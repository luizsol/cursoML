%% Carrega dados

[X, Y] = data2();

%% Estimação dos parâmetros
theta = [0; 0; 0];
num_alpha = 0.001;
delta = 0.001;
iterations = 10000;

theta = linReg(X, Y, theta, num_alpha, delta, iterations)

figure(1)
scatter(X(:,1), Y)
hold on

line(X(:,1), X(:,1) * theta(2,1) + theta(1,1), 'Color', 'red')
hold off

figure(2)
scatter(X(:,2), Y)
hold on

line(X(:,2), X(:,2) * theta(3,1) + theta(1,1), 'Color', 'red')
hold off