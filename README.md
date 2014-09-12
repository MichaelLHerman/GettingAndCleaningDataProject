GettingAndCleaningDataProject
=============================

The code in this repository is my work on an assignment for the Coursera course "Getting and Cleaning Data"

The purpose of project is to demonstrate processing on a set of data.   The original data is available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  with reference information at 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The project contains a single script file, "run_analysis.R", which has the prerequisite of having the accelerometer data zip file extracted to the current working directory.   The output of the script file is "groupedsummary.txt"


Processing steps
---------------------------- 

 *  The original data is stored in two sets, training and test.  The script merges the data.  ("train/y_train.txt", "test/subject_test.txt")
 *  The two columns of the data (activity id and subject number) are stored in separate files for each dataset ("test/y_test.txt", "test/subject_test.txt",  "train/subject_train.txt", "train/y_train.txt").   The script adds the columns into the final data set and turns the "activity" column into a factor, using factor labels from "activity_labels.txt".
 *  Column names are stored in a separate file ("features.txt").  The script selects only the data columns that represent averages and standard deviations of the data,  and renames the columns (removing abbreviations) to yield more descriptive variable names.   A listing of the variables and their transformation is available in "codebook.md"
 *  A summary of the data is performed, where the data is grouped by each activity and each subject and averages for all of the remaining columns are calculated and is written to "groupedsummary.txt"

 
