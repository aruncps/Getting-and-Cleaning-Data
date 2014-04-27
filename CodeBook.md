# Code book for "Getting and Cleaning Data - Peer Assignment"

## Data Exracted
Following text files were uploaded to R variables, file.txt -> variable
 * activity_labels.txt -> activity_labels
 * features.txt -> features
 * subject_test.txt -> subject_test
 * subject_train.txt -> subject_train
 * X_test.txt -> X_test
 * X_train.txt -> X_train
 * y_test.txt -> y_test
 * y_train.txt -> y_train

## Variables and transformation
* variables "subject_train" & "subject_test" are merged into "merge_subject" using "rbind"
* column names are set for variable "merge_subject" as 'SubjectID'
* column names are set for variable "activity_labels" as ('LabelID' & 'LabelDescription')
* variables "X_test" & "X_train" are merged into "merge_X" using "rbind"  
* column names are set for variable "merge_X" using the values from variable "features column 2"
* variables "y_test" & "y_train" are merged into "merge_y" using "rbind"
* column names are set for variable "merge_y" as 'LabelID'
* variables "merge_X" & "merge_y" are merged into "merge_Xy" using "rbind"
* variables "merge_Xy" & "merge_subject" are merged into "merge_Xy_subject" using "cbind"
* variables "merge_Xy_subject" & "activity_labels" are merged into "merge_final" using "merge" on columns 'LabelID'
* Using grep, finding the column names matching pattern Mean and Std and stored in variable "meanstdcol"
* Melting data frame "merge_final" using melt() function with id as ('LabelID','LabelDescription','SubjectID') and variables as the input from the pattern matching "meanstdcol" into dataframe "merge_finalmelt"
* Now, to find the mean grouping by the 'LableDescription and SubjectID' using dcast to dataframe "Tidyset_2"
* Finally writing the output from "Tidyset_2" to text file "Tidydata.txt"