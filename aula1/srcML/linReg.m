function theta = linReg(X, Y, theta_ini, num_alpha, delta, iterations)
  % Estimate the coefficients of a multivariable linear regretion.
  %
  % Obs:
  %
  % ---------
  % Arguments
  % ---------
  % X **cell array**: the independent variables (n x m)
  % Y **cell**: the dependent variable (n x 1)
  % theta_ini **cell array**: the initial estimated coefficients array (m x 1)
  % num_alpha **numeric**: the size of the step of the gradient descent
  % delta **numeric**: the size of the differential step to be used on the
  %                    gradient estimation
  % iterations **numeric**: the number of iterations of the algorithm

  means_x = mean(X);

  std_x = std(X);

  theta = theta_ini;

  X = (X - ones(size(X)) * diag(mean(X))) * inv(diag(std(X)))

  X_n = [ones(length(X),1) X];

  for i = 1:iterations
    theta = linRegStep(X_n, Y, theta, num_alpha, delta);
  end

  theta(2:end, 1) = inv(diag(std_x)) * theta(2:end, 1);
  theta(1,1) = theta(1,1) - means_x * theta(2:end, 1);

end