## Getting and Cleaning Data: Course Project

This repo will include the following files:
* run_analysis.R - R script to read the file and output text file (tidy data) with analysis
* CodeBook.md - explains the source and the structure of the output file

## Requirement of the Course Project
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


###run_analysis.R

In order to run the script, make sure the downloaded data is extracted to "UCI HAR Dataset" folder in the working directory. The "UCI HAR Dataset" folder should include "test" and "train" subfolders with 2 text files each. For the details and location of the source, refer to CodeBook.md.

This file includes a function which performs the requirement described above and write a output file "meanSummary.txt" in the working folder.

Actual Steps in the script:

1. Read training and test text files and merge them at the end.
2. Create activites table to store activityID to Activity name lookup.
3. Create features table to store featureID to Feature name lookup. Then create a new column with more readable Feature names.
4. Create a vector which includes variable names only for Mean() and Std().
5. Subset training and test data set to include only mean and std measurements.
6. Rename variable names for training and test data set using features lookup.
7. Add activity column to both training and test data set using activity lookup.
8. Combine training and test data set. Also add subject column.
9. Create a new data set with mean of each variable for each activity/subject.
10. Create a text file of the mean summary (meanSummary.txt) in the working directory.

For details of the output file, refer to CodeBook.md.