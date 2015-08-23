run_analysis<- function(){
  ## per https://class.coursera.org/getdata-031/forum/thread?thread_id=28
  ### Don't need "inertial" folders
  library(data.table)
  library(dplyr)
##Read in feature names file. Keep a separate character vector with the cleaned up column names to use when finding the means of the measurements grouped by Subject and Activity.
  feats<- fread("./UCI HAR Dataset/features.txt", colClasses = "character")
  fhdrs<- feats$V2
  fhdrs<- gsub("\\(\\)-X$","-X",fhdrs)
  fhdrs<- gsub("\\(\\)-Y$","-Y",fhdrs)
  fhdrs<- gsub("\\(\\)-Z$","-Z",fhdrs)
  fhdrs<- gsub("BodyBody", "Body", fhdrs)
  #fhdrs<- gsub("-","_",fhdrs)
  fhdrs<-gsub("()","",fhdrs, fixed = TRUE)
  #fdrs<-gsub("\\)","",fhdrs)
  hdrs<- c("Subject", "Activity", fhdrs)
##Read in each relevant text file for train and test using read.table
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

##then merge the train and test data
merge_all<- rbind(mtrain,mtest)
##Select only columns containing mean and std of measurements. 
merge_all<- select(merge_all, Subject, Activity, contains("mean"),contains("std"),-contains("angle"),-contains("Freq"))
##Replace Activity numbers with names
merge_all$Activity[merge_all$Activity == 1]<- "Walking"
merge_all$Activity[merge_all$Activity == 2]<- "WalkingUpstairs"
merge_all$Activity[merge_all$Activity == 3]<- "WalkingDownstairs"
merge_all$Activity[merge_all$Activity == 4]<- "Sitting"
merge_all$Activity[merge_all$Activity == 5]<- "Standing"
merge_all$Activity[merge_all$Activity == 6]<- "Laying"
print (dim(merge_all))

###Group by Activity and Subject, then average (mean) each measurement column. 
grp_all<- merge_all %>%
  group_by(Activity, Subject) %>%
  summarise_each(funs(mean))
##Update column names for grouped/averaged data
grpall_nms<- colnames(grp_all)
grpall_nms<- gsub("-X", "-X_avg", grpall_nms)
grpall_nms<- gsub("-Y", "-Y_avg", grpall_nms)
grpall_nms<- gsub("-Z", "-Z_avg", grpall_nms)
grpall_nms<- gsub("-mean", "-mean_avg", grpall_nms)
grpall_nms<- gsub("-std", "-std_avg", grpall_nms)
grpall_nms<- gsub(".Activity$","grp_Activity", grpall_nms)
grpall_nms<- gsub(".Subject$", "grp_Subject", grpall_nms)
setnames(grp_all, grpall_nms)
print(dim(grp_all))

#write.csv(colnames(merge_all),"merge_hdrs.csv")
#write.csv(colnames(grp_all), "grp_hdrs.csv")
write.table(merge_all, file = "merge_all.txt", row.names = FALSE, col.names = TRUE, sep = "\t",quote = FALSE)
write.table(grp_all, file = "summarize_all.txt", row.names = FALSE, col.names = TRUE, sep = "\t",quote = FALSE)
}