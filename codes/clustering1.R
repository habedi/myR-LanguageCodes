
# Simple 2d Clustering via KMeans
require(graphics)

# hmm...let generate some data first
n <- 300 # number of data point pairs 
d <- 2 # dimension, of-course it's 2

# generating some data having a gaussian distribution
sigma <- 2 # variance of the distribution, i love this!
mean <- 0 # centre of the distribution 

# ok, commence generating...
a <- matrix(rnorm(n,mean=mean,sd=sigma), ncol = 2)
b <- matrix(rnorm(n,mean=mean,sd=sigma), ncol = 2)

# 
z <- rbind(a,b)
colnames(z) <- c("a", "b")

# 10 clusters
results <- kmeans(z, 10, iter.max = 10,
       algorithm = c("Hartigan-Wong"))
plot(z, col = results$cluster) 
points(results$centers, col = 1:2, pch = 0, cex = 2,
       xlab="x", ylab="y", main="Simple KMeans")

