# Script to be called from command line to perform unit tests:
# Rscript test-that.R

library(testthat)

# loading all function files
source("./code/functions/regression-functions.r")

# run unit tests in folder 'tests/'
test_dir("./code/tests", reporter = "Summary")
