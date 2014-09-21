# Course Project for: Getting and Cleaning Data
# By Paul Lorett B. Amazona


# Objective A: Merge the training and the test sets to create one data set.

## Step A1:  Load needed data for Objective A
training_set <- read.table("./UCI HAR Dataset/train/X_train.txt")
test_set <- read.table("./UCI HAR Dataset/test/X_test.txt")
training_label <- read.table("./UCI HAR Dataset/train/y_train.txt")
test_label <- read.table("./UCI HAR Dataset/test/y_test.txt") 
training_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## Step A2: Merge training and test sets
merged_set <- rbind(training_set, test_set)
merged_label <- rbind(training_label, test_label)
merged_subject <- rbind(training_subject, test_subject)


# Objective B: Extract only the measurements on the mean and standard deviation 
#             for each measurement. 

## Step B1: Load additional data for Objective B
features <- read.table("./UCI HAR Dataset/features.txt")
mean_sd_filter <- grep("mean\\(\\)|std\\(\\)", features[, 2])


## Step B2: Get fields related to mean and standard deviation only from the current the working set
merged_set <- merged_set[, mean_sd_filter]

## Step B3: Assign field names to the merged set
names(merged_set) <- features[mean_sd_filter,2]


## Step B4: Clean the merged set
### B4.1: Remove parentheses
names(merged_set) <- gsub("\\(\\)", "", features[mean_sd_filter, 2])
### B4.2: Standardize casing for mean and standard deviation
names(merged_set) <- gsub("mean", "Mean", names(merged_set))
names(merged_set) <- gsub("std", "Std", names(merged_set))
### B4.3: Remove hyphens from the field names
names(merged_set) <- gsub("-", "", names(merged_set))


# Objective C: Use descriptive activity names to name the activities in the data set

## Step C1: Load additional data for Objective C
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")

## Step C2: Format activity name data
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))

## Step C3: Add the new activity names to the main data set
activity_label <- activity[merged_label[, 1], 2]
merged_label[, 1] <- activity_label
names(merged_label) <- "activity"


# Objective D: Appropriately label the data set with descriptive variable names. 

## Step D1: Label the subject
names(merged_subject) <- "subject"

## Step D2: Combine subject, label, and main data sets
clean_data <- cbind(merged_subject, merged_label, merged_set)


# Objective E: Create a second, independent tidy data set with the average of each 
#             variable for each activity and each subject. 

## Step E1: Get average for each activity and each subject
tidy_data <- aggregate(clean_data, by=list(clean_data$activity, clean_data$subject), 
          FUN=mean, na.rm=TRUE)
## Step E2: Since data for activity field got lost in Step E1, repopulate it again
tidy_data[,4] <- tidy_data[,1] 

## Step E3: Remove the redundant columns used in Step E1
tidy_data["Group.1"] <- NULL
tidy_data["Group.2"] <- NULL

## Step E4: output the tidy data to file
write.table(tidy_data, "tidydata.txt", row.name=FALSE) 
