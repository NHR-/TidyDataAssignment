TidyDataAssignment - Code Book
==================

README.md (UPDATE) For more details on the purpose of the assignment see README.md.
------------------
Details of the assignment.

run_analysis.R 
------------------
The tasks described in the assignment (see README.md for more details) are broken into the following steps; to each, a function is dedicated in run_analysis.R which are called sequentially. 

Step 0: Preparing raw data. get_raw_data() prepares the raw data; either by downloading and unzipping or - to avoid downloading and unzipping hundreds of MB files over and over - by confirming their existence in correct format.

Step 1: Merging raw data. merge_raw_data() loads raw data into data.frames, merges them into a single data.frame, and returns it.

Step 2: Extracting mean and STD measurements. subset_mean_and_STD() subsets data and extracts only the measurements on mean and STD and returns the updated data.frame.

Step 3: Using activity names instead of activity labels. update_activity_labels(), using label-name mapping, updates the "Activity_type" column and returns the updated data.frame.

Step 4: Using descriptive labels and Saving the data.frame into tidy_data1.txt. create_and_write_output_1() does so.

Step 5: Creating and saving average of each variable for each activity and each subject. create_and_write_output_2 does so and saves the result into tidy_data2.txt

tidy_data1.txt (UPDATE)
------------------

Output of Step4. see features.txt for more details on columns properties.


tidy_data2.txt (UPDATE)
------------------

Output of Step4. see features.txt for more details on columns properties.


features.txt  (UPDATE)
------------------

part of https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. See there for more details (on units, definitions, etc.).





