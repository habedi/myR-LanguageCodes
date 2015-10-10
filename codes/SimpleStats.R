                                        # DIE YOU BASTARDS!
options(warn=-1)

                                        # loading seismic activity data
sa.data = read.table(file="data/Seismic data.csv", header=TRUE)

# inspecting ..
summary(sa.data)

                                        # some descriptive stats
library(pastecs)
options(scipen=100)
options(digits=2)
stats <- stat.desc(sa.data, basic=TRUE, desc=TRUE)

# printing ...
print(stats)

                                        # plotting a lovely scatter plot
sa.data.framed <- data.frame(1,sa.data)
plot(x=sa.data.framed, ylab="Size of seismic activities in a 7 day period", xlab=NULL)


                                        # a lovely boxplot to identify the outliers
new.sa.data <- boxplot(x=sa.data, main="Boxplot of the data", col="green",
                       pars=list(outcol="red"), horizontal=TRUE,axes=TRUE, xlab="Activity size")

# closing plotting windows!
#dev.off()

# print out outliers
print(new.sa.data$out)

# new data for seismic activity without outliers
new.data <-  sa.data[[1]][!(sa.data[[1]] %in% new.sa.data$out)]

                                        # also some standard features of the new data
options(scipen=100)
options(digits=2)
nstats <- stat.desc(new.data, basic=TRUE, desc=TRUE)

# again, printing ...
print(nstats)


# SET DIGIT LIMIT AFTER DOT
options(digits=6)

# printing IRQ original and new data
print(quantile(sa.data[[1]]), digits=6, zero.print = ".")
print(quantile(new.data[[1]]), digits=6, zero.print = ".")

#calculate confidence interval of 95% for the original data
error <- (qnorm(0.975)*0.2867)/sqrt(920)
print(mapply('+', 1.8029, c(-1.0*error, error)), digits=6, zero.print = ".")

#calculate confidence interval of 95% for the new data after removing the outliers
error <- (qnorm(0.975)*0.418)/sqrt(901)
print(mapply('+', 1.825, c(-1.0*error, error)), digits=6, zero.print = ".")

hist(new.data)
