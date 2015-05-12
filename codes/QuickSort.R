QuickSort <- function (seq)
    {
        if (length(seq) < 2)
            {
            return (seq)
        }


        head <- seq[1];
        tail <- seq[-1];

        left <- tail[tail < head];
        right <- tail[tail >= head];

        left <- QuickSort(left);
        right <- QuickSort(right);
        
        return (c(left, head, right));
        
    }

# testing
##  Very simple use
trace(QuickSort)
print(QuickSort(c(1,5,89,656,-5,-88,2,58,1,20)))
untrace(QuickSort)


