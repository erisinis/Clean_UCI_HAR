run_analysis<- function(){
  ## This script requires that the dataset UCI HAR Dataset be downloaded and extracted to your working directory prior to running:
  ## x1. Merges the training and the test sets to create one data set. 
  ## X2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  ## x3. Uses descriptive activity names to name the activities in the data set
  ## x4. Appropriately labels the data set with descriptive variable names. 
  ## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  ## per https://class.coursera.org/getdata-031/forum/thread?thread_id=28
  ### Don't need "inertial" folders
  library(data.table)
  library(dplyr)
##Read in feature names file. Keep a separate character vector with the cleaned up column names to use when finding the means of the measurements grouped by Subject and Activity.
  feats<- fread("./UCI HAR Dataset/features.txt", colClasses = "character")
  fhdrs<- feats$V2
  fhdrs<- gsub("\\(\\)-X","X",fhdrs)
  fhdrs<- gsub("\\(\\)-Y","Y",fhdrs)
  fhdrs<- gsub("\\(\\)-Z","Z",fhdrs)
  fhdrs<- gsub("BodyBody", "Body", fhdrs)
  fhdrs<- gsub("-","_",fhdrs)
  hdrs<- c("Subject", "Activity", fhdrs)
##Read in each relevant text file using read.table
  ##X_ files contain accelerometer readings. 
  ##y_ files contain numeric activity labels for each row
  ##subject_ files contain numeric labels for each subject in the study
traindf<- read.table("./UCI HAR Dataset/train/X_train.txt")
trainydf<- read.table("./UCI HAR Dataset/train/y_train.txt")
trainsubjdf<- read.table("./UCI HAR Dataset/train/subject_train.txt")
mtrain<- cbind(trainsubjdf,trainydf,traindf)
setnames(mtrain, hdrs)
mtrain<- mtrain[, !duplicated(colnames(mtrain))]

testdf<- read.table("./UCI HAR Dataset/test/X_test.txt")
testydf<- read.table("./UCI HAR Dataset/test/y_test.txt")
testsubjdf<- read.table("./UCI HAR Dataset/test/subject_test.txt")
mtest<- cbind(testsubjdf,testydf,testdf)
setnames(mtest, hdrs)
mtest<- mtest[, !duplicated(colnames(mtest))]

##Extract only Mean and Std columns, then merge the train and test data
merge_all<- rbind(mtrain,mtest)
##Select only columns containing mean and std of measurements. 
merge_all<- select(merge_all, Subject, Activity, contains("mean"),contains("std"),-contains("angle"))
##Replace Activity numbers with names
merge_all$Activity[merge_all$Activity == 1]<- "Walking"
merge_all$Activity[merge_all$Activity == 2]<- "WalkingUpstairs"
merge_all$Activity[merge_all$Activity == 3]<- "WalkingDownstairs"
merge_all$Activity[merge_all$Activity == 4]<- "Sitting"
merge_all$Activity[merge_all$Activity == 5]<- "Standing"
merge_all$Activity[merge_all$Activity == 6]<- "Laying"
print (dim(merge_all))

###Step 5 Using dplyr/summarize
grp_all<- merge_all %>%
  group_by(Activity, Subject) %>%
  summarise_each(funs(mean))

write.csv(hdrs,"hdrs.csv")
write.table(merge_all, file = "merge_all.txt", row.names = TRUE, col.names = TRUE, sep = "\t",quote = FALSE)
write.table(grp_all, file = "summarize_all.txt", row.names = TRUE, col.names = TRUE, sep = "\t",quote = FALSE)
}