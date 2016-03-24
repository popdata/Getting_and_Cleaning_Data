#                                                             
#             Getting and Cleaning Data Course Project        
#                     Final Project                           
#                                                             


### Step 1 Merge the training and the test sets to create one data set.

1.  Load libraries
2.  Load files into R
3.  Merge Y training and test datasets using the rbind function
4.  Merge X training and test datasets using the rbind function
5.  Merge Subject training and test datasets using the rbind function

### Step 2 Extract only the measurements on the mean and standard deviation for each measurement.

1.  Get all of the variables names with mean and standard deviation measuments
-   This uses the grep function to retrieve all of the variables that contain mean or std in the name, per the features.txt
2.  Extract the x dataset variables for mean and std via dplyr select function by passing the names captured previously

### Step 3 Use descriptive activity names to name the activities in the data set

1.  Merge Activity Labels with the test labels via dplyr select function by joining the data.frame on the common V1 variable
2.  Add activities to the dataset by row
-   It is assumed that the row number is the common join

### Step 4 Appropriately label the data set with descriptive variable names.

1.  Create a vector of variable names from the merge_feature_names data.frame
2.  Set the descriptive variable names using the colnames assignment
-   Each variable name coincides with the V1 through V561

### Step 5 Create a second, independent tidy data set with the average of each variable for each activity and each subject.

1.  Add the subject to the dataset using the dplyr mutate function
-   It is assumed that the row number is the common join
2.  Create the factors for the new dataset using the as.factor function
3.  use the reshape package melt function on the dataset to get mean for each variable by Activity and Subject
4.  Use the reshape cast function to shape the tidy dataset into wide format
5.  write the tidy dataset to a csv file using write.csv & order it by Activity and Subject via dplyr arrange function

* The tidy_data.csv file can be read in a standard text editor, spreadsheet software, or directly in R using various text read packages.
