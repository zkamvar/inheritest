#' Foo
#'
#' @slot x numeric.
#' @slot y numeric.
#'
#' @return a class of type "foo"
#' @export
#'
#' @examples
#' foo <- new("foo", x = pi, y = 2)
#' foo["x"]
#' foo["y"]
#' @import methods
foo <- setClass("foo",
                representation = representation(x = "numeric", y = "numeric"),
                prototype = c(x = 0, y = 0))
#' Bar
#'
#' @slot distance numeric.
#'
#' @return a class of type "bar"
#' @export
#'
#' @examples
#' bar <- new("bar", x = pi, y = 2, distance = 0)
#' bar["x"]
#' bar["distance"]
bar <- setClass("bar", representation(distance = "numeric"), contains = "foo",
                prototype = c(distance = 0))