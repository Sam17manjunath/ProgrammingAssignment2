## Put comments here that give an overall description of what your
## functions do
##These functions written in partial fulfillment of Coursera Data Science: R Programming 
## Week 3 Assignment; week beginning june 20; 
##by GitHub user: Sam17manjunath
## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) { ##this function creates a matrix object that can cache its inverse
  inv <- NULL  #initialize inv as NULL; will holdof inverse matrix
  set <- function(y){      #define the set function to assign new
    x <<- y ##value of matrix in parent environment
    inv <<- NULL ##if there is a new matrix, set inv to NULL
  }
  get <- function() x  ## this returns value of matrix arguement
  setInverse <- function(solveMatrix) inv <<- solveMatrix #assigns value of inv in parent environment
  getInverse <- function() inv     #gets the value of inv where it is called
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## Write a short comment describing this function
##this function computes the inverse of the special matrix returned by makeCacheMatrix above
##if inverse aldready calculated without the matrix being changed,inverse will be retrieved from cache by cachesolve function
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setInverse(inv)
  inv   
}
