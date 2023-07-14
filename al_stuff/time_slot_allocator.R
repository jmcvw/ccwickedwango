#' time_slot_allocator
#'
#' A function to randomly assign students/groups to timeslots (e.g. for
#' presentations) based on a starting time and slot duration.
#'
#' @return A tibble with 2 columns: time_slot and student
#' @export
#'
#' @examples
#' time_slot_allocator(students = de21,
#'                     start_time = 1000,
#'                     time_per_slot = 10)

time_slot_allocator <- function(students, start_time, time_per_slot){

  # students <- c("barry", "steve", "margo")
  # time_per_slot <- 15
  # start_time <- 1000

  students_rand <- sample(students, size = length(students))

  slots_tibble <- dplyr::tibble(
    students_rand,
    start_time
  ) %>%
    dplyr::rowid_to_column("row_num") %>%
    dplyr::mutate(
      start_time = start_time + ((row_num - 1) * time_per_slot)
    ) %>%
    dplyr::select(-row_num)



}
