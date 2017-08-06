function [d_theta_0, d_theta_1] = partialPenalty(X, Y, theta_0, theta_1, delta)
  d_theta_0 = (penalty(X, Y, theta_0 + delta, theta_1) - penalty(X, Y, theta_0, theta_1))/delta;
  d_theta_1 = (penalty(X, Y, theta_0, theta_1 + delta) - penalty(X, Y, theta_0, theta_1))/delta;
end