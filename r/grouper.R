# Set up the function;
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
