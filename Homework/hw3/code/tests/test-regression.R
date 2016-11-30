library("testthat")

# loading the source code of the functions to be tested
source("./../functions/regression-functions.R")

# testing regressino functions. Will use defualt mtcars from R database.
reg = lm(mpg ~ disp + hp, mtcars, y=TRUE, x=TRUE)
regsum = summary(reg)

context("Tests for RSS, TSS, RSE, R2, F-Stat Functions") 

test_that("Whether RSS returns correct value", {
  x = sum(reg$residuals^2)
  
  expect_equal(residual_sum_squares(reg), x)
  expect_length(residual_sum_squares(reg), 1)
  expect_type(residual_sum_squares(reg), 'double')
})

test_that("Whether TSS returns correct value", {
  x = sum((mtcars$mpg - mean(mtcars$mpg))^2)
  
  expect_equal(total_sum_squares(reg), x)
  expect_length(residual_sum_squares(reg), 1)
  expect_type(residual_sum_squares(reg), 'double')
})

test_that("Whether RSE returns correct value", {
  x = regsum$sigma
  
  expect_that(residual_std_error(reg), equals(x, tolerance= 0.1))
  expect_length(residual_std_error(reg), 1)
  expect_type(residual_std_error(reg), 'double')
})

test_that("Whether R2 returns correct value", {
  x = regsum$r.squared
  
  expect_that(r_squared(reg), equals(x, tolerance= 0.01))
  expect_length(r_squared(reg), 1)
  expect_type(r_squared(reg), 'double')
})

test_that("Whether F-statistic returns correct value", {
  x = regsum$fstatistic[1]
  
  expect_that(f_statistic(reg),equals(as.numeric(x), tolerance = 0.1*f_statistic(reg)))
  expect_length(f_statistic(reg), 1)
  expect_type(f_statistic(reg), 'double')
})


