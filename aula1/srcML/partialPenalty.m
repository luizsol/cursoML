function d_theta = partialPenalty(X, Y, theta, delta)
  % Calculate the gradient of the error.
  %
  % Obs:
  %  - number of observations: n
  %  - number of variables: m
  %  - don't forget about x_0 (= 1) and theta_0
  %
  % ---------
  % Arguments
  % ---------
  % Y **cell**: the dependent variable (n x 1)
  % X **cell array**: the independent variables (n x m)
  % theta **cell array**: the estimated coefficients array (m x 1)
  % delta **numeric**: the size of the differential step to be used on the
  %                    gradient estimation

  theta_plus_delta = theta * ones(size(theta')) + eye(length(theta)) * delta;

  error_plus_theta = sum(((X * theta_plus_delta - ...
                         Y * ones(size(theta'))).^2)/length(Y),1);

  d_theta = (error_plus_theta' - ones(size(theta))*penalty(X, Y, theta)) * (1/delta);
end