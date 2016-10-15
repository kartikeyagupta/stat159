library("xtable")

#args = commandArgs(trailingOnly = TRUE)
#ad = read.csv(args[1], row.names = 1) 

ad = read.csv("./data/Advertising.csv", row.names = 1)

reg = lm(Sales ~ TV + Radio + Newspaper, ad, y = TRUE, x= TRUE)
summary(reg)

png("./images/scatterplot-tv-sales.png")
plot(ad$TV, ad$Sales, pch=16, col=rgb(255,0,0,150,maxColorValue=255), xlab = "TV", ylab = "Sales",main = "Regression of Sales on TV with Ad Data" )
abline(lm(Sales~TV, ad))
dev.off()

png("./images/scatterplot-radio-sales.png")
plot(ad$Radio, ad$Sales, pch=16, col=rgb(255,0,0,150,maxColorValue=255), xlab = "Radio", ylab = "Sales",main = "Regression of Sales on Radio with Ad Data" )
abline(lm(Sales~Radio, ad))
dev.off()

png("./images/scatterplot-newspaper-sales.png")
plot(ad$Newspaper, ad$Sales, pch=16, col=rgb(255,0,0,150,maxColorValue=255), xlab = "Newspaper", ylab = "Sales",main = "Regression of Sales on Newspaper with Ad Data" )
abline(lm(Sales~Newspaper, ad))
dev.off()

png("./images/residual-plot.png")
plot(reg, which = c(1))
dev.off()

png("./images/scale-location-plot.png")
plot(reg, which = c(3))
dev.off()

png("./images/normal-qq-plot.png")
plot(reg, which = c(2))
dev.off()

save(reg, file= "./data/regression.RData")


#stargazer(reg, type = "text", out = "./data/Tv~Sales-Reg.txt")

#Quantity = c("Residual Standard Error","R2","F-Statistic")
#Value = c(as.numeric(sqrt(sum(as.vector(summary(reg)$residuals)^2)/(length(summary(reg)$residuals)-2))), as.numeric(summary(reg)$r.squared), as.numeric((summary(reg)$fstatistic)[1]))
#valuetable = data.frame(Quantity, Value)

#regtable = xtable(reg)
#valuetable = xtable(valuetable)



