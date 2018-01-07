---
title: "Class Project - Getting and Cleaning Data"
date: "January 7, 2018"
output:
  html_document: default
  word_document: default
---


The class project for Getting and Cleaning Data consisted in downloading the data of "Human Activity Recognition Using Smartphones" from this URL:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Only the next files are needed for the project and running the script:

features.txt

subject_train.txt

subject_test.txt

X_train.txt

X_test.txt

y_train.txt

y_test.txt



# Steps that must be performed before running the R Script "run_analysis.R":

1. Download from the link above the ZIP file that contains the corresponding files
2. Unzip the file
3. Move the .txt files listed above, into a local directory, including the R script.
4. Once the above steps are completed, you can run the R script (run_analysis.R). Note that it requires the data.table, dplyr, plyr and reshape2 packages. All can be downloaded from CRAN.
5. Output of the R script is a tidy data set named: tidy.csv

