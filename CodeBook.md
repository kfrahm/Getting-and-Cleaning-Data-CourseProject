# Code Book
## Getting and Cleaning Data: Course Project
### Overview of Source

This project is based on "Human Activity Recognition Using Smartphones Dataset" from Smartlab (www.smartlab.ws).
A full description of the dataset is available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data was obtained at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The following folders/files were used for this project:
UCI HAR Dataset folder
 * activity_labels.txt - ID and Activity Labels (5 labels)
 * features.txt - ID and Feature (Measurements) Labels (561 labels)
 * features_info.txt - Data dictionary for features
 * README.txt - General information
 * test
   * x_text.txt - All measurements (2947 rows x 561 columns)
   * y_text.txt - Activity label for x_test.txt (2947 rows x 1 column)
 * train
   * x_train.txt - All measurements (7352rows x 561 columns)
   * y_train.txt - Activity label for x_test.txt (7352 rows x 1 column)


### Transformation of Data: run_analysis.R

Steps in the script:

1. Read training and test text files
 * x_text.txt, y_text.txt, x_train.txt, y_train.txt

2. Read activity_label.txt file and create activites table to store activityID to Activity name lookup.

3. Read features.txt file and create features table to store featureID to Feature name lookup. Then create a new column with more readable Feature names.
 * Replace puctuation - ( ) etc. with .
 * Remove . if repeated more than once or appears at the end of the name
 * Replace t prefix with time
 * Replace f prefix with freq (=frequency)
 * Replace Acc with Accelero (=Accelerometer)
 * Replace BodyBody (duplicated) with Body

4. Create a vector which includes variable names only for Mean() and Std().
 * Number of variables reduced from 561 to 66

5. Subset training and test data set to include only mean and std measurements.

6. Rename variable names for training and test data set using features lookup.

7. Add activity column to both training and test data set using activity lookup.

8. Combine training and test data set. Also add subject column.

9. Create a new data set with mean of each variable for each activity/subject.
 * 13 rows (excluding header) x 68 columns2
 * Columns: 2 categorical (subject and activity) + 66 measurements
 * Rows: 2 subjects x 6 activities = 12 rows

10. Create a text file of the mean summary (meanSummary.txt) in the working directory.



### Project Output: meanSummary.txt
This file stores the average of mean and standard diviation measurements per subject and activity. The first 2 columns are categorical data, and all other 66 columns are measurements.

Subject:
* train - constitue of 70% of data
* test - constitute of 30% data

Activity:
* LAYING
* SITTING
* STANDING
* WALKING
* WALKING_DOWNSTAIRS

Variables of Measurements (listed at the bottom) are described with several parts:

Ex) timeBodyAccelero.mean.X, freqBodyAcceleroJerkMag.std

1. Domain Signals
 * time
 * frequency

2. Acceleration Signals
 * Body
 * Gravity

3. Features
 * Accelero = accelerometer
  * Jerk = jerk signals
  * Mag = magnitude
 * Gyro = gyroscope
4. Function
 * mean
 * std = Standard Deviation
 
5. 3-axial raw signals
 * X
 * Y
 * Z

Variable Names (in order):
* timeBodyAccelero.mean.X
* timeBodyAccelero.mean.Y
* timeBodyAccelero.mean.Z
* timeBodyAccelero.std.X
* timeBodyAccelero.std.Y
* timeBodyAccelero.std.Z
* timeGravityAccelero.mean.X
* timeGravityAccelero.mean.Y
* timeGravityAccelero.mean.Z
* timeGravityAccelero.std.X
* timeGravityAccelero.std.Y
* timeGravityAccelero.std.Z
* timeBodyAcceleroJerk.mean.X
* timeBodyAcceleroJerk.mean.Y
* timeBodyAcceleroJerk.mean.Z
* timeBodyAcceleroJerk.std.X
* timeBodyAcceleroJerk.std.Y
* timeBodyAcceleroJerk.std.Z
* timeBodyGyro.mean.X
* timeBodyGyro.mean.Y
* timeBodyGyro.mean.Z
* timeBodyGyro.std.X
* timeBodyGyro.std.Y
* timeBodyGyro.std.Z
* timeBodyGyroJerk.mean.X
* timeBodyGyroJerk.mean.Y
* timeBodyGyroJerk.mean.Z
* timeBodyGyroJerk.std.X
* timeBodyGyroJerk.std.Y
* timeBodyGyroJerk.std.Z
* timeBodyAcceleroMag.mean
* timeBodyAcceleroMag.std
* timeGravityAcceleroMag.mean
* timeGravityAcceleroMag.std
* timeBodyAcceleroJerkMag.mean
* timeBodyAcceleroJerkMag.std
* timeBodyGyroMag.mean
* timeBodyGyroMag.std
* timeBodyGyroJerkMag.mean
* timeBodyGyroJerkMag.std
* freqBodyAccelero.mean.X
* freqBodyAccelero.mean.Y
* freqBodyAccelero.mean.Z
* freqBodyAccelero.std.X
* freqBodyAccelero.std.Y
* freqBodyAccelero.std.Z
* freqBodyAcceleroJerk.mean.X
* freqBodyAcceleroJerk.mean.Y
* freqBodyAcceleroJerk.mean.Z
* freqBodyAcceleroJerk.std.X
* freqBodyAcceleroJerk.std.Y
* freqBodyAcceleroJerk.std.Z
* freqBodyGyro.mean.X
* freqBodyGyro.mean.Y
* freqBodyGyro.mean.Z
* freqBodyGyro.std.X
* freqBodyGyro.std.Y
* freqBodyGyro.std.Z
* freqBodyAcceleroMag.mean
* freqBodyAcceleroMag.std
* freqBodyAcceleroJerkMag.mean
* freqBodyAcceleroJerkMag.std
* freqBodyGyroMag.mean
* freqBodyGyroMag.std
* freqBodyGyroJerkMag.mean
* freqBodyGyroJerkMag.std