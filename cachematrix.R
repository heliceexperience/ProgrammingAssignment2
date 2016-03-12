## This code was created as a programming assignment for Coursera R-Programming
## course in Data Science Specialization

## This code writes funcionts that are able to cache potentially time-consuming
## computations, in this case, returning the inverse of a matrix using solve().

## makeCacheMatrix() is a function that stores a list of functions to a given 
## object. Object functions allows user to set and get a matrix and alsobe 
## set and get inversed an matrix.

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(inv) i <<- inv
        getinverse <- function() i
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## Function that returns a matrix that is the inverse of 'x' or returns cached
## value

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getinverse()
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        data <- x$get()
        i <- solve(data, ...)
        x$setinverse(i)
        i
}