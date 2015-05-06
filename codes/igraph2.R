
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

a <- 'data/dolphins.gml'
g <- read.graph(file=a, format = c("gml"))

# peeking inside g
str(g)

# plotting g as a skeleton graph
plot.igraph(as.undirected(g), vertex.label = NA, vertex.size = 1)

# plotting g as a skeleton graph with circle layout
plot.igraph(as.undirected(g), layout = layout.circle, vertex.label = NA, vertex.size = 1)


