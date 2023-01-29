library(tidyr)
library(readr)
library(testthat)

file_path <- 'dsci524.csv'

course_df <- read.csv(file_path, header = TRUE)
# course_df <- read.csv(file_path, col.names = TRUE, header = FALSE)
# course_df
columns <- colnames(course_df)

# message(colnames(course_df))
# message(head(course_df))

# Make sure generated .csv file has 3 columns
test_that("Course information table column number is not 3", {
    expect_equal(length(columns), 3)
})

# Make sure generated .csv has first column as "Components"
test_that("Course information table first column is not 'Components'", {
    expect_equal(columns[1], "Components")
})

# Make sure generated .csv has second column as "Weights_Percentage"
test_that("Course information table second column is not 'Weights_Percentage'", {
    expect_equal(columns[2], "Weights_Percentage")
})

# Make sure generated .csv has third column as "Grades_Percentage"
test_that("Course information table third column is not 'Grades_Percentage'", {
    expect_equal(columns[3], "Grades_Percentage")
})

# Make sure generated .csv has second column "Weights_Percentage" add up to 100%
test_that("Course component weights not adding up to 100%", {
    expect_equal(sum(course_df[, "Weights_Percentage"]), 100)
})

# Make sure generated .csv has third column "Grades_Percentage" with all NANs
test_that("Course component grades should all be NAN for now", {
    expect_true(all(is.na(course_df[, "Grades_Percentage"])))
})

# test_that("Call construct_course()", {
#     expect_equal(construct_course('dsci524', '/'), "Call made")
# })
