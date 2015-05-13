# see http://en.wikipedia.org/wiki/McCarthy_91_function

MCF <- function(n)
    {
        if (n > 100) {
            return (n-10)
        } else {
            MCF(MCF(n+11))
        }
    }

## give it a try
trace(MCF)
print(MCF(78))
inputs <- c(1, 12, 45, 4, 5)
results <- Map(MCF, inputs)
print(results)
untrace(MCF)

# as if it always return 91!


    
