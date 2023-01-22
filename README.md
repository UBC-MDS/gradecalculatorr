
<!-- README.md is generated from README.Rmd. Please edit that file -->

# gradecalculatorr

<!-- badges: start -->
<!-- badges: end -->

## Summary

This R package calculates grades for a course. The package allows users to customize their own course information with self-defined course component names, to update grades for different course components, and even understand how well the final exam needs to be to pass the course or achieve a target final grade.

## Usage

### Functions

This package contains the following functions:

- `construct_course`: Allow users to input the information for one course component (for example, assignment name and corresponding weight) one by one. Saves the course information as a .csv file to the specified file path. (Note: any user self-defined course component name(s) can be accepted)

- `update_grades`: Allow users to update course component grade(s) by loading a certain saved course .csv file. The function can then save the updated course information as a new .csv file to the specified file path.
  
- `predict_final`: Calculate how well the final exam has to be in order to pass the course or achieve a certain grade just before the final exam (for the scenario only when the final grade is missing), based on the provided other course component information.

- `calculate_grade`: When all course components are presented, calculate the course overall grade based on information provided. 

## Suitability within R Ecosystem

This course grade calculator is unique as it provides an interactive way for users to input the course component information and update information as needed. With the `predict_final` function available, users can understand how well the final exam has to be in order to pass the course or achieve a certain level of grade in this course, then adjust their final review plans based on our calculation, to meet the course expectation.

The package `predict_final` function does not take any users' previous study or course information into account to calculation of the desired final performance, only based on the current course component information inputted/updated. 

There are other course grade calculators in the R ecosystem. An similar example can be found [here](https://cran.r-project.org/web/packages/gradeR/index.html) but it serves a group of students. While other packages focus on auto-grading or group of students without user interaction and they do not provide similar functions like `predict_final` function in this package.

## Installation

You can install the development version of gradecalculatorr from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("UBC-MDS/gradecalculatorr")
```

## Contributing

Interested in contributing? Check out the contributing guidelines. Please note that this project is released with a Code of Conduct. By contributing to this project, you agree to abide by its terms.

## Contributors

Members of Group 20 of DSCI524 at UBC: <br> Chen Lin, Edward Yukun Zhang, Shirley Zhang

## License

`gradecalculatorpy` was created by Chen Lin, Edward Yukun Zhang, Shirley Zhang. It is licensed under the terms of the MIT license.
