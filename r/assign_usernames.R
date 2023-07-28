#' assign_usernames
#'
#' A function that takes a vector of names and assigns usernames
#' to each for use in a server. Requires tidyverse.
#'
#' @return A dataframe of student names and usernames
#' @export
#'
#' @param names_vector character vector of student names
#'
#' @examples
#' assign_usernames(c("John", "Colin"))

assign_usernames <- function(names_vector){
  stopifnot("Input is not a vector" = is.vector(names_vector))
  stopifnot("Vector contains non-character elements" = is.character(names_vector))


  user_df <- tibble::as_tibble(names_vector) |>
    dplyr::rename(name = value) |>
    tibble::rowid_to_column() |>
    dplyr::mutate(username = stringr::str_c("user", rowid)) |>
    dplyr::select(-rowid)

  clipr::write_clip(user_df, allow_non_interactive = TRUE)
  print("username dataframe has been copied to clipboard :)")
  return(user_df)

}


