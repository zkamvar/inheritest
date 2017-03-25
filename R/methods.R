#' Initialize Foo
#'
#' @aliases initialize,foo-method
#' @param .Object a character, "foo"
#' @param x numeric
#' @param y numeric
setMethod(
  f = "initialize",
  signature = signature("foo"),
  definition = function(.Object, x, y) {
    if (!missing(x)){
      .Object@x <- x
    }
    if (!missing(y)){
      .Object@y <- y
    }
    return(.Object)
})


#' Initialize Bar
#'
#' @aliases initialize,bar-method
#' @param .Object a character, "bar"
#' @param ... parameters passed on to foo
#' @param distance numeric
setMethod(
  f = "initialize",
  signature("bar"),
  definition = function(.Object, ..., distance) {
    .Object <- callNextMethod(.Object, ...)
    if (!missing(distance)){
      .Object@distance <- distance
    }
    return(.Object)
})

#' Foo methods
#'
#' @param x foo.
#' @param i ANY.
#' @param j ANY.
#' @param ... not used
#' @param foo When TRUE, it prints a message
#' @param drop ANY.
#'
#' @return an object of class foo
#' @export
#' @rdname foo-method
#'
#' @examples
#' foo <- new("foo", x = pi, y = 2)
#' foo["x"]
setMethod(
  f = "[",
  signature = signature(x = "foo", i = "ANY", j = "ANY", drop = "ANY"),
  definition = function(x, i, j, ..., foo = TRUE, drop = FALSE) {
    if (foo) message("FOOOOOOO")
    if (i == "x") {
      return(x@x)
    } else {
      if (i == "y") {
        return(x@y)
      }
    }
})

#' Bar methods
#'
#' @param x bar.
#' @param i ANY.
#' @param j ANY.
#' @param ... passed on to foo
#' @param bar When TRUE, it prints a message
#' @param drop ANY.
#'
#' @return an object of class "bar"
#' @export
#' @rdname bar-method
#'
#' @examples
#' bar <- new("bar", x = pi, y = 2, distance = 0)
#' bar["x"]
#' bar["distance"]
setMethod(
  f = "[",
  signature = signature(x = "bar", i = "ANY", j = "ANY", drop = "ANY"),
  definition = function(x, i, j, ..., bar = TRUE, drop = FALSE) {
    if (bar) message("BAAAAAAR")
    if (i == "distance") {
      return(x@distance)
    } else {
      callNextMethod(x, i, j, ..., drop)
    }
})