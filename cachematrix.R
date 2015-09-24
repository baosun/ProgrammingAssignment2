## Matrix inversion is usually a costly computation and there may be some 
## benefit to caching the inverse of a matrix rather than compute it repeatedly.
## Below functions can cache the inverse of a matrix.

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
        Inv <- NULL
        setMatrix <- function(y) {
                x <<- y
                Inv <<- NULL
        }
        getMatrix <- function() x
        setInverse <- function(Inverse) Inv <<- Inverse
        getInverse <- function() Inv
        
        list(setMatrix = setMatrix, getMatrix = getMatrix, 
             setInverse = setInverse, getInverse = getInverse)
        
}


## This function computes the inverse of the special "matrix" returned
## by makeCacheMatrix above. If the inverse has already been calculated (and the 
## matrix has not changed), then the cacheSolve should retrieve the inverse from 
## the cache.


cacheSolve <- function(x, ...) {
        Inv <- x$getInverse()
        if(!is.null(Inv)) {
                message("getting cached data")
                return(Inv)
        }
        
        data <- x$getMatrix()
        Inv <- solve(data)
        x$setInverse(Inv)
        Inv
}
