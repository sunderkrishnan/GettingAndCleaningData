## Getting and Cleaning Data - Course Project
January 2015
Sunder Krishnan


The goal of the project is to collect data and produce a tidy data set that can be used for further analysis. Here are the project instructions:


### Data and Reference Material
The data used for this project can be downloaded from [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#).


### Repository Contents
* **This README.md
* **CodeBook.md
* **R script - run_analysis.R
* **Tidy Data - Tidy_Smartphone_By_SubjectActivity.txt


### Other information
* **The "dplyr" package is needed to run the script successfully
* **The script should be run in the same directory as the unzipped "UCI HAR Dataset" directory


### What does the script do?
* 1. Ignores irrelevant files and imports the necessary data and informative files.
* 2. Merges the training and the test sets to create one data set.
* 3. Extracts only the measurements on the mean and standard deviation for each measurement. 
* 4. Uses descriptive activity names to name the activities in the data set
* 5. Appropriately labels the data set with descriptive variable names. 
* 6. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


