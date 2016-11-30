

#' @title Residual Sum of Sqaures - Returns RSS computed manually
#' @param x - regression data (lm object)
#' @return numeric RSS
residual_sum_squares = function(x){
  as.numeric((sum(as.vector(summary(reg)$residuals)^2)))
}

#' @title Total Sum of Sqaures - Returns TSS computed manually
#' @param x - regression data (lm object)
#' @return numeric TSS
total_sum_squares = function(x){
  as.numeric(sum((reg$y-mean(reg$y))^2))
}

#' @title R-Squared - Returns R^2 statistic computed manually
#' @param x - regression data (lm object)
#' @return numeric R2
r_squared = function(x){
  as.numeric(1-(residual_sum_squares(x)/total_sum_squares(x)))
}

#' @title F-statistic - Returns F-stat computed manually
#' @param x - regression data (lm object)
#' @return numeric F-stat without degrees of freedom
f_statistic = function(x){
  as.numeric(((total_sum_squares(x)-residual_sum_squares(x))/(length(coef(x))-1))/(residual_sum_squares(x)/(length(x$y)-length(coef(x))-1-1)))
}

#' @title Residual Standard Error - Returns RSE computed manually
#' @param x - regression data (lm object)
#' @return numeric RSE
residual_std_error = function(x){
  as.numeric(sqrt((1/(length(x$y)-length(coef(x))-1-1))*residual_sum_squares(x)))
}

