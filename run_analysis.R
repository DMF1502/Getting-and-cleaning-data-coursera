## Run Analysis
# This script consists of five steps to merge, extract data, appropriately label a data set to create a second, independently data set stored in the Tidy Data Set file.

## 1 Merges the training and the test sets to create one data set.
# Dowload files
library(dplyr)
fileURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "C:/Users/Daniela/Documents/R Coursera/Getting-and-cleaning-data-coursera/UCIHARDataset.zip", method = "curl")
Features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
Activity_lables <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
TestS <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
TestX <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
TestY <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
TrainS <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
TrainX <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
TrainY <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

# Merge X Train and X Test
X <- rbind(TrainX, TestX)
# Merge Y Train and Y Test
Y <- rbind(TrainY, TestY)
# Merge Subject train and Subject Test
Sub <- rbind(TrainS, TestS)
# C Bind to create one data set
Data_merged <- cbind(Sub, Y, X)

## 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
Data_tidy <- Data_merged %>% select(subject, code, contains("mean"), contains("std"))

## 3 Uses descriptive activity names to name the activities in the data set
Data_tidy$code <- Activity_lables[Data_tidy$code, 2]

## 4 Appropriately labels the data set with descriptive variable names. 
names(Data_tidy)[2] = "activity"
names(Data_tidy)<-gsub("Acc", "Accelerometer", names(Data_tidy))
names(Data_tidy)<-gsub("Gyro", "Gyroscope", names(Data_tidy))
names(Data_tidy)<-gsub("BodyBody", "Body", names(Data_tidy))
names(Data_tidy)<-gsub("Mag", "Magnitude", names(Data_tidy))
names(Data_tidy)<-gsub("^t", "Time", names(Data_tidy))
names(Data_tidy)<-gsub("^2f", "Frequency", names(Data_tidy))
names(Data_tidy)<-gsub("tBody", "TimeBody", names(Data_tidy))
names(Data_tidy)<-gsub("-mean()", "Mean", names(Data_tidy), ignore.case = TRUE)
names(Data_tidy)<-gsub("-std()", "StandardDeviation", names(Data_tidy), ignore.case = TRUE)
names(Data_tidy)<-gsub("-freq()", "Frequency", names(Data_tidy), ignore.case = TRUE)
names(Data_tidy)<-gsub("angle", "Angle", names(Data_tidy))
names(Data_tidy)<-gsub("gravity", "Gravity", names(Data_tidy))

## 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Cleaned_Data <- Data_tidy %>% 
    group_by(subject, activity) %>%
    summarise_all(funs(mean))
write.table(Cleaned_Data, "Cleaned_Data.txt", row.name = FALSE)
