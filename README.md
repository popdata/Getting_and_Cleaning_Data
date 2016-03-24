## Getting_and_Cleaning_Data
#### Getting and Cleaning Data Final Project Repo


#                                                             
#             Getting and Cleaning Data Course Project        
#                     Final Project                           
#                                                             


### Step 1 Merge the training and the test sets to create one data set.

##### Load libraries
##### Load files into R
##### Merge activity labels with the test labels using the rbind function
##### Merge X training and test datasets using the rbind function
##### Merge Subject training and test dataset using the rbind function

### Step 2 Extract only the measurements on the mean and standard deviation for each measurement.

##### Get all of the variables names with mean and standard deviation measuments
##### This uses the grep function to retrieve all of the variables that contain mean or std in the name, per the features.txt
##### Extract the x dataset variable for mean and std via dplyr select function by passing the names captured previously

### Step 3 Use descriptive activity names to name the activities in the data set

##### Merge Activity Labels with the test labels via dplyr select function by joining the data.frame on the common V1 variable
##### Add activities to the dataset by row
#####    - It is assumed that the row number is the common join

### Step 4 Appropriately label the data set with descriptive variable names.

#####  Create a vector of variable names from the merge_feature_names data.frame
#####  Set the descriptive variable names
#####    -Each variable name coincides with the V1 through V561

### Step 5 Create a second, independent tidy data set with the average of each variable for each activity and each subject.

#####  Add the subject to the dataset using the dplyr mutate function
#####  - It is assumed that the row number is the common join

#####  Create the factors for the new dataset using the as.factor function
#####  use the reshape package melt function on the dataset to get mean for each variable by Activity and Subject
#####  Use the reshape cast function to shape the tidy dataset into wide format
#####  write the tidy dataset to a csv file format & order it by Activity and Subject


