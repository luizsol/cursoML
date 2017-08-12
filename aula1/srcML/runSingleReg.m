%% Carrega dados

[X, Y] = data1();

%% Estimação dos parâmetros
theta = [0; 0];
num_alpha = 0.001;
delta = 0.001;
iterations = 100000;

theta = linReg(X, Y, theta, num_alpha, delta, iterations);

scatter(X, Y)
hold on

line(X, X * theta(2,1) + theta(1,1), 'Color','red')
hold off
