library('corrplot')
library('lattice')
require(ggplot2)

#args = commandArgs(trailingOnly = TRUE)
#ad = read.csv(args[1], row.names = 1)

ad = read.csv("./data/Advertising.csv", row.names = 1)
correlation = cor(ad, use="complete.obs") 

sink("./data/eda-output.txt")

print("Summary Statistics of Sales")
summary(ad$Sales)
print("Summary Statistics of TV")
summary(ad$TV)
print("Summary Statistics of Radio")
summary(ad$Radio)
print("Summary Statistics of Newspaper")
summary(ad$Newspaper)

print("Summary of Correlation between different variables")
correlation

sink() 

save(correlation, file= "./data/correlation-matrix.RData")

corrplot(cor(ad, use="complete.obs") , method = 'circle', main = "Correlation Matrix")

png("./images/scatterplot-matrix.png")
pairs(ad[1:4], pch = 21)
dev.off()

png("./images/histogram-tv.png")
hist(ad$TV, xlab = "TV", main = "Histogram of Ad TV")
dev.off()

png("./images/histogram-sales.png")
hist(ad$Sales, xlab = "Sales", main = "Histogram of Ad Sales ")
dev.off()

png("./images/histogram-newspaper.png")
hist(ad$Newspaper, xlab = "Newspaper", main = "Histogram of Newspaper Ads")
dev.off()

png("./images/histogram-radio.png")
hist(ad$Sales, xlab = "Radio", main = "Histogram of Radio Ads ")
dev.off()
