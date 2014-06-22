# Course Project for: Getting and Cleaning Data
# By Paul Lorett B. Amazona
#


# Go to UCI directory:
setwd('./UCI HAR Dataset/');


#Objective 1: Merge the training and the test sets to create one data set.
x_train = read.table('./train/x_train.txt',header=FALSE); 
y_train = read.table('./train/y_train.txt',header=FALSE);


#Objective 2: Extract only the measurements on the mean and standard deviation 
#             for each measurement. 


#Objective 3: Use descriptive activity names to name the activities in the data set


#Objective 4: Appropriately label the data set with descriptive variable names. 


#Objective 5: Create a second, independent tidy data set with the average of each 
#             variable for each activity and each subject. 