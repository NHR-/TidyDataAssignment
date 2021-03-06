get_raw_data <- function() {
    # get_raw_data prepares the raw data by:
    # 1- Prepares a folder named "data"
    # 2- Prepares the data in zip format
    # 3- Unzips the zip file.
    # Download-time is recorded.
    
    
    # preparing /data folder by creating or confirming the existence
    
    print("Preparing /data folder ...")
    if (!file.exists("data")) {
        dir.create("data")
        print("/data created")
    } else {
        print("/data exists")
    }
    print("/data is ready.")
    
    
    
    
    # preparing the data in zip format by downloding from the source 
    # or confirming the existince. Download-time is also recorded.
    
    print("preparing data in zip format ...")
    if (!file.exists("data/getdata-projectfiles-UCI HAR Dataset.zip")) {
        print("Downloading ...")
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl, destfile = "./data/getdata-projectfiles-UCI HAR Dataset.zip")
        download_time <- Sys.time() 
        print(paste("Downloading completed at", download_time))
        
        if(!file.exists("data/download_time.txt"))
            file.create("data/download_time.txt")
        write(as.character(download_time), "data/download_time.txt")
    }
    else{
        print("getdata-projectfiles-UCI HAR Dataset.zip exists")
    }
    
    
    
    # Preparing the Raw Data files
    
    print("getdata-projectfiles-UCI HAR Dataset.zip is ready")
    print("unzipping ...")
    setwd("./data")
    unzip("getdata-projectfiles-UCI HAR Dataset.zip")
    setwd("../")
    print("unzipping completed")  
}


merge_raw_data <- function(){
    # merge_raw_data() loads raw data into data.frames, merges them into 
    # a single data.frame, and returns it.
    
    
    
    # loading raw data files into raw data frames
    
    features <- data.frame()
    print("loading features ...")
    features <- read.table("./data/UCI HAR Dataset/features.txt")
    
    subject_test <- data.frame()
    print("loading subject_test ...")
    subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
    
    X_test <- data.frame()
    print("loading X_test ...")
    X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
    
    y_test <- data.frame()
    print("loading y_test ...")
    y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
    
    subject_train <- data.frame()
    print("loading subject_train ...")
    subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
    
    X_train <- data.frame()
    print("loading X_train ...")
    X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
    
    y_train <- data.frame()
    print("loading y_train ...")
    y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
    
    labels <- c("Original dataset", "Person_ID", "Activity_type", 
                as.character(features$V2))
    
    
    
    # c-binding and labeling test data
    data_type_label = as.data.frame(rep("test", dim(X_test)[1]))
    data_test <- cbind(data_type_label, subject_test, y_test, X_test)
    names(data_test) <- labels
    
    # c-binding and labeling train data
    data_type_label = as.data.frame(rep("train", dim(X_train)[1]))
    data_train <- cbind(data_type_label, subject_train, y_train, X_train)
    names(data_train) <- labels
    
    
    
    # merge all data into one data.frame and retrun it
    rbind(data_test, data_train)    
}


subset_mean_and_STD <- function(data){
    # subset_mean_and_STD subsets data and extracts only the measurements on 
    # mean and STD
    subset_columns <- c(1, 2, 3, 
                        grep("mean", colnames(data)), grep("std", colnames(data)))
    data <- data[,subset_columns]
}


update_activity_labels <- function(data){
    # update_activity_labels():
    # 1- loads activity_labels.txt
    # 2- using label-name mapping, updates the "Activity_type" column.
    # 3- returns the updated data.frame
    # installs plyr package if necessary.
    
    print("Renaming activity labels ...")
    activity_labels <- data.frame()
    print("loading activity_labels ...")
    activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
    
    if (!(is.element("plyr", installed.packages()[,1]))){    
        print("Installing plyr ...")
        install.packages("plyr")
    }
    
    library(plyr)
    
    print("Updating activity labels")
    data$"Activity_type" <- 
        mapvalues(data$"Activity_type", 
                  activity_labels$V1, 
                  as.character(activity_labels$V2))
    data
    
}


create_and_write_output_1 <- function(data){
    # saves data in tidy_data1.txt
    write.table(data, "tidy_data1.txt", row.name=FALSE)    
}


create_and_write_output_2 <- function(data){
    # create_and_write_output_2
    # 1- creates a new tidy data set  with the average of each variable 
    # for each activity and each subject.
    # 2- Saves it to tidy_data2.txt
    
    data2 <- ddply(data, 
                   .(Person_ID, Activity_type), 
                   .fun=function(x){ colMeans(x[,4:dim(data)[2]]) })  
    
    write.table(data2, "tidy_data2.txt", row.name=FALSE)
}



# Step 0: Preparing raw data.
print("preparing raw data ...")
get_raw_data()
print("raw data ready.")



# Step 1: Merging raw data.
print("merging raw data ...")
data <- merge_raw_data()
print("all data merged into one data set.")



# Step 2: Extracting mean and STD measurements
print("subsetting ...")
data <- subset_mean_and_STD(data)
print("subsetting completed.")



# Step 3: Using activity names instead of activity labels
print("updating activity labels ...")
data <- update_activity_labels(data)
print("activity labels updated.")



# Step 4: Using descriptive labels. Already done. 
# "Original dataset", "Person_ID", "Activity_type"

print("Saving data into tidy_data1.txt ...")
create_and_write_output_1(data)
print(paste("tidy_data1.txt saved at", as.character(Sys.time())))



# Step 5: Creating and saving average of each variable for 
# each activity and each subject



print("Saving data into tidy_data2.txt ...")
create_and_write_output_2(data)
print(paste("tidy_data2.txt saved at", as.character(Sys.time())))

