library("xtable")
library(stargazer)
library(testthat)

ad = read.csv("./data/Advertising.csv", row.names = 1)

reg = lm(Sales ~ TV, ad)
summary(reg)

plot(ad$TV, ad$Sales, pch=16, col=rgb(255,0,0,150,maxColorValue=255), xlab = "TV", ylab = "Sales",main = "Regression of Sales on TV with Ad Data" )
abline(reg)

stargazer(reg, type = "text", out = "./data/Tv~Sales-Reg.txt")

xtable(reg)

Quantity = c("Residual Standard Error","R2","F-Statistic")
Value = c(as.numeric(sqrt(sum(as.vector(summary(reg)$residuals)^2)/(length(summary(reg)$residuals)-2))), as.numeric(summary(reg)$r.squared), as.numeric((summary(reg)$fstatistic)[1]))
valuetable = data.frame(Quantity, Value)
valuetable = xtable(valuetable)
