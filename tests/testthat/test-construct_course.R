file_path <- 'dsci524.csv'

course_df <- readr::read_csv(file_path)
# course_df <- readr::read_csv(file_path, col.names = TRUE)
# course_df
columns <- colnames(course_df)

# message(colnames(course_df))
# message(head(course_df))

# Make sure generated .csv file has 3 columns
test_that("Course information table column number is not 4", {
    expect_equal(length(columns), 4)
})

# Make sure generated .csv has first column as "Components"
test_that("Course information table first column is not 'Components'", {
    expect_equal(columns[2], "Components")
})

# Make sure generated .csv has second column as "Weights (%)"
test_that("Course information table second column is not 'Weights (%)'", {
    expect_equal(columns[3], "Weights (%)")
})

# Make sure generated .csv has third column as "Grades (%)"
test_that("Course information table third column is not 'Grades (%)'", {
    expect_equal(columns[4], "Grades (%)")
})

# Make sure generated .csv has second column "Weights (%)" add up to 100%
test_that("Course component weights not adding up to 100%", {
    expect_equal(sum(course_df[, "Weights (%)"]), 100)
})

# Make sure generated .csv has third column "Grades (%)" with all NANs
test_that("Course component grades should all be NAN for now", {
    expect_true(all(is.na(course_df[, "Grades (%)"])))
})

# test_that("Call construct_course()", {
#     expect_equal(construct_course('dsci524', '/'), "Call made")
# })
