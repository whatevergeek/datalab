# Course Project for: Getting and Cleaning Data
### By Paul Lorett B. Amazona

1. Data/variables used in the run_analysis.R script
  * activity - contains the activity labels
  * clean_data - contains the processed main data (after cleaning)
  * features - contains the field names of the main data set
  * merged_label - contains the merged result of test and training labels
  * merged_subject - contains the merged result of test and training subjects
  * test_label - contains the loaded data from test/y_test.txt
  * test_set - contains the loaded data from test/X_test.txt
  * test_subject - contains the loaded data from test/subject_test.txt
  * tidy_data - contains the resulting data after getting the average measurements of the subject's activities
  * training_label - contains the loaded data from test/y_test.txt
  * training_set - contains the loaded data from train/X_train.txt
  * training_subject - contains the loaded data from subject_train.txt
  * activity_label - this contains the names of activities (i.e. "standing", "sitting",  "laying",   "walking",  "walkingDownstairs", "walkingUpstairs"  )
  * mean_sd_filter - refers to the list of measurements that pertains only mean or standard deviation
  
2. Variables used in the tidydata.txt output
  * subject: Each row identifies the subject who performed the activity for each window sample. Its values are numeric (integer) and has a range from 1 to 30. 
  *	activity: This refers to the activity performed by the subject (i.e. "standing", "sitting",  "laying",   "walking",  "walkingDownstairs", "walkingUpstairs"  )
  
  The following variables contain the average values per subject and activity. All values are numeric (floating point numbers).
  *	tBodyAccMeanX
  *	tBodyAccMeanY
  *	tBodyAccMeanZ
  *	tBodyAccStdX
  *	tBodyAccStdY
  *	tBodyAccStdZ
  *	tGravityAccMeanX
  *	tGravityAccMeanY
  *	tGravityAccMeanZ
  *	tGravityAccStdX
  *	tGravityAccStdY
  *	tGravityAccStdZ
  *	tBodyAccJerkMeanX
  *	tBodyAccJerkMeanY
  *	tBodyAccJerkMeanZ
  *	tBodyAccJerkStdX
  *	tBodyAccJerkStdY
  *	tBodyAccJerkStdZ
  *	tBodyGyroMeanX
  *	tBodyGyroMeanY
  *	tBodyGyroMeanZ
  *	tBodyGyroStdX
  *	tBodyGyroStdY
  *	tBodyGyroStdZ
  *	tBodyGyroJerkMeanX
  *	tBodyGyroJerkMeanY
  *	tBodyGyroJerkMeanZ
  *	tBodyGyroJerkStdX
  *	tBodyGyroJerkStdY
  *	tBodyGyroJerkStdZ
  *	tBodyAccMagMean
  *	tBodyAccMagStd
  *	tGravityAccMagMean
  *	tGravityAccMagStd
  *	tBodyAccJerkMagMean
  *	tBodyAccJerkMagStd
  *	tBodyGyroMagMean
  *	tBodyGyroMagStd
  *	tBodyGyroJerkMagMean
  *	tBodyGyroJerkMagStd
  *	fBodyAccMeanX
  *	fBodyAccMeanY
  *	fBodyAccMeanZ
  *	fBodyAccStdX
  *	fBodyAccStdY
  *	fBodyAccStdZ
  *	fBodyAccJerkMeanX
  *	fBodyAccJerkMeanY
  *	fBodyAccJerkMeanZ
  *	fBodyAccJerkStdX
  *	fBodyAccJerkStdY
  *	fBodyAccJerkStdZ
  *	fBodyGyroMeanX
  *	fBodyGyroMeanY
  *	fBodyGyroMeanZ
  *	fBodyGyroStdX
  *	fBodyGyroStdY
  *	fBodyGyroStdZ
  *	fBodyAccMagMean
  *	fBodyAccMagStd
  *	fBodyBodyAccJerkMagMean
  *	fBodyBodyAccJerkMagStd
  *	fBodyBodyGyroMagMean
  *	fBodyBodyGyroMagStd
  *	fBodyBodyGyroJerkMagMean
  *	fBodyBodyGyroJerkMagStd
  
