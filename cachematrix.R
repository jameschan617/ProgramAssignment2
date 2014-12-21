##This function could save the inverse of a input matrix
##as cache. When being used, this function can read the
##cache immediately for saving the calculate time.

##This function contains 4 Methods, set matrix, get matrix 
##set solve, get solve.

makeCacheMatrix <- function(x = matrix()){
        s <- NULL
        set <- function(y) {
                x <<- y
                s <<- NULL
        }
        get <- function(){
        	x
        } 
        setsolve <- function(solve) {
        s <<- solve
        }
        getsolve <- function(){
        s
        }
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
} 

##This function will check the cache of inverse of x, then
##read it or calculate.

cacheSolve <- function(x, ...) {
        s <- x$getsolve()
        if(!is.null(s)) {
                message("getting cached data")
                return(s)
        }
        data <- x$get()
        s <- solve(data, ...)
        x$setsolve(s)
        s
}
