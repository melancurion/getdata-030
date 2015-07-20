---
title: "CodeBook.md"
author: "melancurion"
date: "July 19, 2015"
---

# Code Book for HAR Tidy Dataset
## Background
The project purpose and a general description of the raw data and tghe underlying experimental approach are provided in the attached README file.

## Raw Datasets
The following files constitute the raw dataset from which the output dataset has been produced.

| File                                  | Description                                                 |
| :------------------------------------ | :---------------------------------------------------------- |
| activity_labels.txt                   | This table maps the integer activity indicator in the test and train datasets to a meaningful activity label, e.g. 1 maps to "WALKING".|
| features.txt                          | This table maps the integer feature indicator in the test and train datasets to a meaningful "feature name", i.e. the name of a measured or derived quantity.
| X_test.txt (*note: uppercase X*)      | Contains the raw numeric test dataset.       |
| y_test.txt (*note: lowercase y*)      | Contains the raw numeric activity identifiers for the test data.      |
| X_train.txt (*note: uppercase X*)     | Contains the raw numeric training dataset.             |
| y_train.txt  (*note: lowercase y*)    | Contains the raw numeric activity identifiers for the test data. |



## Output Tidy Datasets
Note that two versions of the tidy data set are provided:

1. a "wide" set ('HAR_tidy_wide.txt') containing 180 observations of 68 variables (including two ID variables and 66 "Metric" fields containing summaries (means) of values derived from measurements or post-processing thereof); and

2. a "tall" set ('HAR_tidy_tall.txt') containing 11880 observations of 4 variables.

The "tall" set is derived from the "wide" set by retaining the ID Fields, and melting the "Metric" fields into a single "Parameter" field in which each value is the name of one of the defined Metric field names, and the corresponding entry in the new "Value" field contains the summary value. Please note that the naming conventions for the allowed values in the "Parameter" field are identical to the Metric Field Naming conventions described below.

### ID Fields
The same ID fields are applied in the "wide" and "tall" datasets.

| Field Name    | Allowed Values                                                       | Interpretation        |
| :-----------: | :------------------------------------------------------------------- | :-------------------- |
| Subject       | Integer in range [1, 30]                                             |  Human subject unique identifier | 
| Activity      | Character string in {"WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"} | Identifies the specific activity the test subject was engaged in during the observation. |

### Metric Fields
These fields contain summary (mean) values of all corresponding entries in the raw dataset for a given (Subject, Activity) pair.

#### Metric Field Naming Convention
Each metric (i.e. non-key) field name consists of a concatenated set of substrings
of the form
{**domain-type**}{**measurement-type-1**}{**instrument-type**}{**measurement-type-2**}{**summary-type**}{**axial coordinate**},
where these substrings conform to the descriptions below.

------------------------------------------------------------
| Substring type     |Allowed values | Interpretation      |
|:-------------------|:--------------| :-------------------|
| domain-type        | 't' or 'f'    | Time domain metric or frequency domain metric derived from FFT analysis. |
| measurement-type-1 | 'Body' or  'Gravity'  | Body-only or gravity-included metric |
| instrument-type    | 'Acc' or 'Gyro'    | Acceleration or Angular Velocity    |
| measurement-type-2 | 'Jerk', 'Mag', or '' (*empty*)     | Jerk. Mag, or not applicable |
| summary-type       | 'Mean' or 'Std'     | Mean or Standard deviation |
| axial coordinate   | 'X', 'Y','Z', or '' (*empty*)      | X, Y, or Z coordinate  |

#### List of Fields
The following table lists the field name applied to each column
in 'HAR_tidy_wide.txt'. The same list identifies the allowed values
of the "Parameter" field in 'HAR_tidy_tall.txt'.

| Field Number | Field Name         | Field Number     | Field Name       |
|:-------:| :------------------ | :-------: | :------------------- |
| 1       | Subject  (*Key*)    | 35      | tGravityAccMagMean
| 2       | Activity (*Key*)    | 36      | tGravityAccMagStd
| 3       | tBodyAccMeanX       | 37      | tBodyAccJerkMagMean
| 4       | tBodyAccMeanY       | 38      | tBodyAccJerkMagStd
| 5       | tBodyAccMeanZ       | 39      | tBodyGyroMagMean
| 6       | tBodyAccStdX        | 40      | tBodyGyroMagStd
| 7       | tBodyAccStdY        | 41      | tBodyGyroJerkMagMean
| 8       | tBodyAccStdZ        | 42      | tBodyGyroJerkMagStd
| 9       | tGravityAccMeanX    | 43      | fBodyAccMeanX
| 10      | tGravityAccMeanY    | 44      | fBodyAccMeanY
| 11      | tGravityAccMeanZ    | 45      | fBodyAccMeanZ
| 12      | tGravityAccStdX     | 46      | fBodyAccStdX
| 13      | tGravityAccStdY     | 47      | fBodyAccStdY
| 14      | tGravityAccStdZ     | 48      | fBodyAccStdZ
| 15      | tBodyAccJerkMeanX   | 49      | fBodyAccJerkMeanX
| 16      | tBodyAccJerkMeanY   | 50      | fBodyAccJerkMeanY
| 17      | tBodyAccJerkMeanZ   | 51      | fBodyAccJerkMeanZ
| 18      | tBodyAccJerkStdX    | 52      | fBodyAccJerkStdX
| 19      | tBodyAccJerkStdY    | 53      | fBodyAccJerkStdY
| 20      | tBodyAccJerkStdZ    | 54      | fBodyAccJerkStdZ
| 21      | tBodyGyroMeanX      | 55      | fBodyGyroMeanX
| 22      | tBodyGyroMeanY      | 56      | fBodyGyroMeanY
| 23      | tBodyGyroMeanZ      | 57      | fBodyGyroMeanZ
| 24      | tBodyGyroStdX       | 58      | fBodyGyroStdX
| 25      | tBodyGyroStdY       | 59      | fBodyGyroStdY
| 26      | tBodyGyroStdZ       | 60      | fBodyGyroStdZ
| 27      | tBodyGyroJerkMeanX  | 61      | fBodyAccMagMean
| 28      | tBodyGyroJerkMeanY  | 62      | fBodyAccMagStd
| 29      | tBodyGyroJerkMeanZ  | 63      | fBodyAccJerkMagMean
| 30      | tBodyGyroJerkStdX   | 64      | fBodyAccJerkMagStd
| 31      | tBodyGyroJerkStdY   | 65      | fBodyGyroMagMean
| 32      | tBodyGyroJerkStdZ   | 66      | fBodyGyroMagStd
| 33      | tBodyAccMagMean     | 67      | fBodyGyroJerkMagMean
| 34      | tBodyAccMagStd      | 68      | fBodyGyroJerkMagStd

### Quantities in raw and tidy datasets
- Feature quantities are normalized and bounded within [-1, 1].
- Each feature vector is a row on the text file.

### Processing Performed to Generate Tidy Dataset
1. Raw dataset files are download and unzipped.
2. The 'subject_test.txt', 'subject_train.txt', 'X_test.txt', 'X_train.txt', 'y_test.txt', and 'y_train.txt', 'activity_labels.txt', and 'features.txt' files are read into corresponding dataframes.
3. The test and train dataframes are combined into consolidated dataframes.
  - The test and train subject dataframes are consolidated into a single subject dataframe.
  - The test and train metrics dataframes are consolidated into a single metrics dataframe.
  - Those features of interest (i.e. those required to be retained in the tidy dataset) are extracted from the features dataframe using a regular expression search to locate mean() and std() metrics.
  - The consolidated frame is subsetted to include only the columns corresponding to the features of interest.
  - The feature names of interest are modified from the raw form to improve readability (details are shown in 'run_analysis.R'.
  - The "tidied" column names are applied to the consolidated metrics dataframe.
  - The numeric labels in the activity labels dataframe are overwritten with descriptive labels and the name of this column set to "Activity".
  - The subject data column name in the consolidated subject dataframe is set to "Subject".
  - The subject, activity, and metrics elements are combined to create single data frame, sorted by Subject.
  - A new consolidated "tidy" dataframe is created by calculating summary means based on grouping by Subject and Activity.
  - Additionally, a "tall" version on this consolidated "tidy" dataframe is produced by "melting" the measurement variable names into a single column alongside the corresponding numeric quantity in a separate column.
  - The output files 'HAR_tidy_wide.txt' and 'HAR_tidy_tall.txt' are written based on these consolidated "tidy" dataframes.







### License
Use of this dataset in publications must be acknowledged by referencing the following publication [1]. 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
