Codebook: UCI HAR Dataset Cleaned Datasets
Two Cleaned datasets are output by the function run_analysis: 
- merge_all.txt - merges the test and train datasets from UCI HAR, then extracts only standard deviation and mean of each measurement.
- summarize_all.txt - Groups the merge_all.txt dataset by Activity and Subject, then shows the mean and standard deviation for each measurement.
Both files have the same column names. For further information on the measurements included, please see the ReadMe file for the original UCI HAR Dataset, available with the download at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

- Subject - numeric value () assigned to the subject of the experiment.
- Activity - character value indicating the Activity performed by the Subject for each row of measurements.


For merge_all.txt, the included measurements are the mean() and std() of the following variables. 
Each measurement has an X, Y and Z column, and each has both a mean and std, resultin 3x2=6 related variables for each measurement
In summarize_all.txt, these variables show the mean and standard deviation per Activity and Subject.
- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

