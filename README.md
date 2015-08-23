# README
This readme addresses the steps taken to obtain, clean and summarize the UCI HAR Dataset.  

Before running the function to clean and summarize the dataset, you must download and extract the dataset to your working directory.  
- Download link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

Once downloaded, clean and summarize the dataset using run_analyis(). This function produces two files: merge_all.txt and summarize_all.txt.  

###Step 1  
Pre-process the column headers:  
- read in the features.txt file from the dataset. This file contains the values to be used as column names.  
- Store the column name values as a character vector.  
- Using gsub function, remove parentheses and known typos from the column names to make them more readable. Abbreviations have been retained to facilitate ease of further processing.  
- Add two additional labels to the beginning of the character vector: "Subject" and "Activity."  
###Step 2  
Pre-process the test and train datasets separately. For each dataset:  
- read in the test dataset: /UCI HAR Dataset/test/X_test.txt or /UCI HAR Dataset/train/X_train.txt. This file contains the measurements taken on each subject performing each activity.  
- read in the subject labels for each row in each dataset. (/UCI HAR Dataset/test/subject_test.txt or /UCI HAR Dataset/train/subject_train.txt)  
- read in the activty labels for each row in each dataset (/UCI HAR Dataset/test/y_test.txt or /UCI HAR Dataset/train/y_train.txt)  
- Set the names of the columns to the names stored in the pre-processed character vector created in Step 1.  
###Step 3  
Combine the two data.frames for the test and train datasets; complete further processing of the merged set; and write the data to file:  
- cbind the two data.frames together.  
- Using dplyr select(), extract only Mean and Standard Deviation columns. In this analysis, mean and standard deviation are broadly interpreted to include columns with "mean" or "std" in the name, but not meanFreq since this is a weighted average or angle since this is an angle between to vectors rather than a discrete measurement(?).   
- Replace numeric Activty labels with meaningful character labels drawn from /UCI HAR Dataset/activity_labels.  
###Step 4  
Create second tidy data set that groups the rows by Subject and Activity and shows the average (mean) of each measurement.  
- Using dplyr group_by, group a second data.frame by Activity then Subject  
- Use summarise_each() to apply the mean function to each column.  
- Extract column names to a character vector and distinguish from original column names using gsub as follows:  
+ Add "grp_" to the Activity and Subject column headers  
+ Add "_avg" to the measurement columns headers.  