
# This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
# If the inverse has already been calculated (and the matrix has not changed), 
# then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        inversa <- x$getinv()
        
        # Check if the inverse has been already calculated, if so return the value
        if (!is.null(inversa)) {
                message("Dades extretes de la catxé")
                return(inversa)
        }
        
        # if reached this point, the inversa has not been calculated. call Solve!
        data <- x$get()
        inversa <- solve(data, ...)
        
        # Store the inverse for future use
        x$setinv(inversa)
        inversa
}
