### Getting & Cleaning Data, Course Project

## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the
##    average of each variable for each activity and each subject.


library(dplyr)
library(reshape2)

rm(list = ls())  ## Clear environment.

if(!exists("./data")) {
        if(!file.exists("./data"))
        {dir.create("./data")}
}

## Download and extract dataset.
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="data/Dataset.zip", mode='wb')
dateDownloaded <- date()
unzip("./data/Dataset.zip", exdir = ".")

## Read test and train data
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

## Read activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

## Read features set
features <- read.table("./UCI HAR Dataset/features.txt")

## Combine the test and train data into a consolidated dataset
subject_df <- rbind(subject_train, subject_test)
x_df <- rbind(x_train, x_test)
y_df <- rbind(y_train, y_test)

## Determine those features of interest (i.e. mean and std)
features_of_interest <- grep("-(mean|std)\\(\\)", features[, 2])

## Subset the consolidated frame (and column names) to include only the features of interest.
x_df <- x_df[, features_of_interest]

## Tidy the feature names for improved readability
featNames <- as.character(features[features_of_interest, 2])
featNames <- gsub('BodyBody', 'Body', featNames)  ## Remove redundancy (there appears
                                                  ## to be no loss of information)
featNames <- gsub('-mean', 'Mean', featNames)
featNames <- gsub('-std', 'Std', featNames)
featNames <- gsub('[()-]', '', featNames)         ## Remove unwanted characters

## Apply the "tidied" column names to the consolidated frame.
colnames(x_df) <- featNames

# Update the numeric activity labels in y_df[, 1] with descriptive labels and
# set the name of this column to "Activity".
names(y_df) <- "Activity"
y_df[, 1] <- activity_labels[y_df[, 1], 2]

## Set the subject data column name to "Subject".
names(subject_df) <- "Subject"

## Combine elements to create single data frame, sorted by Subject
## Sorting not strictly required, but seemed nicer to me.
full_df <- arrange(cbind(subject_df, y_df, x_df), Subject)

## Create a second, independent tidy data set with the average of each variable for each
## (Subject, Activity) pair, using dplyr functions. Note: both a "wide" and "tall"
## version will be created.
grouping <- group_by(full_df, Subject, Activity)
HAR_tidy_wide_df <- summarise_each(grouping, funs(mean)) ## "Wide" dataset

## Create "tall" dataset with rows sorted by "Subject" and "Activity".
## Name the molten variables column "Parameter" and the values column "Value".
HAR_tidy_tall_df <- arrange(melt(HAR_tidy_wide_df, id = c("Subject", "Activity"),
                         measure.vars = names(HAR_tidy_wide_df)[3:68]), Subject, Activity)
names(HAR_tidy_tall_df)[3:4] <- c("Parameter", "Value")

## Write the tidied data files.
write.table(HAR_tidy_wide_df, file = "./HAR_tidy_wide.txt", sep = ",", row.names = FALSE)
write.table(HAR_tidy_tall_df, file = "./HAR_tidy_tall.txt", sep = ",", row.names = FALSE)
