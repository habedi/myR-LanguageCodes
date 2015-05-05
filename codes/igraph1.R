
## Download and install the package
#install.packages("igraph")

# Remove all objects in the workspace
rm(list=ls(all=TRUE))

# Then collect garbage...
gc()

## Load package
library(igraph)
library(pracma)

# just checking ...
print("everything is ok!, i create dthe graph, what now?!")


g <- graph.famous("Zachary")
wc <- walktrap.community(g)
#wc <- multilevel.community(g)
#modularity(wc)
#membership(wc)
plot(wc,g)
#plot(g,layout=layout.circle)
