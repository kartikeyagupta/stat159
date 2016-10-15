


residual_sum_squares = function(x){
  as.numeric((sum(as.vector(summary(reg)$residuals)^2)))
}

total_sum_squares = function(x){
  as.numeric(sum((reg$y-mean(reg$y))^2))
}

r_squared = function(x){
  as.numeric(1-(residual_sum_squares(x)/total_sum_squares(x)))
}

f_statistic = function(x){
  as.numeric(((total_sum_squares(x)-residual_sum_squares(x))/(length(coef(x))-1))/(residual_sum_squares(x)/(length(x$y)-length(coef(x))-1-1)))
}

residual_std_error = function(x){
  as.numeric(sqrt((1/(length(x$y)-length(coef(x))-1-1))*residual_sum_squares(x)))
}

