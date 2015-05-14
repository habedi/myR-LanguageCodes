
## Download and install the package
#install.packages("igraph")

# Remove all objects in the workspace
rm(list=ls(all=TRUE))

# Then collect garbage...
gc()

## Load package
library(igraph)

# just checking ...
print("everything is ok!, i create dthe graph, what now?!")

file <- 'data/dolphins.gml'
g <- read.graph(file=file, format = c("gml"))

# calculating edge and node centralities of graph
ebc <- edge.betweenness(g, directed = TRUE)
nbc <- betweenness(g, directed = TRUE)

cc <-  closeness(g, mode=c("all"))
dc <-  degree(g, mode=c("all"))

# plotting centrality measures
attach(mtcars)
par(mfrow=c(2,2)) 
plot(ebc, xlab="edge index", ylab="edge betweenness") # edge betweenness
plot(nbc, xlab="node index", ylab="node betweenness") # node netweenness
plot(cc, xlab="node index", ylab="node closeness") # closeness 
plot(dc, xlab="node index", ylab="node degree") # degree
