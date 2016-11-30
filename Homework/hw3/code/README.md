This folder contains all the scripts required to run this analysis.   

Within Scripts:
eda-script.r - Basic script that is used to analyze data and create summary statistics along with histograms of Sales and Media. It outputs images and .RData files.   

regression-script.r - Main scrpit which conducts the regressions analysis, saves the regression object as regression.RData and creates a scatterplots with a fitted regression lines, regressions plots and .Rdata to be used by .rmd.   

session-info-script.r - Scripts to document the session information so that specifications can be refered to at later time.   


Within Functions:
regression-functions.r - Manually created statistical functions to be used in .rmd. Ex. R2, RSS, RSE etc.


Within Tests:
test-regression.R - Script to be called by test-that.R. It runs basic sanity check on regression functions created above.


test-that.R - Script that uses testthat package. It runs test-regression.r and sources regression-functions.r for testing purposes.

