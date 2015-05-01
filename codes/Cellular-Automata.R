
require(CellularAutomaton, quietly = FALSE) # install CellularAutomaton first!
iter <- 100 # our ca would be simulated in a 100x100 grid
ca = CellularAutomaton(n = 30, t = iter, seed =  sample(0:1, iter, replace=T), bg = 0) # rule 30 ca
ca$plot()

iter <- 256 # our ca would be simulated in a 256x256 grid
ca = CellularAutomaton(n = 110, t = iter, seed =  sample(0:1, iter, replace=T), bg = -1)
ca$plot(col = c("white", "black")) # using pen colours

## the output is quite nice, and random;0)
