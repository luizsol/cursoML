function grad = logistGrad(X, Y, theta)
  grad = (1 / length(Y)) * ((sigmoid(X, theta) - Y)' * X);
end