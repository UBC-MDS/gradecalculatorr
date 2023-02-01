#' Loads the 'course.csv' file
#'
#' Takes the path to the course's .csv file as an argument ('course.csv'), reads the file,
#' and saves the file as a dataframe to be returned
#'
#' @param input_file path to the 'course.csv' file
#'
#' @return data.frame which holds the information from 'course.csv'
#' @export
#'
#' @examples NA
load_course <- function(input_file) {
    readr::read_csv(file=input_file)
}

#' Saves the updated course information to a .csv file
#'
#' Takes the data.frame of the course with updated grades, the path to the output
#' file, and saves the data.frame as a .csv
#'
#' @param updated_course_df updated dataframe for the course to be saved as a .csv file
#' @param output_file path to the output .csv file
#'
#' @return None
#' @export
#'
#' @examples NA
save_course_csv <- function(updated_course_df, output_file) {
    readr::write_csv(updated_course_df, file=output_file)
}

#' Saves the updated course information to a .csv file
#'
#' Takes the data.frame of the course with updated grades, the path to the output
#' file, and saves the data.frame as a .csv
#'
#' @param input_file path to the 'course.csv' file
#' @param component name of the component (or assignment) of the course to be updated
#' @param grade numeric grade of the component (or assignment) to be inserted into the data.frame
#'
#' @return None
#' @export
#'
#' @examples NA
update_component_grade <- function(input_file, component, grade) {
    df <- load_course(input_file)
    # print(df)
    grade <- round(grade, 3)
    # print(grade)
    df$`Grades (%)`[df$Components == component] <- grade
    save_course_csv(df, input_file)
}
