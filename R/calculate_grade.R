#'     When all course components are presented,
#'     calculate the course overall grade based on information provided.
#'
#' @param input_file_path Path to read the saved .csv file as a string.
#'
#' @return return_msg The course overall grade once all course components present 
#' @export
#'
#' @examples \dontrun{
#' calculate_grade('/tests/testthat/dsci524_grades_all.csv')
#' }
calculate_grade <- function(input_file_path) {

    cwd <- getwd()
    path <- paste0(cwd, "/", input_file_path)
    course_info <- readr::read_csv(path)
    # course_info <- readr::read_csv(input_file_path, col.names = TRUE, header = FALSE)

    print(course_info)

    error_msg_missing_value <- "Course component grades is missing for "
    error_msg_format <- "Course component grades with incorrect format (not 2 decimal places) for "
    grade_msg <- "Course grade is "
    percent_sign <- "%"
    course_grade <- 0
    return_msg <- ""

    # Check if all course components have grade present
    for(i in seq_len(nrow(course_info))) {
        row <- course_info[i,]
        # print(row)
        comp <- row$'Components'
        weight <- row$'Weights (%)'
        grade <- row$'Grades (%)'
        print(grade)
        
        if (is.na(grade)) {
            return_msg <- paste0(error_msg_missing_value, comp)
            return (return_msg)
        }

        if (nchar(as.character(grade)) != 5) {
            return_msg <- paste0(error_msg_format, comp)
            return (return_msg)
        }

        course_grade <- course_grade + (grade * weight / 100)
    }
    return_msg <- paste0(grade_msg, round(course_grade, 2), percent_sign)

    return (return_msg)


}
