## This code was created as a programming assignment for Coursera R-Programming
## course in Data Science Specialization

## This code writes funcionts that are able to cache potentially time-consuming
## computations, in this case, returning the inverse of a matrix using solve().

## Function the stores a list of functions to a given object.

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(mean) m <<- mean
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## Function that returns a matrix that is the inverse of 'x' or returns cached
## value

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}