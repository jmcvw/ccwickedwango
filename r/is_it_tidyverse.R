#' is_it_tidyverse
#'
#' A function to check whether a function is part of the tidyverse packages
#'
#' @return A character vector
#' @export
#'
#' @param function_to_check character string
#'
#' @examples
#' is_it_tidyverse("select")

is_it_tidyverse <- function(function_to_check){

  # check that tidyverse has been loaded
  if("package:tidyverse" %in% search() == FALSE) {
    print("Tidyverse needs to be loaded")
    break
  }

  tv_packages <- c("ggplot2", "dplyr", "tidyr", "readr",
                  "purrr", "tibble", "stringr", "forcats",
                  "lubridate"
  )

  # use this for all the modelling functions too
  # tv_packages <- c("ggplot2", "dplyr", "tidyr", "readr",
  #                      "purrr", "tibble", "stringr", "forcats",
  #                      "modelr", "tune", "parsnip", "yardstick",
  #                     "recipes", "rsample", "tidymodels"
  # )

  package_found <- 0


  for (package in tv_packages) {

    if (package_found) {break}
    package_string <- paste0("package:", package)
    funs_list <- lsf.str(package_string) # create an object containing all the functions in that package
lsf.str("package:ggplot2")
    n <- length(funs_list)

    for (i in 1:n) {
      if(funs_list[i] == function_to_check){
        print(paste0("Function is in the tidyverse - '", package, "' to be precise."))
        package_found = 1
        break
      }
    }
    if (i == n && package == tail(tv_packages, 1)){
      print(paste0("Function is not in the tidyverse."))
      break
    }
  }
}

