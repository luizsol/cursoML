%% Carrega dados

[X, Y] = data1();

%% Estimação dos parâmetros
theta_0 = 10;
theta_1 = 10;
num_alpha = 0.001;
delta = 0.1;


old_theta_0 = theta_0;
old_theta_1 = theta_1;

for i = 1:100000
  old_theta_0 = theta_0;
  old_theta_1 = theta_1;
  [theta_0, theta_1] = linRegStep(X, Y, old_theta_0, old_theta_1, num_alpha, delta);
end
[theta_0, theta_1]


%% Apresentação do resultado

figure(1)

scatter(X, Y)
hold on

line(X, X * theta_1 + theta_0 + penalty(X, Y, theta_0, theta_1), 'Color','red','LineStyle','--')
line(X, X * theta_1 + theta_0 - penalty(X, Y, theta_0, theta_1), 'Color','red','LineStyle','--')
line(X, X * theta_1 + theta_0, 'Color','red')