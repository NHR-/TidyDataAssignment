TidyDataAssignment  (UPDATE)
==================
Coursera/Data-Science Specialisation/Getting and Cleaning Data/Course Project

The purpose of this project is to process raw data, and to prepare tidy data that can be used for later analysis. 
For that, data collected from the accelerometers from the Samsung Galaxy S smartphone are used. 

Raw Data: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Description: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

run_analysis.R processes the raw data. Before running run_analysis.R, be sure that raw data is downloaded from the link above into the same folder and is unzipped there. You could also use get_raw_data() (currently commented out) for that.

run_analysis.R does the following:

Step 0: Preparing raw data.

Step 1: Merging raw data.

Step 2: Extracting mean and STD measurements

Step 3: Using activity names instead of activity labels

Step 4: Using descriptive labels. Saves the data.frame into tidy_data1.txt.

Step 5: Creating and saving average of each variable for each activity and each subject. Saves the data.frame into tidy_data2.txt.
