README
This readme addresses the steps taken to obtain, clean and summarize the UCI HAR Dataset.

Before running the function to clean and summarize the dataset, you must download and extract the dataset to your working directory.
- Download link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Once downloaded, clean and summarize the dataset using run_analyis(). This function produces two files: merge_all.txt and summarize_all.txt.

merge_all is generated using the following steps.
Pre-process the column headers:
- read in the features.txt file from the dataset. This file contains the values to be used as column names.
- remove special characters from the column names to make them more readable. Abbreviations have been retained to facilitate ease of further processing.
Pre-process test dataset:
- read in the test dataset: /UCI HAR Dataset/test/X_test.txt. This file contains the measurements taken on each subject performing each activity.
- read in the test subject labels
- read in the test activty labels
  