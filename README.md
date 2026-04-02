# Getting and Cleaning Data Course Project

## Overview
This project demonstrates the collection, cleaning, and tidying of the Human Activity Recognition dataset.

## Files in this repository
- run_analysis.R: Script that performs the data cleaning
- tidy_data.txt: Final tidy dataset
- CodeBook.md: Description of variables and transformations

## Steps performed
1. Merged training and test datasets
2. Extracted mean and standard deviation measurements
3. Used descriptive activity names
4. Labeled dataset with clear variable names
5. Created a second tidy dataset with averages

## How to run
Place the dataset in the working directory and run:
```r
source("run_analysis.R")
