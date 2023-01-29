library(tidyr)
library(readr)
library(testthat)

file_path <- 'dsci524_grades_all.csv'

# file_path = 'dsci524_grades_format.csv'
# file_path = 'dsci524_grades_miss.csv'

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

for (i in seq_len(nrow(course_df))) {
  comp <- course_df[i, "Components"]
  grade <- course_df[i, "Grades_Percentage"]

  # Make sure generated .csv has third column "Grades_Percentage"
  # with all non-Nan values (no missing values)
  test_that(paste0("Course component grades have missing values for ", comp), {
    expect_false(is.na(grade))
  })

  # Make sure generated .csv has third column "Grades_Percentage"
  # with all values with 2 decimals
  test_that(paste0("Course component grades should be with 2 decimals for", comp), {
    expect_equal(nchar(substr(as.character(grade),
                 nchar(as.character(grade)) - 1,
                 nchar(as.character(grade)))), 2)
  })
}

test_that("Calculation of the calculation is incorrect", {
  expect_equal(calculate_grade(file_path), "Course grade is 86.5%")
})