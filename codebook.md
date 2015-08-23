Codebook: UCI HAR Dataset Cleaned Datasets  
Two Cleaned datasets are output by the function run_analysis:   
- merge_all.txt - merges the test and train datasets from UCI HAR, then extracts only standard deviation and mean of each measurement.  
- summarize_all.txt - Groups the merge_all.txt dataset by Activity and Subject, then shows the mean and standard deviation for each measurement.  
For further information on the measurements included, please see the ReadMe file for the original UCI HAR Dataset, available with the download at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

- Subject - numeric value () assigned to the subject of the experiment.  
- Activity - character value indicating the Activity performed by the Subject for each row of measurements.  


For merge_all.txt, the included measurements are the mean (mean()) and standard deviation (std()) of the following measurements. Measurements followed by -XYZ stand in for 6 separate measurements on the X, Y and Z axis or mean and standard deviation. For example: 
-- tBodyAcc-XYZ stands in for:  
-- tBodyAcc-mean-X  
-- tBodyAcc-mean-Y  
-- tBodyAcc-mean-Z  
-- tBodyAcc-std-X  
-- tBodyAcc-std-Y  
-- tBodyAcc-std-Z  

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

In summarize_all.txt, "_avg" is appended to these variable names  and the values show the average mean and standard deviation per Activity and Subject. "Average" here refers to mean. For example, the column names for the tBodyAcc-XYZ averages become:  

-- tBodyAcc-mean-X_avg  
-- tBodyAcc-mean-Y_avg  
-- tBodyAcc-mean-Z_avg  
-- tBodyAcc-std-X_avg  
-- tBodyAcc-std-Y_avg  
-- tBodyAcc-std-Z_avg  

Additionally, the Subject and Activity column headers are prepended with "grp_"  
- grp_Subject  
- grp_Activity  
