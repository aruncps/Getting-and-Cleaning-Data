# File Name     : run_Analysis.R
# Date Created  : 2014-04-27
# Purpose       : Coursera Assignment


You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive activity names. 
Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
# Setting Working Space
# getwd()
# setwd("C:/Mac Move/eBooks/Coursera/Specialization/Data Science/03 Getting and Cleaning Data/Week 3")

# loading reshape2
library(reshape2)

#Uploading files
if(!file.exists("./data")){dir.create("./data")}
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
features <- read.table("./data/UCI HAR Dataset/features.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")

#Merging subject files, using row bind
merge_subject=rbind(subject_train,subject_test)

#Setting Column names
colnames(merge_subject) <- c("SubjectID")
colnames(activity_labels) <- c("LabelID","LabelDescription")

#Merging training and test data files, using row bind
merge_X=rbind(X_train,X_test)
#Setting Column names
colnames(merge_X) <- features[order(features$V1),2]

#Merging training and test label files, using row bind
merge_y=rbind(y_train,y_test)
#Setting Column names
colnames(merge_y) <- c("LabelID")

#Merging labels and data set, using column bind
merge_Xy=cbind(merge_X,merge_y)
#Merging labels and data set and subject file, using column bind
merge_Xy_subject=cbind(merge_Xy,merge_subject)
#Merging data set,labels,subject file and activity lables using merge
#TIDY Data Set 1
merge_final=merge(merge_Xy_subject,activity_labels,by.x="LabelID",by.y="LabelID",all=TRUE)

#finding column names with "Mean" and "Std"
meanstdcol=c(grep("mean[()]",names(merge_final),value=TRUE),grep("std[()]",names(merge_final),value=TRUE))

#Melting for preparing TIDY Data Set 1 
merge_finalmelt<-melt(merge_final,id=c('LabelID','LabelDescription','SubjectID'),measure.var=c(meanstdcol))
#TIDY Data Set 2
Tidyset_2=dcast(merge_finalmelt,formula=LabelDescription+SubjectID ~ variable,mean)
