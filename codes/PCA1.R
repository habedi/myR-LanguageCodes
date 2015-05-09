
# Simple 2d Clustering via KMeans
library(graphics)
library(ggplot2)
library(zipfR) 

# hmm...let generate some data first
n <- 30 # number of data point pairs 

# ok, commence generating... 
a <- matrix(rnorm(n,mean=0,sd=3), ncol = 1) # x ~ normal distribution
b <- matrix(rnorm(n,mean=-1,sd=2), ncol = 1) # y ~ normal distribution
c <- matrix(rlnre(lnre("zm", alpha = 3/4, B = 0.1), n=n), ncol = 1) # z ~ zipf distribution

# making a NxD matrix/data.frame
w <- data.frame(x=a,y=b,z=c)

# plotting the point before dimension reduction
P <- ggplot(w, aes(x,y)) + geom_point(aes(colour = z), size = 3)
P + theme(axis.text.y = element_text(size = 10), axis.text.x = element_text(size = 10))


# ok, applying PCA to reduce dimensions of data
w.dmr <- princomp(~ x + y,
                  data = w, cor = FALSE)

## plotting princomp output
biplot(w.dmr, choices = 1:2, scale = 1, pc.biplot = FALSE)

# PCA Variable Factor Map
library(FactoMineR) # couldn't download it myself, but think it works
result <- PCA(w) # graphs generated automatically 
