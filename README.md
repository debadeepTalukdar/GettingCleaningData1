# Getting and Cleaning Data Course Project

## Overview
This project demonstrates the ability to collect, clean, and prepare a tidy dataset using the Human Activity Recognition Using Smartphones Dataset.

## Files in this repository

- run_analysis.R → Script that performs all data cleaning steps
- tidy_data.txt → Final tidy dataset with averages
- CodeBook.md → Description of variables and transformations

## What the script does

1. Merges training and test datasets
2. Extracts mean and standard deviation measurements
3. Uses descriptive activity names
4. Labels dataset with clear variable names
5. Creates a second tidy dataset with averages for each subject and activity

## How to run

1. Download and unzip dataset
2. Place folder in working directory
3. Run:

```r
source("run_analysis.R")
