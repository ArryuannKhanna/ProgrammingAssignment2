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
  #Check if the inverse is already cached; if so, return it.
  i <- x$getinverse()
  if (!is.null(i)) {
    message("Getting cached data")
    return(i)
  }
  #If not cached, retrieve the matrix data from 'x'.
  data <- x$get()
  #Compute the inverse using the 'solve' function.
  i <- solve(data, ...)
  #Cache the computed inverse in 'x'.
  x$setinverse(i)
  #Return the computed inverse.
  i
  # Return a matrix that is the inverse of 'x'
}
