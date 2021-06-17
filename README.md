# Getting-and-cleaning-data-coursera
This is the repository for the final Project of the "Getting and Cleaning Data" Course. It's purpose is to demonstrate the ability to collect, work with and clean a data set. 
This README.md file explains how all the scripts work and how they are connected. This repository has three other files: Code Book, Run_Analysis R script and the Tidy Data Set. The purpose is to merge data from two sets (training and test set), extract certain measurments, and label the set appropriately.

# Code Book 
In this file all variables, data, and transformations of the work used to create the Tidy_Data set, are described.
Data is taken from the original file: "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"  

# Run_Analysis
This script does the following steps to create the Tidy Data Set:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. This is presented in the Tidy Data Set.

# Tidy Data Set
This is an independent tidy data set that was made merging the training and test set. The data set has the average of each variable of each activity and subject, uses descriptive activity names, and labels the data with descriptive variable names.
