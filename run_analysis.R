setwd("~/Downloads/DataScience/Course-3/Week4/Assignment/GettingAndCleaningDataCourseProject")

options(stringsAsFactors=FALSE)
######################################################################################################3
##Read Data from test and train datasets
######################################################################################################3
#Test
body_acc_x_test <- read.csv("./../UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt", sep = "", header = FALSE, colClasses = "numeric")
body_acc_y_test <- read.csv("./../UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt", sep = "", header = FALSE, colClasses = "numeric")
body_acc_z_test <- read.csv("./../UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt", sep = "", header = FALSE, colClasses = "numeric")

body_gyro_x_test <- read.csv("./../UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt", sep = "", header = FALSE, colClasses = "numeric")
body_gyro_y_test <- read.csv("./../UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt", sep = "", header = FALSE, colClasses = "numeric")
body_gyro_z_test <- read.csv("./../UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt", sep = "", header = FALSE, colClasses = "numeric")

total_acc_x_test <- read.csv("./../UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt", sep = "", header = FALSE, colClasses = "numeric")
total_acc_y_test <- read.csv("./../UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt", sep = "", header = FALSE, colClasses = "numeric")
total_acc_z_test <- read.csv("./../UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt", sep = "", header = FALSE, colClasses = "numeric")

y_test <- read.csv("./../UCI HAR Dataset/test/y_test.txt", sep = "", header = FALSE, colClasses = "numeric")
subject_test <- read.csv("./../UCI HAR Dataset/test/subject_test.txt", sep = "", header = FALSE, colClasses = "numeric")

#Train
body_acc_x_train <- read.csv("./../UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt", sep = "", header = FALSE, colClasses = "numeric")
body_acc_y_train <- read.csv("./../UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt", sep = "", header = FALSE, colClasses = "numeric")
body_acc_z_train <- read.csv("./../UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt", sep = "", header = FALSE, colClasses = "numeric")

body_gyro_x_train <- read.csv("./../UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt", sep = "", header = FALSE, colClasses = "numeric")
body_gyro_y_train <- read.csv("./../UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt", sep = "", header = FALSE, colClasses = "numeric")
body_gyro_z_train <- read.csv("./../UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt", sep = "", header = FALSE, colClasses = "numeric")

total_acc_x_train <- read.csv("./../UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt", sep = "", header = FALSE, colClasses = "numeric")
total_acc_y_train <- read.csv("./../UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt", sep = "", header = FALSE, colClasses = "numeric")
total_acc_z_train <- read.csv("./../UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt", sep = "", header = FALSE, colClasses = "numeric")

y_train <- read.csv("./../UCI HAR Dataset/train/y_train.txt", sep = "", header = FALSE, colClasses = "numeric")
subject_train <- read.csv("./../UCI HAR Dataset/train/subject_train.txt", sep = "", header = FALSE, colClasses = "numeric")

###################################################################################################
##Combining Test and train datasets
###################################################################################################

Test <- data.frame(body_acc_x_test, body_acc_y_test, body_acc_z_test, body_gyro_x_test, body_gyro_y_test, body_gyro_z_test, 
                   total_acc_x_test, total_acc_y_test, total_acc_z_test, y_test, subject_test)
Train <- data.frame(body_acc_x_train, body_acc_y_train, body_acc_z_train, body_gyro_x_train, body_gyro_y_train, body_gyro_z_train, 
                    total_acc_x_train, total_acc_y_train, total_acc_z_train, y_train, subject_train)
Total <- rbind(Train, Test)

write.table(Total, file="CleanedData.txt", row.names = FALSE)
