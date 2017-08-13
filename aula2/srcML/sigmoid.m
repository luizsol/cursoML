function S = sigmoid(X, theta)
  S = arrayfun(@(x) 1/(1+exp(-x)), X*theta);
end