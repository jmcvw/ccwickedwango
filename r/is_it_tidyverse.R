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

  if("package:tidyverse" %in% search() == FALSE) {
    print("Tidyverse needs to be loaded")
    break
  }

  tv_packages <- c("ggplot2", "dplyr", "tidyr", "readr",
                  "purrr", "tibble", "stringr", "forcats"
  )

  # use this for all the modelling functions too
  # all_tv_packages <- c("ggplot2", "dplyr", "tidyr", "readr",
  #                      "purrr", "tibble", "stringr", "forcats",
  #                      "modelr", "tune", "parsnip", "yardstick",
  #                     "recipes", "rsample", "tidymodels"
  # )

  package_found <- 0


  for (package in tv_packages) {

    if (package_found) {break}
    string <- paste0("package:", package)
    print(paste0("Trying ", string))
    funs_list <- lsf.str(string)

    n <- length(funs_list)

    for (i in 1:n) {
      if(funs_list[i] == function_to_check){
        print(paste0("Function is in the tidyverse - '", package, "' to be precise."))
        package_found = 1
        break
      }
    }
  }
}

