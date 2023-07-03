#' does_al_approve
#' 
#' A function to add the words "Al approves this message" or 
#' "Al doesn't approve this message" to a character input.
#'
#' @return A character vector
#' @export
#'
#' @examples
#' does_al_approve("Pizza is the best food")

does_al_approve <- function(text){
  stopifnot("Input is not text" = is.character(text))
  
  outcome <- sample(c(1,2), size = 1)
  
  if outcome == 1(
    paste(c(text, " - Al approves this message.")
  )
  else(
    paste(c(text, " - Al does not approve this message.")
  )
  
}