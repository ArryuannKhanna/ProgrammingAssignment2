## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) { 
  # Initialize the matrix and inverse cache
  mat <- NULL
  inv <- NULL 
  # Function to set the matrix
  set <- function(matrix) {
    mat <<- matrix
    inv <<- NULL  # Reset the cached inverse when the matrix changes
  }
  # Function to get the matrix
  get <- function() mat
  # Function to set the inverse
  setinverse <- function(inverse) {
    inv <<- inverse
  }
  # Function to get the inverse
  getinverse <- function() inv
  # Return a list of functions
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
                                                                                  
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inv <- x$getinverse()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinverse(inv)
    inv
}
