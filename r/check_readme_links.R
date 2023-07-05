#' Find Broken Links
#'
#' Finds broken links within a README.html file. Usually used to check that the Data Rewrite 2 Readme is up-to-date.
#'
#' @param dir Character vector showing local path to data rewrite 2 / classnotes folder
#'
#' @return Character vector of invalid paths
#' @export
#' @examples
#' find_broken_links('~/professional_data_analysis/course_notes/data_rewrite2')


find_broken_links <- function(dir = '.') {
  # get links, dirs, and files
  links <- rvest::read_html(paste0(dir, '/readme.html')) |>
    rvest::html_nodes('a') |>
    rvest::html_attr('href') |>
    stringr::str_remove('/$') # remove trailing slash characters for easy matching

  files <- list.files(path = dir, recursive = TRUE)
  dirs <- list.dirs(path = dir, full.names = FALSE)

  # Apply check_link function to links vector.
  # Keep names for returning
  checked_links <- sapply(
    links,
    FUN = check_link,
    dirs = dirs, files = files,
    USE.NAMES = TRUE
  )

  # return borken links
  names(which(checked_links == FALSE))
}

# function returns TRUE if link exists in files or is a valid dir
check_link <- function(link, dirs, files) {
  link %in% files | link %in% dirs
}
