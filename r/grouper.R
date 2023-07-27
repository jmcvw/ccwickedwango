# Set up the function;
#' Create psuedo-random groups from a given vector of peoples' names
#'
#' @param cohort Character vector
#' @param number_of_groups Integer value
#'
#' @return
#' @export
#'
#' @examples
#' grouper(c("al", "david", "jamie", "john", "neringa", "uzair"), 3)
#'
#'
grouper <- function(cohort, number_of_groups = 2){

# Expect number_of_cohorts to be numeric;
  if(!is.numeric(number_of_groups)) {
    stop(call. = TRUE, "D'oh!  Use a number for how many groups you need...")
  }

# Generate groups;
  cohort |>
    sample(length(cohort)) |>
    split(1:number_of_groups) # enter no. groups needed
}
