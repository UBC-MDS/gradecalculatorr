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
#' @export
#'
#' @examples NA
construct_course <- function(course_name, output_file_path) {

    course_total_weight <- 0
    course_df <- data.frame(Components = character(),
                 Weights = numeric(),
                 Grades = numeric())
    colnames(course_df) <- c("Components", "Weights_Percentage", "Grades_Percentage")
    index <- 0

    while (course_total_weight < 100) {
        curr_component <- c()

        curr_component_name <- readline(sprintf("What is name of %s component #%d? ",
                                                course_name,
                                                index + 1))

        curr_component_weight_input <- readline(sprintf("What is weight percentage of %s component #%d? ",
                                                        course_name,
                                                        index + 1))
        curr_component_weight_input <- as.integer(curr_component_weight_input)

        while (!is.numeric(curr_component_weight_input)) {
            curr_component_weight_input <- readline(sprintf("Input weight percentage of %s component #%d as integer? ",
                                                            course_name,
                                                            index + 1))
        }

        curr_component_weight <- as.numeric(curr_component_weight_input)

        while (course_total_weight + curr_component_weight > 100) {
            curr_component_weight <- as.numeric(readline(sprintf("Double check the weight of %s component #%d, ensure total weight not over 100%%? ",
                                                                 course_name,
                                                                 index + 1)))
        }

        curr_component <- c(curr_component_name, curr_component_weight, NA)

        course_df[index + 1, ] <- curr_component

        course_total_weight <- course_total_weight + curr_component_weight

        index <- index + 1
    }

    # save course construction dataframe as csv file
    cwd <- getwd()
    path <- paste0(cwd, output_file_path)
    filepath <- file.path(path, paste0(course_name, ".csv"))
    write.csv(course_df, filepath)

    return(course_df)
}
