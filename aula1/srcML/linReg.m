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

  theta = theta_ini;

  X_n = [ones(length(X),1) X];

  for i = 1:iterations
    theta = linRegStep(X_n, Y, theta, num_alpha, delta);
  end
end