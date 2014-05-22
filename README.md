CleaningDataProject
===================

Files for the project for the Coursera Getting and Cleaning Data Class

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

My script run_analysis.R does the following:

1) read in the relevant data described below:

- X_test measurements of all variables for the test set

- y_test activity codes for the test set

- subject_test subject numbers for the test set

- activity_labels a table to translate activity codes to activity names

- features <- the names for the columns in X test and X train

- X_train <- measurements for all variables for the training set

- y_train <- activity codes for the training set

- subject_train subject numbers for the training set

2) Append the test data to the bottom of the train data

3) Eliminate columns that do not contain mean() or std() summaries
We were instucted to keep just the mean and std columns. There were many columns that did not contain these varialbes, and they were elminated. I also chose to eliminate columns that might have had mean or std int he name, but did not contain the mean or std summary, indicated by the mean() or std() designation. The resulting 66 column names are describe in the codebook.

4) Add the subject and activity code as columns in the data set

5) Replace activity codes with named activities

6) Write tidy data with column means for each subject and activty to file
