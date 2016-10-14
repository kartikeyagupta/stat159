
args = commandArgs(trailingOnly = TRUE)
ad = read.csv(args[1], row.names = 1)

sink("./data/eda-output.txt")
print("Summary Statistics of TV")
summary(ad$TV)
print("Summary Statistics of Sales")
summary(ad$Sales)
sink() 

png("./images/histogram-tv.png")
hist(ad$TV, xlab = "TV", main = "Histogram of Ad TV")
dev.off()

pdf("./images/histogram-tv.pdf")
hist(ad$TV, xlab = "TV", main = "Histogram of Ad TV")
dev.off()

png("./images/histogram-sales.png")
hist(ad$Sales, xlab = "Sales", main = "Histogram of Ad Sales ")
dev.off()

pdf("./images/histogram-sales.pdf")
hist(ad$Sales, xlab = "Sales", main = "Histogram of Ad Sales ")
dev.off()
