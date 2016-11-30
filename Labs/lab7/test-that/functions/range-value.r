#' @title Range Value
#' @param x numeric vector
#' @return range as max - min
range_value <- function(x, y) {
  if(y==TRUE){
    x = x[!is.na(x)]
  }
  max(x) - min(x)
}