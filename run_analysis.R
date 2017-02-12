# Getting and Cleaning Data - Course Project
# Author: Alex
# Task
# 1) a tidy data set as described below, 
# 2) a link to a Github repository with your script for performing the analysis, and 
# 3) a code book that describes the variables, the data, and any transformations or 
# work that you performed to clean up the data called CodeBook.md.

library(reshape2)

# set wd
setwd("~/Coursera/getclean/project")

# ------------------------
# 1. first read data set
# ------------------------

# 1.1 read activity_labels
activityLabels <- read.csv("UCI HAR Dataset/activity_labels.txt"
                           , sep=" "
                           , header = FALSE
                           , colClasses = "character"
                           ,col.names = c("ActivityID", "ActivityName")
                        )
head(activityLabels) # ok
nrow(activityLabels)#  6 rows

# 1.2 read features
features <- read.csv("UCI HAR Dataset/features.txt"
                     , sep=" "
                     , header = FALSE
                     , colClasses = "character"
                     ,col.names = c("FeatureID", "FeatureName")
)
head(features)
nrow(features) # 561 rows

# 1.3 read subject_test
subjectTest <- read.csv("UCI HAR Dataset/test/subject_test.txt"
                     , sep=" "
                     , header = FALSE
                     , colClasses = "character"
                     ,col.names = c("SubjectID")
)
head(subjectTest)
nrow(subjectTest) # 2947

# 1.4 read X_test
XTest <- read.table("UCI HAR Dataset/test/X_test.txt"
                        , header = FALSE

)
ncol(XTest) # 561
nrow(XTest) # 2947
head(XTest)


# 1.5 read y_test
yTest <- read.table("UCI HAR Dataset/test/y_test.txt"
                    , header = FALSE
                    
)
nrow(yTest) # 2947
ncol(yTest) # 1
head(yTest) # ok

# 1.6 read X_Train
XTrain <- read.table("UCI HAR Dataset/train/X_train.txt"
                    , header = FALSE
                    
)
nrow(XTrain) # 7352
ncol(XTrain) # 561
head(XTrain) # ok

# 1.7 read Y_Train
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt"
                     , header = FALSE
                     
)
nrow(yTrain) # 7352
ncol(yTrain) # 1
head(yTrain) # ok

# 1.8 read subject train
subjectTrain <- read.csv("UCI HAR Dataset/train/subject_train.txt"
                        , sep=" "
                        , header = FALSE
                        , colClasses = "character"
                        ,col.names = c("SubjectID")
)
nrow(subjectTrain) # 7352
ncol(subjectTrain) # 1
head(subjectTrain) # ok

# -------------------
# 2. Merge Test and Training Sets
# -------------------

# 2.1 Merge X data set
XData <- rbind(XTest, XTrain)
nrow(XData) # 10299 = 7352 + 2947 , ok

# 2.2 Merge y data set
yData <- rbind(yTest, yTrain)
nrow(yData) # 10299 , ok

# 2.3 Merge subject data set
subject <- rbind(subjectTest, subjectTrain)
nrow(subject) # 10299 , ok

# -------------------
# 3. Subset data to only keep mean and standard deviation measurements
# -------------------

# examine the features
features

# ok, check for mean or std. It appears that the function is always -mean() OR -std()
# use regular expression to find it
# Note, use double backslash to escape special characters such as a bracket

featuresMeanStd <- grep("-(mean|std)\\(\\)", features$FeatureName)
length(featuresMeanStd) # 66 occurences

# now subset columns

XDataCleanTmp <- XData[, featuresMeanStd]
head(XDataCleanTmp)
ncol(XDataCleanTmp) # 66 columns
nrow(XDataCleanTmp) # 10299, good, number of rows has not changed

# set the names of XData as defined in the features.txt
names(XDataCleanTmp) <- features$FeatureName[featuresMeanStd]
head(XDataCleanTmp)

# -------------------
# 4. Cross reference activity data to assign the correct activity
# -------------------

# take a peek
head(activityLabels)

# update the y table so that it contains the activity label

yData$ActivityName <- activityLabels$ActivityName[yData[, 1]]
head(yData) # ok, extra column has been added

# use bind, this time cbind to add the activity label column to X

xyData <- cbind(yData$ActivityName, XDataCleanTmp)
nrow(xyData) # 10299, ok number of rows has not changed
ncol(xyData) # 67, ok, number of columns has increased by 1

# -------------------
# 5. Add subject data
# -------------------

xysData <- cbind(xyData, subject)

nrow(xysData) # 10299 ok
ncol(xysData) # 68 ok
head(xysData) # looks fine. 

# check colnames
colnames(xysData)
# ok, every column has a name. rename yData$ActivityName

names(xysData)[names(xysData) == 'yData$ActivityName'] <- 'ActivityName'


# convert subjects and activities into factors. They are not numbers that you can add ;)

xysData$ActivityName <- as.factor(xysData$ActivityName)
head(xysData)

xysData$SubjectID <- as.factor(xysData$SubjectID)
head(xysData)

# -------------------
# 6. Create a second independet tidy data set with average of each variable for each activity and each subject
# -------------------

xysData.melted <- melt(xysData, id.vars = c("SubjectID", "ActivityName"))

head(xysData.melted)

xysData.mean <- dcast(xysData.melted, SubjectID + ActivityName ~ variable, mean)
head(xysData.mean)

write.table(xysData.mean, "tidyOut.txt", row.names = FALSE, quote = FALSE)
