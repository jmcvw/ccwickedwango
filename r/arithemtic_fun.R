#' Add two numbers together
#'
#' Here is a description - has to be 1 paragraph long (but not really)
#'
#' \code{a} and \code{b} can be vector of length grater than one, but should be the same length as each other. If the vectors are different length no recycling is carried, and an error is raised.
#'
#' @param a Numeric vector; The first of two numbers to add
#' @param b Numeric vector
#'
#' @return Numeric vector of the same length as the input
#' @export
#'
#' @examples
#' adder(1, 2)
#' adder(1:3, 11:13)
#'
adder <- function(a, b) {
  stopifnot('Vector are not the same length' = length(a) == length(b))
  a + b
}


#' Title
#'
#' iterate ove fun til it works
#' using load_all() each time for any ad hoc test
#' when you happy do devtools::document()
#' iterate over docs til you're happy
#'
#' @param a Numeric
#' @param b Numeric
#'
#' @return
#' @export
#'
#' @examples
product <- function(a, b) {
  stopifnot('Vector are not the same length' = length(a) == length(b))
  a * b
}

