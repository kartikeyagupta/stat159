library(stargazer)

ad = read.csv("./data/Advertising.csv", row.names = 1)

reg = lm(Sales ~ TV, ad)
summary(reg)

plot(ad$TV, ad$Sales, pch=16, col=rgb(255,0,0,150,maxColorValue=255), xlab = "TV", ylab = "Sales",main = "Regression of Sales on TV with Ad Data" )
abline(reg)

stargazer(reg, type = "text", out = "./data/Tv~Sales-Reg.txt")