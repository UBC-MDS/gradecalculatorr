#' Allow user to input course components' information
#' (component name and coresponding weight) one by one.
#'     Course components could be the following for example:
#'     1. Assignment(s)
#'     2. Quiz(s)
#'     3. Lab(s)
#'     4. Midterm(s)
#'     5. Final(s)
#'     6. Any user self-defined course component name(s)
#'
#'     Save the course information as a .csv file
#'     (named based on the 'course_name' paramater)
#'     to the file path specified by 'output_file_path' paramater
#'
#' @param course_name (string) :
#'              The course name as a string.
#'              It will be used as the output file name
#'        output_file_path (string) :
#'              Path to the output .csv file
#'              (named based on the 'course_name' paramater)
#'              under the current working directory as a string.
#'              The purpose to save under the current working directory it
#'              to avoid permission issue.
#'
#' @return None
#'
#' @examples construct_course('dsci524', '/')
construct_course <- function(course_name, output_file_path) {

}