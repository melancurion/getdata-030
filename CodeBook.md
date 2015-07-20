---
title: "CodeBook.md"
author: "melancurion"
date: "July 19, 2015"
---

# Code Book for HAR Tidy Dataset
## Background
The project purpose and a general description of the raw data are provided in the attached README file.

## Output Tidy Datasets
Note that two versions of the tidy data set are provided:

1. a "wide" set ('HAR_tidy_wide.txt') containing 180 observations of 68 variables (including two ID variables and 66 "Metric" fields containing summaries (means) of values derived from measurements or post-processing thereof); and

2. a "tall" set ('HAR_tidy_tall.txt') containing 11880 observations of 4 variables.

The "tall" set is derived from the "wide" set by retaining the ID Fields, and melting the "Metric" fields into a single "Parameter" field in which each value is the name of one of the defined Metric field names, and the corresponding entry in the new "Value" field contains the summary value. Please note that the naming conventions for the allowed values in the "Parameter" field are identical to the Metric Field Naming conventions described below.

## ID Fields
The same ID fields are applied in the "wide" and "tall" datasets.

| Field Name    | Allowed Values                                                       | Interpretation        |
| :-----------: | :------------------------------------------------------------------- | :-------------------- |
| Subject       | Integer in range [1, 30]                                             |  Human subject unique identifier | 
| Activity      | Character string in {"WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"} | Identifies the specific activity the test subject was engaged in during the observation. |

## Metric Fields
These fields contain summary (mean) values of all corresponding entries in the raw dataset for a given (Subject, Activity) pair.

### Metric Field Naming Convention
Each metric (i.e. non-key) field name consists of a concatenated set of substrings
of the form
{**domain-type**}{**measurement-type-1**}{**instrument-type**}{**measurement-type-2**}{**summary-type**}{**axial coordinate**},
where these substrings conform to the descriptions below.

------------------------------------------------------------
| Substring type     |Allowed values | Interpretation      |
|:-------------------|:--------------| :-------------------|
| domain-type        | 't' or 'f'    | Time domain metric or frequency domain metric derived from FFT analysis. |
| measurement-type-1 | 'Body' or  'Gravity'  | Body or gravity metric |
| instrument-type    | 'Acc' or 'Gyro'    | Acceleration or Angular Velocity    |
| measurement-type-2 | 'Jerk', 'Mag', or '' (*empty*)     | Jerk. Mag, or not applicable |
| summary-type       | 'Mean' or 'Std'     | Mean or Standard deviation |
| axial coordinate   | 'X', 'Y','Z', or '' (*empty*)      | X, Y, or Z coordinate  |


