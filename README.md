# Getting and Cleaning Data

## Raw Data
Data collected from the accelerometers from the Samsung Galaxy S smartphone
* File Link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Tidy Data
To create one R script called run_analysis.R that does the following. Merges the training and the test sets to create one data set. Extracts only the measurements on the mean and standard deviation for each measurement. Uses descriptive activity names to name the activities in the data set Appropriately labels the data set with descriptive activity names. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
* File Link: https://github.com/aruncps/Getting-and-Cleaning-Data/blob/master/Tidydata.txt

## Code Book
* File Link: 

## Recipe (R Code and steps to reproduce)
* File Link: https://github.com/aruncps/Getting-and-Cleaning-Data/blob/master/run_analysis.R

1. Setting Working Space
2. Loading reshape2
3. Uploading files, 
 * activity_labels.txt
 * features.txt
 * subject_test.txt
 * subject_train.txt
 * X_test.txt
 * X_train.txt
 * y_test.txt
 * y_train.txt
4. Merging subject files, using row bind
5. Setting Column names for Subject and Activity Label variables
6. Merging training and test data files (X file), using row bind
7. Again, setting Column names for the merged Data set (X file)
8. Merging training and test label files (y file), using row bind
9. Setting Column names, for the label files' variable
10. Merging Data set and labels variable, using column bind
11. Merging Data set, labels and subject files variable, using column bind
12. Merging Data set,labels,subject file and activity labels using merge. To get the TIDY Data Set with all files merged.
13. Finding column names with "Mean" and "Std"
14. Melting for preparing TIDY Data for upload, using melt function 
15. Writing to text file for upload

### Reference
* [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012