## This function stores the inverse of a matrix.
# Initalize x by setting it to an empty matrix
# Initialize m by setting it to NULL

# Set input matrix (aMatrix) to x (an object in the parent environment)
# Maintain the default value of m on null or reset m to null when m represents an old value

# Retrieve x from the parent environment (since it is not in the get environment)

# Store the inverse function in setinverse
# Store the output of setinverse in m (an object in the parent environment)

# Retrieve m from the parent environment (since it is not in the getinverse environment)

# Get a list as output and assign all the functions and corresponding names to it

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL

set <- function(aMatrix) {
    x <<- aMatrix
    m <<- NULL
}
get <- function() x

setinverse <- function(solve)
m <<- solve(x)

getinverse <- function () m

list(set = set, get = get,
setinverse = setinverse,
getinverse = getinverse)
}


## This function caches the inverse of a matrix of type makeCacheMatrix.
# Set x as an argument to the function

# Retrieve the inverse from the object that is an argument in the function

# Check whether m is not null
# If m is not null: inverse is already stored and is returned together with a message
# If m is null: get the matrix and assign to new variable 'data', get the inverse of 'data' and assign to m, set the inverse in the object, and print inverse.

cacheSolve <- function(x, ...) {
    
    m <- x$getinverse()
    
    if(!is.null(m)) {
        message("getting cached data")
        return (m)
    }
    
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
}


## Test function: first make matrix, then assign first function to new variable since that is the necessary input for the second function, run second function with newly created variable as argument. If you run the exact same cacheSolve again it will print the "getting cached data" message again and return the same output.
# aMatrix <- matrix(c(6,2, 8, 4), nrow = 2, ncol = 2)
# MyMatrix <- makeCacheMatrix(aMatrix)
# cacheSolve(MyMatrix)

