CleaningDataProject
===================

Files for the project for the Coursera Getting and Cleaning Data Class

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

My script run_analysis.R does the following:

1) read in the relevant data:

X_test measurements of all variables for the test set

y_test activity codes for the test set

subject_test subject numbers for the test set

activity_labels a table to translate activity codes to activity names

features <- the names for the columns in X test and X train

X_train <- measurements for all variables for the training set

y_train <- activity codes for the training set

subject_train subject numbers for the training set

2) eliminate columns that do not contain mean() or std()
There were many columns that did not contain these varialbes, and they were elminated. The resulting 66 column names are listed below:
