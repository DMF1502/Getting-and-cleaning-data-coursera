# Code Book
This code book describes the data which was used to create the Tidy Data Set, as well as the variables, and all transformations performed to create the Set.

## Dowload data
All data was downloadesd from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip". A full description of the data used for the project can be found in "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"

## Run_analysis.R
This Script 
* merges the training and test sets to create one data set
* extracts the mean and standard deviation of each measurement
* uses descriptive names in the activities
* labels the data
* creates an independent tidy data set, stored in TidyDataSet.txt

## Labels
The data set is labeled with descriptive variable names:
  walking 
  walkingupstairs 
  walkingdownstairs 
  sitting 
  standing 
  laying 
  Accelerometer
  Gyroscope
  Body
  Magnitude
  Time
  Frequency
  TimeBody
  Mean
  StandardDeviation
  Angle
  Gravity

# Tidy Data Set
The final data set has 180 rows x 88 columns and summarizes the data from the train set and the test set. It is exported in a text file.

