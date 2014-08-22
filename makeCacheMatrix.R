
#This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
        # inversa will store the cached inverse matrix
        # it's reset to NULL every time makeCacheMatrix is called
        inversa <- NULL
        
        # this function stores the value to the matrix in the object
        # and reset to NULL the internal matrix
        set <- function(y) {
                x <<- y
                inversa <<- NULL
        }
        # get method for the matrix
        get <- function() x
        
        # this is called by cachesolve() during the first cachesolve()
        # access and it will store the value using superassignment
        setinv <- function(finv) inversa <<- finv
        
        # this will store the cached value on next accesses
        getinv <- function() inversa
        
        # this list is returned with the newly created object
        # It lists all the "methods" that are part of the object
        list(set = set, get = get, setinv = setinv, getinv = getinv)
}
