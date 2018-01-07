---
title: "Code Book: Human Activity Recognition Using Smartphones"
date: "January 7, 2018"
output:
  html_document: default
  word_document: default
---

## DESCRIPTION

The original data was collected from the UCI (Machine Learning Repository):

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Which describes a human activity Recognition database build from the recordings of 30 subjects (aged 19-28 years) performing activities of daily living, while carrying a waist-mounted smartphone (Samsung Galaxy S II) with embedded inertial sensors.

Each person performed six activities: Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing and Laying. Using an embedded accelerometer and gyroscope, capturing 3 axial linear acceleration and 3 axial angular velocity at a constant rate of 50hz. 

The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. Data was collected on 2012-12-10.


## DESCRIPTION OF USED FILES:


1. features.txt: describes the names of the 561 features

2. activity_labels.txt: Tab separated file that links the class labels with the corresponding activity name.

3. subject_test.txt:

Variable type: integer

A vector with 2947 values corresponding to the observations of the testing set, associated with the X_test.text file.

4. subject_train.txt: 

variable type: integer

A vector of 7352 values, corresponding to the observations of the training set, associated with the y_.text file.

5. X_train.txt:  

variable type: numerical

7352 observations corresponding to the features of each training set

6. y_train.txt: a tab separated file that describes the feature description related to each observation from the X_train.txt file

7. X_test.txt:  

variable type: numerical

2947 observations corresponding to the features of each testing set

8. y_test.txt: a tab separated file that describes the feature description related to each observation from the X_test.txt file

## DESCRIPTION OF EACH VARIABLE

subject.test = reads the subject's ID of the testing set

subject.train = reads the subject's ID of the training set

set.test = reads the feature values of the testing set

set.train = reads the feature values of the training set

testing.df = used for binding both subject.test and set.test in a data frame 

testing.m = a matrix used for dealing with the repeated feature values of the testing.df data frame

testing.conv = used to compute the column means of repeated feature values

testing.df = numerical and labeled data frame obtained from testing.conv

testing.df.melt = melted data frame (feature column variables are converted to rows) 

training.df = used for binding both subject.train and set.train in a data frame 

training.m = a matrix used for dealing with the repeated feature values of the training.df data frame

training.conv = used to compute the column means of repeated feature values

training.df = numerical and labeled data frame obtained from training.conv

training.df.melt = melted data frame (feature column variables are converted to rows) 

merged.data = merged data frame with training.df.melt and testing.df.melt

merged.data.mean.sd = merged data frame including only features that contain mean and
standard deviation

merged.data.mean.sd.tidy = output data frame, grouped by subject and activity and the corresponding average of the each feature

