function [theta_0_n, theta_1_n] = linRegStep(X, Y, theta_0, theta_1, num_alpha, delta)
  [d_theta_0, d_theta_1] = partialPenalty(X, Y, theta_0, theta_1, delta);
  theta_0_n = theta_0 - num_alpha * d_theta_0;
  theta_1_n = theta_1 - num_alpha * d_theta_1;
end