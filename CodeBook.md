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

## VARIABLES DESCRIPTION

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value

std(): Standard deviation

mad(): Median absolute deviation 

max(): Largest value in array

min(): Smallest value in array

sma(): Signal magnitude area

energy(): Energy measure. Sum of the squares divided by the number of values. 

iqr(): Interquartile range 

entropy(): Signal entropy

arCoeff(): Autorregresion coefficients with Burg order equal to 4

correlation(): correlation coefficient between two signals

maxInds(): index of the frequency component with largest magnitude

meanFreq(): Weighted average of the frequency components to obtain a mean frequency

skewness(): skewness of the frequency domain signal 

kurtosis(): kurtosis of the frequency domain signal 

bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.

angle(): Angle between to vectors.


Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean

tBodyAccMean

tBodyAccJerkMean

tBodyGyroMean

tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'


