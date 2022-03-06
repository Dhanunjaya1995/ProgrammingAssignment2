setwd('C:/Users/Dhanunjay/OneDrive/Documents/GitHub/ProgrammingAssignment2')
## i has created input x then set 'i' as null value 
## then I changed every reference to "mean" to "solve"
library(MASS)
makeCacheMatrix <- function( m = matrix() ) {
  
  ## creating inverse property
  i <- NULL
    ## set the matrix
  set <- function( matrix ) {
    m <<- matrix
    i <<- NULL
  }
  ## get the matrix
  get <- function() {
    ## Return the matrix
    m
  }
  
  ## creating inverse
  setInverse <- function(inverse) {
    i <<- inverse
  }
  
  ## getting the inverse
  getInverse <- function() {
    ## Return the inverse property
    i
  }
  
  ## list of the methods
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}



cacheSolve <- function(x, ...) {
  
  m <- x$getInverse()
  
  
  if( !is.null(m) ) {
    message("getting cache")
    return(m)
  }
  
  ## Get the matrix from our object
  data <- x$get()
  
  ## inverse using matrix 
  m <- solve(data) %*% data
  
  ## Set the inverse to the object
  x$setInverse(m)
  
  ## Return the matrix
  m
}

