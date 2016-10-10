library("testthat")

# load the source code of the functions to be tested
source("functions/range-value.R")
source("functions/missing-values.R")

x <- c(1, 2, 3, 4, 5)
y <- c(1, 2, 3, 4, NA)
z <- c(TRUE, FALSE, TRUE)
w <- letters[1:5]


# context with one test that groups expectations
context("Test for range value") 


test_that("range value for numeric vectors", {
  x <- c(1, 2, 3, 4, 5)
  
  expect_equal(range_value(x,TRUE), 4)
  expect_length(range_value(x,TRUE), 1)
  expect_type(range_value(x,TRUE), 'double')
})


test_that("range value for numeric vectors with NAs", {
  y <- c(1, 2, 3, 4, NA)
  
  expect_equal(range_value(y,FALSE), NA_real_)
  expect_length(range_value(y,TRUE), 1)
})


test_that("range value for logical vectors", {
  z <- c(TRUE, FALSE, TRUE)
  
  expect_equal(range_value(z,TRUE), 1L)
  expect_length(range_value(z,TRUE), 1)
  expect_type(range_value(z,TRUE), 'integer')
})


test_that("range value stops for character vectors", {
  w <- letters[1:5]
  
  expect_error(range_value(w,TRUE))
})



# ____________________________________________________________________ #

context("Test for missing value")

test_that("missing values for numeric vectors", {
  x <- c(1, 2, 3, 4, 5)
  
  expect_length(missing_values(x),1)
  expect_gte(missing_values(x), 0)
  expect_type(missing_values(x), 'double')
}) 

test_that("missing values for numeric vectors with NAs", {
  x <- c(1, 2, 3, 4, NA)
  
  expect_length(missing_values(x),1)
  expect_gte(missing_values(x), 0)
  expect_type(missing_values(x), 'double')
}) 

test_that("missing values for logical vectors", {
  x <- c(TRUE, FALSE, TRUE)
  
  expect_length(missing_values(x),1)
  expect_gte(missing_values(x), 0)
  expect_type(missing_values(x), 'double')
}) 

test_that("missing values for character vectors", {
  x <- letters[1:5]
  
  expect_length(missing_values(x),1)
  expect_gte(missing_values(x), 0)
  expect_type(missing_values(x), 'double')
}) 

# ____________________________________________________________________ #




