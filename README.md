
<!-- README.md is generated from README.Rmd. Please edit that file -->

# gradecalculatorr

<!-- badges: start -->
[![R-CMD-check](https://github.com/UBC-MDS/gradecalculatorr/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/UBC-MDS/gradecalculatorr/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

## Summary

This R package calculates grades for a course. The package allows users to customize their own course information with self-defined course component names, to update grades for different course components, and even understand how well the final exam needs to be to pass the course or achieve a target final grade.


## Functions

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
## Usage

To get started, we load the library:

```{r setup}
library(gradecalculatorr)
```

Next, let's explore the the function construct_course():  

```{r construct course usingconstruct_course()}
construct_course('dsci524','/') 
#> construct_course('dsci524','/') 
# What is name of dsci524 component #1? lab1
# What is weight percentage of dsci524 component #1? 15
# What is name of dsci524 component #2? lab2
# What is weight percentage of dsci524 component #2? 15
# What is name of dsci524 component #3? lab3
# What is weight percentage of dsci524 component #3? 15
# What is name of dsci524 component #4? lab4
# What is weight percentage of dsci524 component #4? 15
# What is name of dsci524 component #5? quiz1
# What is weight percentage of dsci524 component #5? 20
# What is name of dsci524 component #6? quiz2
# What is weight percentage of dsci524 component #6? 20
#  Components         Weights (%)         Grades (%)
# 1       lab1                 15              <NA>
# 2       lab2                 15              <NA>
# 3       lab3                 15              <NA>
# 4       lab4                 15              <NA>
# 5      quiz1                 20              <NA>
# 6      quiz2                 20              <NA>
```

Then, let's update the grades:

```{r update the grades}
update_component_grade('dsci524.csv', 'lab1', 90.15)
update_component_grade('dsci524.csv', 'lab2', 88.22)
update_component_grade('dsci524.csv', 'lab3', 86.65)
update_component_grade('dsci524.csv', 'lab4', 88.75)
update_component_grade('dsci524.csv', 'quiz1', 90.15)
```

Then, let's calculate how well the quiz2 has to be in order to get 85% total for course 524:

```{r predict quiz2 grade}
predict_final('dsci524.csv', 85)
# > [1] 69.5
```

After quiz2, we know we get 90 for quiz2 and let's calculate the overall grade for course 524:

```{r calculate the overall grade}
update_component_grade('dsci524.csv', 'quiz2', 90.25)
calculate_grade('dsci524.csv')
# > [1] "Course grade is 89.15%"
```


## Contributing

Interested in contributing? Check out the contributing guidelines. Please note that this project is released with a Code of Conduct. By contributing to this project, you agree to abide by its terms.

## Contributors

Members of Group 20 of DSCI524 at UBC: <br> Chen Lin, Edward Yukun Zhang, Shirley Zhang

## License

`gradecalculatorpy` was created by Chen Lin, Edward Yukun Zhang, Shirley Zhang. It is licensed under the terms of the MIT license.
