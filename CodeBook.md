# Code Book
## Getting and Cleaning Data: Course Project
### This includes overview and data dictionary of the output file (meanSummary.txt)

This project is based on "Human Activity Recognition Using Smartphones Dataset" from Smartlab (www.smartlab.ws).
A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
The data was obtained at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### meanSummary.txt
This file stores the average of mean and standard diviation measurements per subject and activity.

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
** Jerk = jerk signals
** Mag = magnitude
* Gyro = gyroscope
4. Function
* mean
* std = Standard Deviation
5. 3-axial raw signals
* X
* Y
* Z

Variable Names:
timeBodyAccelero.mean.X
timeBodyAccelero.mean.Y
timeBodyAccelero.mean.Z
timeBodyAccelero.std.X
timeBodyAccelero.std.Y
timeBodyAccelero.std.Z
timeGravityAccelero.mean.X
timeGravityAccelero.mean.Y
timeGravityAccelero.mean.Z
timeGravityAccelero.std.X
timeGravityAccelero.std.Y
timeGravityAccelero.std.Z
timeBodyAcceleroJerk.mean.X
timeBodyAcceleroJerk.mean.Y
timeBodyAcceleroJerk.mean.Z
timeBodyAcceleroJerk.std.X
timeBodyAcceleroJerk.std.Y
timeBodyAcceleroJerk.std.Z
timeBodyGyro.mean.X
timeBodyGyro.mean.Y
timeBodyGyro.mean.Z
timeBodyGyro.std.X
timeBodyGyro.std.Y
timeBodyGyro.std.Z
timeBodyGyroJerk.mean.X
timeBodyGyroJerk.mean.Y
timeBodyGyroJerk.mean.Z
timeBodyGyroJerk.std.X
timeBodyGyroJerk.std.Y
timeBodyGyroJerk.std.Z
timeBodyAcceleroMag.mean
timeBodyAcceleroMag.std
timeGravityAcceleroMag.mean
timeGravityAcceleroMag.std
timeBodyAcceleroJerkMag.mean
timeBodyAcceleroJerkMag.std
timeBodyGyroMag.mean
timeBodyGyroMag.std
timeBodyGyroJerkMag.mean
timeBodyGyroJerkMag.std
freqBodyAccelero.mean.X
freqBodyAccelero.mean.Y
freqBodyAccelero.mean.Z
freqBodyAccelero.std.X
freqBodyAccelero.std.Y
freqBodyAccelero.std.Z
freqBodyAcceleroJerk.mean.X
freqBodyAcceleroJerk.mean.Y
freqBodyAcceleroJerk.mean.Z
freqBodyAcceleroJerk.std.X
freqBodyAcceleroJerk.std.Y
freqBodyAcceleroJerk.std.Z
freqBodyGyro.mean.X
freqBodyGyro.mean.Y
freqBodyGyro.mean.Z
freqBodyGyro.std.X
freqBodyGyro.std.Y
freqBodyGyro.std.Z
freqBodyAcceleroMag.mean
freqBodyAcceleroMag.std
freqBodyAcceleroJerkMag.mean
freqBodyAcceleroJerkMag.std
freqBodyGyroMag.mean
freqBodyGyroMag.std
freqBodyGyroJerkMag.mean
freqBodyGyroJerkMag.std
