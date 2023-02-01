file_path <- 'dsci524_grades_all.csv'

# file_path = 'dsci524_grades_format.csv'
# file_path = 'dsci524_grades_miss.csv'

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

for (i in seq_len(nrow(course_df))) {
  comp <- course_df[i, "Components"]
  grade <- course_df[i, "Grades (%)"]

  # Make sure generated .csv has third column "Grades (%)"
  # with all non-Nan values (no missing values)
  test_that(paste0("Course component grades have missing values for ", comp), {
    expect_false(is.na(grade))
  })

  # Make sure generated .csv has third column "Grades (%)"
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