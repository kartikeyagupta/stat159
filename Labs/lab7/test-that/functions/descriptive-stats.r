#' @title Descriptive Stats
#' @param x a vector
#' @return vector of median, mean, range, iqr, stdev, and number of missing values.

descriptive_stats <- function(x) {
  if(sum(is.na(x)>0)){
    missing = sum(is.na(x))
    x = x[!is.na(x)]
  } else {
    missing = 0
  }
  c(mean(x), median(x), range(x),IQR(x),sd(x), missing)
}


