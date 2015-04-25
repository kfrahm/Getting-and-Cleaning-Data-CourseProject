run_analysis <- function(){
     ## This function does the following:
     ## 1. Read training and test text files and merge them at the end.
     ## 2. Create activites table to store activityID to Activity name lookup.
     ## 3. Create features table to store featureID to Feature name lookup.
     ##    Then create a new column with more readable Feature names.
     ## 4. Create a vector which includes variable names only for Mean() and Std().
     ## 5. Subset training and test data set to include only mean and std measurements.
     ## 6. Rename variable names for training and test data set using features lookup.
     ## 7. Add activity column to both training and test data set using activity lookup.
     ## 8. Combine training and test data set. Also add subject column.
     ## 9. Create a new data set with mean of each variable for each activity/subject.
     ## 10. Create a text file of the mean summary (meanSummary.txt) in the working directory.
     
     
     ## Read training file
     x_train <- read.table("./UCI HAR Dataset/train/x_train.txt")
     y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", 
                           col.names = c("activityID"))
     ## Read test file
     x_test <- read.table("./UCI HAR Dataset/test/x_test.txt")
     y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", 
                          col.names = c("activityID"))
     
     ## Create Activities data frame to get descriptive activity names
     activities <- read.table("./UCI HAR Dataset/activity_labels.txt", 
                              sep = " ", 
                              col.names = c("activityID", "activity"))
     ## Create Features data frame to get descriptive variable names
     features <- read.table("./UCI HAR Dataset/features.txt", 
                            sep = " ", 
                            col.names = c("fID", "fLabel"))
     
     ## Clean up Features names in a new column "fNewLavel" to make them more readable.
     ## Replace puctuation - ( ) etc. with .
     features$fNewLabel <- gsub("[[:punct:]]", ".", features$fLabel)
     ## Remove . if repeated more than once
     features$fNewLabel <- gsub("\\.{2,}", ".", features$fNewLabel)
     ## Also remove . at the end of the name
     features$fNewLabel <- gsub("\\.$", "", features$fNewLabel)
     ## Replace t prefix with time
     features$fNewLabel <- gsub("^t", "time", features$fNewLabel)
     ## Replace f prefix with freq (=frequency)
     features$fNewLabel <- gsub("^f", "freq", features$fNewLabel)
     ## Replace Acc with Accelero (=Accelerometer)
     features$fNewLabel <- gsub("Acc", "Accelero", features$fNewLabel)
     ## Lastly replace BodyBody (duplicated) with Body
     features$fNewLabel <- gsub("BodyBody", "Body", features$fNewLabel)
     
     ## Create a vector of Feature IDs which includes measurements on 
     ## only mean() and std()
     colMeanStd <- features[grep("mean\\(\\)|std\\(\\)", features$fLabel), c("fID")]
     
     ## Subset x_train with only Mean and Std measurements
     x_trainMeanStd <- x_train[, colMeanStd]
     ## Subset x_test with only Mean and Std measurements
     x_testMeanStd <- x_test[, colMeanStd]
     
     ## Rename variable names of x_trainMeanStd and x_testMeanStd
     colID <- data.frame(ID = names(x_trainMeanStd)) ## Original Column Names
     colID$fID <- gsub("V", "", colID$ID) ## Add fID removing V from ID
     ## Add Feature Names to colNames merging with features data frame by fID
     colNames <- merge(colID, features, 
                       by.x = "fID", by.y = "fID", 
                       all = FALSE, sort = FALSE)
     ## Assign new Feature Names as variable names of x_trainMeanStd and x_testMeanStd
     colnames(x_trainMeanStd) <- colNames$fNewLabel
     colnames(x_testMeanStd) <- colNames$fNewLabel
     
     
     ## Add set and Activity columns in x_trainMeanSts and x_testMeanStd data frame
     dsTrain <- cbind(subject = "train",  ## subject column - train or test
                      activity = merge(y_train, activities, ## acttivity column
                                        by.x = "activityID", by.y = "activityID", 
                                        all = FALSE, sort = FALSE)[, "activity"],
                      x_trainMeanStd) ## training set data frame
     dsTest <- cbind(subject = "test", ## subject column - train or test
                     activity = merge(y_test, activities, ## acttivity column
                                       by.x = "activityID", by.y = "activityID", 
                                       all = FALSE, sort = FALSE)[, "activity"], 
                     x_testMeanStd) ## test set data frame
     ## Combine training data set and test data set
     ds <- rbind(dsTrain, dsTest)
     
     ## Create a new data frame with mean of each variable for each activity/subject
     meanSummary <- aggregate(ds[, -c(1, 2)], ## skip first 2 colums 
                              by = list(subject = ds$subject, activity = ds$activity), mean)
     
     ## Write meanSummary data fram as text file in the working directory
     write.table(meanSummary, file = "meanSummary.txt", sep=" ", row.names = FALSE)
}