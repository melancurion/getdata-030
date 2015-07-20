# getdata-030
## Coursera Getting and Cleaning Data Course

### Conversion process from Raw to Tidy Data
As required, the R script "run_analysis.R" does the following. 

   1. Merges the training and the test sets to create one data set.
   2. Extracts only the measurements on the mean and standard deviation for each measurement. 
   3. Uses descriptive activity names to name the activities in the data set
   4. Appropriately labels the data set with descriptive variable names. 
   5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Raw Dataset
The raw data files are available at this link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Files
This repo contains the following output products:

| File              | Description                                                             |
| :---------------- | :---------------------------------------------------------------------- |
| README.md         | This file.                                                              |
| CodeBook.md       | Describes the tidy data set and the process by which it was generated.  |
| run_analysis.R    | Contains the R script used to generate the tidy data set.               |
| HAR_tidy_wide.txt | "Wide and short" version of tidy data.                                  |
| HAR+tidy_tall.txt | "Tall and long" molten version of tidy data.                            |

### Package Dependencies
The R script "run_analysis.R" requires the 'dplyr' and 'reshape2' packages.
The script was written and tested in R version 3.2.1 (2015-06-18), with dplyr version 0.4.2 and reshape2 version 1.4.1.

### Procedure for application of conversion script

1. The script "run_analysis.R" should be placed in a working directory (which should be assigned as such by means of setwd()). The command source("run_analysis.R") will execute the script.
2. The script will download the zipped dataset from the target URL specified above to a directory "./data", which will be created if it does not already exist.
3. The script will unzip the retrieved zip file into the working directory. This will have the effect of creating a new "raw data" directory "./UCI HAR Dataset", with nested subdirectories "./UCI HAR Dataset/test" and "./UCI HAR Dataset/train". These latter two directories will each contain an "/Inertial Signals" subdirectory and three files.
   - "./UCI HAR Dataset" will contain the following files:
      * README.txt
      * activity_labels.txt
      * features.txt
      * features_info.txt
   - "./UCI HAR Dataset/test" will contain the following files:
      * subject_test.txt
      * X_test (*note: uppercase X*)
      * y_test (*note: lowercase y*)
   - "./UCI HAR Dataset/test/Inertial Signals" will contain the following files:
      * body_acc_x_test.txt
      * body_acc_y_test.txt
      * body_acc_z_test.txt
      * body_gyro_x_test.txt
      * body_gyro_y_test.txt
      * body_gyro_z_test.txt
      * total_acc_x_test.txt
      * total_acc_y_test.txt
      * total_acc_z_test.txt
   - "./UCI HAR Dataset/train" will contain the following files:
      * subject_train.txt
      * X_train (*note: uppercase X*)
      * y_train  (*note: lowercase y*)
   - - "./UCI HAR Dataset/train/Inertial Signals" will contain the following files:
      * body_acc_x_train.txt
      * body_acc_y_train.txt
      * body_acc_z_train.txt
      * body_gyro_x_train.txt
      * body_gyro_y_train.txt
      * body_gyro_z_train.txt
      * total_acc_x_train.txt
      * total_acc_y_train.txt
      * total_acc_z_train.txt
