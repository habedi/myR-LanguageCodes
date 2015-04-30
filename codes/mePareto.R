
# wow!..in R functions are actaully mere expressions!, last expression is returned!

dpareto <- function(x,c)
  {
  if(c<=0) 
    stop("c must be greater than 0") # testing
  ifelse(x<1,0,c/x^(c+1)) # in a lispy way => (if (< x 1) 0 (/ c (^ x (+ c 1))))
}

ppareto <- function(q,c)
  {
  if(c<=0)
    stop("c must be greater than 0")
  ifelse(q<1,0,1-1/q^c) # in a lispy way => (if (< x 1) 0 (- 1 (/ 1 (^ q c))))
}

qpareto <- function(p,c){
  if(c<=0) 
    stop("c must be greater than 0")
  if(any(p<0)|any(p>1)) # if p > 1 or p < 1 stop!!
    stop("p must be between 0 and 1")
  q <- (1-p)^(-1/c)
  q # return q
}

rpareto <- function(n,c)
  {
  if(c<=0)
    stop("c must be positive")
  rp <- runif(n)^(-1/c) # collect n sample with uniform probability and raise them to power of (-1/c)
  rp #return rp
}


## running starts here
x<- 1:5000
plot(rpareto(x,2.4))
v <- rpareto(x,2.1);
v <- floor(v)+1;

hist(v, main = "A vector of bin edges")
plot(v, col = "red", pch = 20)


