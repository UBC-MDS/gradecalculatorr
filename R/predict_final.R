library(readr)
library(tidyr)
library(devtools)
library(testthat)

#' Calculate what grade the student needs to have for the final assignment in order to reach the goal for overall grade
#' and return the scores needed for the final assignment.
#'
#' @param input_file A string path to read the saved .csv file as a string.
#' @param goal A numeric value to set the goal for your overall grade for this course.
#'
#' @return final_score_needed which is the scores needed for the final assignment. Otherwise return warning message.
#' @export
#'
#' @examples NA
predict_final <- function(input_file, goal) {

  # read the input csv file
  course_info <- read_csv(file=input_file)

  # Check if all assignment weight sum up to 100%
  if (sum(course_info$`Weights (%)`) != 100) {
    error_msg <- "Your total assignment weights are not summing up to 100%! Please update all your assignments."
    final_score_needed <- error_msg
    return (final_score_needed)
  }

  # Check if final score (in the last row) is NA
  if (! is.na(course_info$`Grades (%)`[length(course_info$`Grades (%)`)])) {
    error_msg <- "Your final assignment score is already updated. Please directly use calculate_grade()."
    final_score_needed <- error_msg
    return (final_score_needed)
  }

  # Check if there if more than one NA value in the 'Grades (%)' column
  if (sum(is.na(course_info$`Grades (%)`)) > 1) {
    error_msg <- "Please update all your assignment scores except the final."
    final_score_needed <- error_msg
    return (final_score_needed)
  }

  # Calculate final_score_needed with given goal when only score of final is NA
  total_scores_except_final <- sum(course_info$`Grades (%)` * course_info$`Weights (%)`, na.rm=TRUE)
  final_score_needed <- round((goal*100 - total_scores_except_final)/course_info$`Weights (%)`[length(course_info$`Weights (%)`)], 1)
  return (final_score_needed)

}
