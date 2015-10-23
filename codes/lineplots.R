# Remove all objects in the workspace
rm(list=ls(all=TRUE))

# Then collect garbage...
gc()

                                        # Create Line Chart

data <- read.csv(file="data/SHRINKING-TREND1.csv", header=T)
data <- t(data)
data <- c(as.numeric(data[-1,1]), as.numeric(data[-1,2]), as.numeric(data[-1,3]), as.numeric(data[-1,4]),
          as.numeric(data[-1,5]),as.numeric(data[-1,6]),as.numeric(data[-1,7]))

dm <- matrix(data, nrow=5, ncol=7)
colnames(dm) <- c("Douban","Gowalla","Epinions","Wiki-Talk","Enron","Citeseer","HepPh")
rownames(dm) <- c("0.0", "0.80", "0.85", "0.90", "0.95")

require(ggplot2)
setEPS()
postscript("gShrinking.eps")

plot(1,type='n',xlim=c(1,5),
     ylim=(c(25733,950327)/1000),
     xlab="Different values of alpha", ylab="Number of edges(mul. 1000)", xaxt="n")
colors <- rainbow(n=7)
linetype <- c(1:7)
plotchar <- seq(2,2+7,1)

# add axis
axis(1, 1:5, labels=rownames(dm))

for (g in 1:length(dm[1,])) {
    lines(x=(dm[,g]/1000), type="b", lwd=3,
    lty=linetype[g], col=colors[g], pch=plotchar[g])
}

# add a title and subtitle
#title("Graph Shrinking")

# add a legend
legend("topright",legend=colnames(dm), 1:7, cex=1.2,
       col=colors, pch=plotchar, lty=linetype, bty="n")

dev.off()
