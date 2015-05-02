require(ggplot2)

# hmm...let generate some data first
n <- 300 # number of data point pairs 
d <- 2 # dimension, of-course it's 2

# generating some data having a gaussian distribution
sigma <- 2 # variance of the distribution, i love this!
mean <- 0 # centre of the distribution 

# ok, commence generating...
x <- rnorm(n,mean=mean,sd=sigma)
y <- rnorm(n,mean=mean,sd=sigma)

# putting x and y into a dataframe
p <- data.frame(x,y)

# plotting 1
plot(p)

# plotting 2
qplot(x,y, data=p)

# plotting 3
ggplot(x, aes(y, fill=cut)) + geom_bar()

# plottin 4
qplot(factor(x), data=p, geom="bar", fill=factor(x))



