
# Getting and Cleaning Data Final Project 
####                  popdata                
####     Coursera-John Hopkins University    

## From the Instructor
##### The purpose of this project is to demonstrate your ability to collect, 
##### work with, and clean a data set. The goal is to prepare tidy data that 
##### can be used for later analysis.


## Source Data

##### Human Activity Recognition Using Smartphones Dataset, Version 1.0

##### Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
##### Smartlab - Non Linear Complex Systems Laboratory
##### DITEN - Università degli Studi di Genova.
##### Via Opera Pia 11A, I-16145, Genoa, Italy.
##### activityrecognition@smartlab.ws
##### www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity 
at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating 
the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width 
sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and 
body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 
From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' 
for more details. 

Use of the data is in accordance with:

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

The source dataset included:

The source data include the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

## Data Transformations:

1.  Merge activity labels with the test labels
2.  Merge X datasets
3.  Merge Subject Dataset
4.  Extract all of the variables names with mean and standard deviation measuments
   -   This uses the grep function to retrieve all of the variables that contain mean or std in the name, per the features.txt
5.  Extract the x dataset variable for mean and std via dplyr select function by passing the names captured previously
6.  Merge Activity Labels with the test labels via dplyr select function by joining the data.frame on the common V1 variable
7.  Add activities to the dataset by row
  -    It is assumed that the row number is the common join
8.  Add the subject to the dataset using the dplyr mutate function
   -   It is assumed that the row number is the common join
9.  Transform Activity and Subjuct to factors for the new dataset
10.  Use of the reshape melt function on the dataset to get mean for each variable by Activity and Subject
11. Use of the reshape cast function the dataset into wide format

From supplied features_info.txt

### Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.*

##### The tidy_data.csv file contains the average of the selected varaibles from the merged train_x and test_x files.
##### - The average values are grouped by Activity and Subject.

###### Variables included in the tidy_data.csv
++ As there was ambiguity for which variables to use in the tidy dataset, 
++    all variables that included mean or std in the name were included.

+ Activity - factor
+ Subject - factor
+ tBodyAcc-mean()-X
+ tBodyAcc-mean()-Y
+ tBodyAcc-mean()-Z
+ tBodyAcc-std()-X
+ tBodyAcc-std()-Y
+ tBodyAcc-std()-Z
+ tGravityAcc-mean()-X
+ tGravityAcc-mean()-Y
+ tGravityAcc-mean()-Z
+ tGravityAcc-std()-X
+ tGravityAcc-std()-Y
+ tGravityAcc-std()-Z
+ tBodyAccJerk-mean()-X
+ tBodyAccJerk-mean()-Y
+ tBodyAccJerk-mean()-Z
+ tBodyAccJerk-std()-X
+ tBodyAccJerk-std()-Y
+ tBodyAccJerk-std()-Z
+ tBodyGyro-mean()-X
+ tBodyGyro-mean()-Y
+ tBodyGyro-mean()-Z
+ tBodyGyro-std()-X
+ tBodyGyro-std()-Y
+ tBodyGyro-std()-Z
+ tBodyGyroJerk-mean()-X
+ tBodyGyroJerk-mean()-Y
+ tBodyGyroJerk-mean()-Z
+ tBodyGyroJerk-std()-X
+ tBodyGyroJerk-std()-Y
+ tBodyGyroJerk-std()-Z
+ tBodyAccMag-mean()
+ tBodyAccMag-std()
+ tGravityAccMag-mean()
+ tGravityAccMag-std()
+ tBodyAccJerkMag-mean()
+ tBodyAccJerkMag-std()
+ tBodyGyroMag-mean()
+ tBodyGyroMag-std()
+ tBodyGyroJerkMag-mean()
+ tBodyGyroJerkMag-std()
+ fBodyAcc-mean()-X
+ fBodyAcc-mean()-Y
+ fBodyAcc-mean()-Z
+ fBodyAcc-std()-X
+ fBodyAcc-std()-Y
+ fBodyAcc-std()-Z
+ fBodyAcc-meanFreq()-X
+ fBodyAcc-meanFreq()-Y
+ fBodyAcc-meanFreq()-Z
+ fBodyAccJerk-mean()-X
+ fBodyAccJerk-mean()-Y
+ fBodyAccJerk-mean()-Z
+ fBodyAccJerk-std()-X
+ fBodyAccJerk-std()-Y
+ fBodyAccJerk-std()-Z
+ fBodyAccJerk-meanFreq()-X
+ fBodyAccJerk-meanFreq()-Y
+ fBodyAccJerk-meanFreq()-Z
+ fBodyGyro-mean()-X
+ fBodyGyro-mean()-Y
+ fBodyGyro-mean()-Z
+ fBodyGyro-std()-X
+ fBodyGyro-std()-Y
+ fBodyGyro-std()-Z
+ fBodyGyro-meanFreq()-X
+ fBodyGyro-meanFreq()-Y
+ fBodyGyro-meanFreq()-Z
+ fBodyAccMag-mean()
+ fBodyAccMag-std()
+ fBodyAccMag-meanFreq()
+ fBodyBodyAccJerkMag-mean()
+ fBodyBodyAccJerkMag-std()
+ fBodyBodyAccJerkMag-meanFreq()
+ fBodyBodyGyroMag-mean()
+ fBodyBodyGyroMag-std()
+ fBodyBodyGyroMag-meanFreq()
+ fBodyBodyGyroJerkMag-mean()
+ fBodyBodyGyroJerkMag-std()
+ fBodyBodyGyroJerkMag-meanFreq()
+ angle(tBodyAccMean,gravity)
+ angle(tBodyAccJerkMean),gravityMean)
+ angle(tBodyGyroMean,gravityMean)
+ angle(tBodyGyroJerkMean,gravityMean)
+ angle(X,gravityMean)
+ angle(Y,gravityMean)
+ angle(Z,gravityMean)







