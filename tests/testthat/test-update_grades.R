test_that('update_component_grade() updates the grade of a component in the .csv file correctly', {
    
  # set values
    input_file_path <- 'dummycourse.csv'
    component <- 'Midterm 2'
    expected <- 92.3 

    # call function 
    update_component_grade(input_file_path, component, expected)

    # compare output with expected grade
    df <- read_csv(file=input_file_path)
    expect_equal(df$`Grades (%)`[df$Components == component], expected)
    
}) 

test_that('update_component_grade() only updates the one row that was specified to be updated', {

    # set values
    input_file_path <- 'dummycourse.csv'
    component <- "Assignment 3"
    expected <- 97

    # get original grades list 
    df <- read_csv(file=input_file_path)
    df_og_list <- df$`Grades (%)`

    # update csv and get new list
    update_component_grade(input_file_path, component, expected)
    df2 <- read_csv(file=input_file_path)
    df2_list <- df2$`Grades (%)`

    # get index of component 
    comp_index <- which(df$Components == component)

    # update original grades list with expected grade 
    df_og_list[comp_index] <- expected 

    # compare the two lists 
    expect_equal(df_og_list, df2_list)    
    
})

test_that('update_component_grade() creates a dataframe with the right dimensions', {

    # set values
    input_file_path <- 'dummycourse.csv'
    component <- 'Final Exam'
    expected <- 99

    # read original dataframe
    df <- read_csv(file=input_file_path)

    # call function 
    update_component_grade(input_file_path, component, expected)
    df2 <- read_csv(file=input_file_path)

    # compare new dataframe size 
    expect_equal(dim(df), dim(df2))
    
})