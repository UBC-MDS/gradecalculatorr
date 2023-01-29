library(readr)
library(tidyr)
library(devtools)
library(testthat)

# Set values
input_file_all <- 'grades_all.csv'
input_file_miss <- 'grades_miss.csv'
input_file_miss_two <- 'grades_miss_two.csv'
goal <- 80.0

# Call the target function and check if all assignment weight sum up to 100%
test_that('all assignment weight sum up to 100%', {
  error_msg1 <- "Your total assignment weights are not summing up to 100%! Please update all your assignments."
  expect_error(expect_equal(predict_final(input_file_all, goal),  error_msg1))
})

# Call the target function and check if final score (in the last row) is NA
test_that('final score (in the last row) is NA', {
  error_msg2 <- "Your final assignment score is already updated. Please directly use calculate_grade()."
  expect_equal(predict_final(input_file_all, goal),  error_msg2)
  expect_error(expect_equal(predict_final(input_file_miss, goal),  error_msg2))

})

# Call the target function and check if there if more than one NA value in the 'Grades (%)' column
test_that('more than one NA value in the Grades (%) column', {
  error_msg3 <- "Please update all your assignment scores except the final."
  expect_equal(predict_final(input_file_miss_two, goal),  error_msg3)
  expect_error(expect_equal(predict_final(input_file_miss, goal),  error_msg3))

})

# Check the values calculated for the target function
test_that('final score needed is 79', {
  expect_equal(predict_final(input_file_miss, goal),  79)
})
