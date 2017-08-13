function theta_n = logistRegStep(X, Y, theta, num_alpha)
  % Estimate the new coefficients of the linear regression.
  %
  % Obs:
  %
  % ---------
  % Arguments
  % ---------
  % X **cell array**: the independent variables (n x m)
  % Y **cell**: the dependent variable (n x 1)
  % theta **cell array**: the estimated coefficients array (m x 1)
  % num_alpha **numeric**: the size of the step of the gradient descent
  % delta **numeric**: the size of the differential step to be used on the
  %                    gradient estimation


  theta_n = theta - num_alpha * logistGrad(X, Y, theta);
end