## Getting and Cleaning Data - Course Project - Code Book
January 2015
Sunder Krishnan


The goal of the project is to collect data and produce a tidy data set that can be used for further analysis.


### Data and Reference Material
The data used for this project can be downloaded from [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#).

#### Explanation of the data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


### Other information
* The "dplyr" package is needed to run the script successfully
* The script should be run in the same directory as the downloaded and unzipped "UCI HAR Dataset"
* run_analysis.R was run in R v3.1.2 

### What does run_analysis.R do?
1. Ignores irrelevant files and imports the necessary data and informative files.
	* The data files under "Inertial Signals" are not considered

2. Merges the training and the test sets to create one data set.
	* This is done for the measurements (X), subjects and activities (y)

3. Extracts only the measurements on the mean and standard deviation for each measurement. 
	* The measurements descriptions (from features.txt) are imported
	* Only measurements that have "mean" and "stddev" in their names are retained

4. Uses descriptive activity names to name the activities in the data set
	* The activity names (from activity_labels.txt) are imported
	* They are merged with the measurements data to create a descriptive column called "activity"
	* Similarly, a new column called "subject" is created by merging the subject and measurements data 

5. Appropriately labels the data set with descriptive variable names. 
	* The following transformations are done to the variable names to make them descriptive and R-friendly
		* Replace beginning "f" with "freq"
		* Replace beginning "t" with "time"
		* Replace "mean" with "Mean"
		* Replace "std" with "StdDev"
		* Replace "Mag" with "Magnitude"
		* Replace "Acc" with "Acceleration"
		* Replace "BodyBody" with "Body"
		* Remove "()"
		* Repalce "-" with a "."
	(See below for the variable list in tidy data)

6. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
	* The tidy data set is written to 2 files - a .txt file and a .csv file.

## Variables in Tidy Data
The list of variables in the tidy set are listed below. The data is grouped by "subject" and "activity". The remaining 79 variables are the mean over "subject" and "activity" 
1. subject
2. activity
3. timeBodyAcceleration.Mean.X
4. timeBodyAcceleration.Mean.Y
5. timeBodyAcceleration.Mean.Z
6. timeBodyAcceleration.StdDev.X
7. timeBodyAcceleration.StdDev.Y
8. timeBodyAcceleration.StdDev.Z
9. timeGravityAcceleration.Mean.X
10. timeGravityAcceleration.Mean.Y
11. timeGravityAcceleration.Mean.Z
12. timeGravityAcceleration.StdDev.X
13. timeGravityAcceleration.StdDev.Y
14. timeGravityAcceleration.StdDev.Z
15. timeBodyAccelerationJerk.Mean.X
16. timeBodyAccelerationJerk.Mean.Y
17. timeBodyAccelerationJerk.Mean.Z
18. timeBodyAccelerationJerk.StdDev.X
19. timeBodyAccelerationJerk.StdDev.Y
20. timeBodyAccelerationJerk.StdDev.Z
21. timeBodyGyro.Mean.X
22. timeBodyGyro.Mean.Y
23. timeBodyGyro.Mean.Z
24. timeBodyGyro.StdDev.X
25. timeBodyGyro.StdDev.Y
26. timeBodyGyro.StdDev.Z
27. timeBodyGyroJerk.Mean.X
28. timeBodyGyroJerk.Mean.Y
29. timeBodyGyroJerk.Mean.Z
30. timeBodyGyroJerk.StdDev.X
31. timeBodyGyroJerk.StdDev.Y
32. timeBodyGyroJerk.StdDev.Z
33. timeBodyAccelerationMagnitude.Mean
34. timeBodyAccelerationMagnitude.StdDev
35. timeGravityAccelerationMagnitude.Mean
36. timeGravityAccelerationMagnitude.StdDev
37. timeBodyAccelerationJerkMagnitude.Mean
38. timeBodyAccelerationJerkMagnitude.StdDev
39. timeBodyGyroMagnitude.Mean
40. timeBodyGyroMagnitude.StdDev
41. timeBodyGyroJerkMagnitude.Mean
42. timeBodyGyroJerkMagnitude.StdDev
43. freqBodyAcceleration.Mean.X
44. freqBodyAcceleration.Mean.Y
45. freqBodyAcceleration.Mean.Z
46. freqBodyAcceleration.StdDev.X
47. freqBodyAcceleration.StdDev.Y
48. freqBodyAcceleration.StdDev.Z
49. freqBodyAcceleration.MeanFreq.X
50. freqBodyAcceleration.MeanFreq.Y
51. freqBodyAcceleration.MeanFreq.Z
52. freqBodyAccelerationJerk.Mean.X
53. freqBodyAccelerationJerk.Mean.Y
54. freqBodyAccelerationJerk.Mean.Z
55. freqBodyAccelerationJerk.StdDev.X
56. freqBodyAccelerationJerk.StdDev.Y
57. freqBodyAccelerationJerk.StdDev.Z
58. freqBodyAccelerationJerk.MeanFreq.X
59. freqBodyAccelerationJerk.MeanFreq.Y
60. freqBodyAccelerationJerk.MeanFreq.Z
61. freqBodyGyro.Mean.X
62. freqBodyGyro.Mean.Y
63. freqBodyGyro.Mean.Z
64. freqBodyGyro.StdDev.X
65. freqBodyGyro.StdDev.Y
66. freqBodyGyro.StdDev.Z
67. freqBodyGyro.MeanFreq.X
68. freqBodyGyro.MeanFreq.Y
69. freqBodyGyro.MeanFreq.Z
70. freqBodyAccelerationMagnitude.Mean
71. freqBodyAccelerationMagnitude.StdDev
72. freqBodyAccelerationMagnitude.MeanFreq
73. freqBodyAccelerationJerkMagnitude.Mean
74. freqBodyAccelerationJerkMagnitude.StdDev
75. freqBodyAccelerationJerkMagnitude.MeanFreq
76. freqBodyGyroMagnitude.Mean
77. freqBodyGyroMagnitude.StdDev
78. freqBodyGyroMagnitude.MeanFreq
79. freqBodyGyroJerkMagnitude.Mean
80. freqBodyGyroJerkMagnitude.StdDev
81. freqBodyGyroJerkMagnitude.MeanFreq
