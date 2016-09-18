setwd("~/Downloads/DataScience/Course-3/Week4/Assignment/GettingAndCleaningDataCourseProject")
#################################################################################
##Load features and datasets
#################################################################################
subject_train = read.csv("./../UCI HAR Dataset/train/subject_train.txt",header=FALSE, sep = "")
X_train  = read.csv("./../UCI HAR Dataset/train/X_train.txt",header=FALSE, sep = "")
y_train  = read.csv("./../UCI HAR Dataset/train/y_train.txt",header=FALSE, sep = "")
subject_test = read.csv("./../UCI HAR Dataset/test/subject_test.txt",header=FALSE, sep = "")
X_test  = read.csv("./../UCI HAR Dataset/test/X_test.txt",header=FALSE, sep = "")
y_test  = read.csv("./../UCI HAR Dataset/test/y_test.txt",header=FALSE, sep = "")
labels <- read.csv("./../UCI HAR Dataset/activity_labels.txt", header = FALSE, sep = "")
features <- read.csv("./../UCI HAR Dataset/features.txt", header = FALSE, sep = "")

#################################################################################
##Combine and name the columns(Step 1 & 2)
#################################################################################
X_Total <- rbind(X_train, X_test)
y_Total <- rbind(y_train, y_test)
subject_Total <- rbind(subject_train, subject_test)

# Extract only the mean and standard deviation values for each measurement
FeaturesNames_Mean_STD <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the required columns
X_Total <- X_Total[, FeaturesNames_Mean_STD]

# correcting the column names
names(X_Total) <- features[FeaturesNames_Mean_STD, 2]


#################################################################################
##Use descriptive activity names to name the activities in the data set(Step 3)
#################################################################################
y_Total[, 1] <- labels[y_Total[, 1], 2]

#################################################################################
##(Step 4)
#################################################################################
names(y_Total) <- "movement"
names(subject_Total) <- "subject"

# bind all the data in a single data set
Total <- cbind(X_Total, y_Total, subject_Total)


#################################################################################
##Create independent tidy data set(Step 5)
#################################################################################
library(reshape2)
library(plyr)
Averages <- ddply(Total, .(subject, movement), function(x) colMeans(x[, 1:65]))

write.table(Averages, "./../UCI HAR Dataset/Averages.txt", row.name=FALSE)