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
#' @examples load_course('DSCI100.csv')
load_course <- function(input_file) {
    
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
#' @examples save_course_csv(DSCI100_df, 'DSCI100.csv')
save_course_csv <- function(updated_course_df, output_file) {
    
}
