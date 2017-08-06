function obs_error = penalty(X, Y, theta_0, theta_1)
  estimated = X * theta_1 + theta_0;
  obs_error = sum((estimated-Y).^2)/(2*length(X));
end