function obs_error = penalty(X, Y, theta)
  % Calculate the avg. quadratic error generated by the a set of thetas.
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
  % theta **cell array**: the estimated parameters array (m x 1)

  obs_error = sum((X*theta-Y).^2)/length(Y);
end