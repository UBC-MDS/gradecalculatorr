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

