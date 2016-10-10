#' @title Spread Measure
#' @param x a vector
#' @return vector of Range, IQR, Std Dev.

spread_measures <- function(x) {
  c(range(x),IQR(x),sd(x))
}


