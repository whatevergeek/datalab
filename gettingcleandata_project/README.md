# Course Project for: Getting and Cleaning Data
### By Paul Lorett B. Amazona

#### This README.md file describe how the script ("run_analysis.R") works.
#### The following are the steps used to process the data to meet the stated project objectives.

### Objective A: Merge the training and the test sets to create one data set.
1. Load needed data for Objective A
2. Merge training and test sets

### Objective B: Extract only the measurements on the mean and standard deviation for each measurement. 
1. Load additional data for Objective B
2. Get fields related to mean and standard deviation only from the current the working set
3. Assign field names to the merged set
4. Clean the merged set
  * Remove parentheses
  * Standardize casing for mean and standard deviation
  * Remove hyphens from the field names


### Objective C: Use descriptive activity names to name the activities in the data set
1. Load additional data for Objective C
2. Format activity name data
3. Add the new activity names to the main data set

### Objective D: Appropriately label the data set with descriptive variable names. 
1. Label the subject (i.e. add name to the subject field)
2. Combine subject, label, and main data sets (the main data set is already labeled as part of Objective B)

### Objective E: Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
1. Get average for each activity and each subject
2. Since data for activity field got lost in Step 1, repopulate it again
3. Remove the redundant columns used in Step 1
4. Output the tidy data to file

