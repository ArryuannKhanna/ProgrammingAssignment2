## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) { 
   # Initialize variables
  i <- NULL
  # Setter function: Set the value of 'x'
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  # Getter function: Get the value of 'x'
  get <- function() x
  # Setter function for the inverse: Set the value of 'i'
  setinverse <- function(inverse) i <<- inverse
  # Getter function for the inverse: Get the value of 'i'
  getinverse <- function() i
  # Return a list of methods
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
                                                                                  
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
 # Check if the inverse is already cached; if so, return it.
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
  ## Return a matrix that is the inverse of 'x'
}
