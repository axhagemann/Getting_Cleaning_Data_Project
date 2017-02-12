---
title: "Getting Cleaning Data Code Book"
author: "Alex"
date: "12 Februar 2017"
output: html_document
---


This is the code book for the Getting and Cleaning Data Course Project. This document describes the variables, data and transformations.

## Data

The data set contains measurements from 30 participants containing data recorded by sensors in mobile phones. For more information visit [UCI Machine Learning Repo](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

* `activity_labels.txt` contains a mapping fo the activity ids to the actual names
    + `1`: WALKING
    + `2`: WALKING_UPSTAIRS
    + `3`: WALKING_DOWNSTAIRS
    + `4`: SITTING
    + `5`: STANDING
    + `6`: LAYING
* test and training datasets consisting of `X_train`, `X_test`, `y_train`, `y_test`, `subject_train` and `subject_test`. The X files contain measuremnts as recorded by the Samsung phones. The y files map the measurements to one the respective 6 activities. The subject files map every row to one of the 30 participants



## Transformation

1. First the all the files were read into R
2. Using `rbind()` the `X`, `y` and `subject` files were respectively merged
3. Using `grep()` only the fields containing mean or standard deviation values were kept
4. Using `cbind()` the acitivity labels were merged on
5. Also using `cbind()` the subject ids were joined
6. Both activity names and subject IDs were converted to factors
7. Using `melt()` and `dcast()` a second independet data set was created with average of each variable for each activity and each subject


The columns `ActivityName` and `SubjectID` describe the name of the activity and the ID of the subject.

Below is a list of all the fields:

* `ActivityName`                
* `tBodyAcc-mean()-Z`           
* `tBodyAcc-std()-Z`            
* `tGravityAcc-mean()-Z`        
* `tGravityAcc-std()-Z`         
* `tBodyAccJerk-mean()-Z`       
* `tBodyAccJerk-std()-Z`        
* `tBodyGyro-mean()-Z`          
* `tBodyGyro-std()-Z`           
* `tBodyGyroJerk-mean()-Z`      
* `tBodyGyroJerk-std()-Z`       
* `tGravityAccMag-mean()`       
* `tBodyAccJerkMag-std()`       
* `tBodyGyroJerkMag-mean()`     
* `fBodyAcc-mean()-Y`           
* `fBodyAcc-std()-Y`            
* `fBodyAccJerk-mean()-Y`       
* `fBodyAccJerk-std()-Y`        
* `fBodyGyro-mean()-Y`          
* `fBodyGyro-std()-Y`           
* `fBodyAccMag-std()`           
* `fBodyBodyGyroMag-mean()`     
* `fBodyBodyGyroJerkMag-std()`  
* `tBodyAcc-mean()-X`           
* `tBodyAcc-std()-X`            
* `tGravityAcc-mean()-X`        
* `tGravityAcc-std()-X`         
* `tBodyAccJerk-mean()-X`       
* `tBodyAccJerk-std()-X`        
* `tBodyGyro-mean()-X`          
* `tBodyGyro-std()-X`           
* `tBodyGyroJerk-mean()-X`      
* `tBodyGyroJerk-std()-X`       
* `tBodyAccMag-mean()`          
* `tGravityAccMag-std()`        
* `tBodyGyroMag-mean()`         
* `tBodyGyroJerkMag-std()`      
* `fBodyAcc-mean()-Z`           
* `fBodyAcc-std()-Z`            
* `fBodyAccJerk-mean()-Z`       
* `fBodyAccJerk-std()-Z`        
* `fBodyGyro-mean()-Z`          
* `fBodyGyro-std()-Z`           
* `fBodyBodyAccJerkMag-mean()`  
* `fBodyBodyGyroMag-std()`      
* `SubjectID`   
* `tBodyAcc-mean()-Y`          
* `tBodyAcc-std()-Y`           
* `tGravityAcc-mean()-Y`       
* `tGravityAcc-std()-Y`        
* `tBodyAccJerk-mean()-Y`      
* `tBodyAccJerk-std()-Y`       
* `tBodyGyro-mean()-Y`         
* `tBodyGyro-std()-Y`          
* `tBodyGyroJerk-mean()-Y`     
* `tBodyGyroJerk-std()-Y`      
* `tBodyAccMag-std()`          
* `tBodyAccJerkMag-mean()`     
* `tBodyGyroMag-std()`         
* `fBodyAcc-mean()-X`          
* `fBodyAcc-std()-X`           
* `fBodyAccJerk-mean()-X`      
* `fBodyAccJerk-std()-X`       
* `fBodyGyro-mean()-X`         
* `fBodyGyro-std()-X`          
* `fBodyAccMag-mean()`         
* `fBodyBodyAccJerkMag-std()`  
* `fBodyBodyGyroJerkMag-mean()`