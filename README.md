TidyDataAssignment 
==================

Project
------------------

Coursera/Data-Science Specialisation/Getting and Cleaning Data/Course Project

This repo contains files necessary for peer assessment as a part of "Getting and Cleaning Data" Course. For more details please see:
https://class.coursera.org/getdata-016


The purpose of this project is to process raw data, and to prepare tidy data that can be used for later analysis. 
For that, data collected from the accelerometers from the Samsung Galaxy S smartphone are used. 
For full description please see:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


The Raw Data used in this assignment is downloaded from

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Assignment as described by the Instructors
-------------------

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


run_analysis.R
-------------------

The tasks described in the assignment are broken into the following steps; to each, a function is dedicated in run_analysis.R which are called sequentially. 

Step 0: Preparing raw data. get_raw_data() prepares the raw data; either by downloading and unzipping or - to avoid downloading and unzipping hundreds of MB files over and over - by confirming their existence in correct format.

Step 1: Merging raw data. merge_raw_data() loads raw data into data.frames, merges them into a single data.frame, and returns it.

Step 2: Extracting mean and STD measurements. subset_mean_and_STD() subsets data and extracts only the measurements on mean and STD and returns the updated data.frame.

Step 3: Using activity names instead of activity labels. update_activity_labels(), using label-name mapping, updates the "Activity_type" column and returns the updated data.frame.

Step 4: Using descriptive labels and Saving the data.frame into tidy_data1.txt. create_and_write_output_1() does so.

Step 5: Creating and saving average of each variable for each activity and each subject. create_and_write_output_2 does so and saves the result into tidy_data2.txt.


tidy_data1.txt  and tidy_data2.txt
------------------

Outputs of run_analysis.R. See Code Book for more details


features_info.txt and features.txt
------------------

features as described by the creators of the original data sets.
