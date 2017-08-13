function J = logisticalCost(X, Y, theta)
  J = (1 / length(Y)) * (-Y' * log(sigmoid(X, theta)) - (ones - Y)' * ...
                         log(1-sigmoid(X, theta)));
end