###############################################################
#                                                             #
#             Getting and Cleaning Data Course Project        #
#                     Final Project                           #
#                                                             #
###############################################################

# step 1 Merge the training and the test sets to create one data set.

# load libraries

library(data.table)
library(dplyr)
library(reshape)

# load files into R
test_x <- fread("test/X_test.txt")
test_y <- fread("test/y_test.txt")
test_subject <- fread("test/subject_test.txt")
train_x <- fread("train/x_train.txt")
train_y <- fread("train/y_train.txt")
train_subject <- fread("train/subject_train.txt")
activity_labels <- fread("activity_labels.txt")
features <- fread("features.txt")

# Merge activity labels with the test labels
merge_y <- rbind(train_y, test_y)

# Merge X datasets
merge_x <- rbind(train_x,test_x)

# Merge Subject Dataset
merge_subject <- rbind(train_subject, test_subject)

# Step 2 Extract only the measurements on the mean and standard deviation for each measurement.

# Get all of the variables names with mean and standard deviation measuments
# This uses the grep function to retrieve all of the variables that contain mean or std in the name, per the features.txt
merge_feature_names <-
  features[grep('([Mm]ean|[Ss]td)',features$V2,ignore.case = TRUE),]

# Extract the x dataset variable for mean and std via dplyr select function by pass the names captured previously
mean_std_select <- select(merge_x, merge_feature_names$V1)

# Step 3 Use descriptive activity names to name the activities in the data set

# Merge Activity Labels with the test labels via dplyr select function
# by joining the data.frame on the common V1 variable
y_act_merge <-
  merge(
    merge_y,activity_labels,by.x = "V1", by.y = "V1", all = TRUE
  )

# add activities to the dataset by row
# - It is assumed that the row number is the common join
mean_std_select <-
  mutate(mean_std_select, Activity = y_act_merge$V2)

#Step 4 Appropriately label the data set with descriptive variable names.

# create a vector of variable names from the merge_feature_names data.frame
var_labels <- merge_feature_names$V2
# need to manually add the 'Activity' variable name
var_labels[87] <- "Activity"

# Set the descriptive variable names
# Each variable name coincides with the V1 through V561
colnames(mean_std_select) <- var_labels

# Step 5 Create a second, independent tidy data set with the average of each variable for each activity and each subject.

# Add the subject to the dataset using the dplyr mutate function
# - It is assumed that the row number is the common join
tidy <-
  mean_std_select <-
  mutate(mean_std_select, Subject = merge_subject$V1)

# Create the factors for the new dataset
tidy$Activity <- as.factor(tidy$Activity)
tidy$Subject <- as.factor(tidy$Subject)

# use the reshape melt function on the dataset to get mean for each variable by Activity and Subject
mlt <-
  melt(
    tidy,id.vars = c("Subject","Activity"), variable.name = "Measurements", value.name = "Average" ,na.rm = TRUE
  )

# Use the reshape cast function the dataset into wide format
cast_tidy <- cast(mlt,Activity + Subject ~ Measurements, mean)

# write the tidy dataset to a csv file format & order it by Activity and Subject
write.csv(
  arrange(cast_tidy,Activity,Subject), file = "tidy_data.csv",row.names =
    FALSE, na = ""
)
