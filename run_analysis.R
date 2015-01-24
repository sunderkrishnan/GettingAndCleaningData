# load required library
library (dplyr)

# Assumption: The script is placed in the "UCI HAR Dataset" directory
# First read the data from the required files

activity_labels <- read.table ("activity_labels.txt")

features <- read.table ("features.txt")

subject_text <- read.table ("test/subject_test.txt")
X_test <- read.table ("test/X_test.txt")
y_test <- read.table ("test/y_test.txt")

subject_train <- read.table ("train/subject_train.txt")
X_train <- read.table ("train/X_train.txt")
y_train <- read.table ("train/y_train.txt")


# First step is to merge the test and train data
merged_data <- rbind (X_test, X_train)

# merge_data has 561 columns but the column names are not informative
# The description of the column names are in the features data frame under column V2
# We use that to rename the columns
colnames (merged_data) <- as.character (features$V2)

# Now that we have column names, we can get rid of the columns we don't need
# We just need the columns with mean and std in the names
# That way, we are working with the smaller set
keep_cols <- grep ("std|mean", colnames(merged_data))
merged_data <- merged_data [, keep_cols]

# Rename column names to be more descriptive
# And remove "()" and "-",  replace "BodyBody" with "Body"
col_renames <- colnames(merged_data)
col_renames <- gsub ("^t", "time", col_renames)
col_renames <- gsub ("^f", "freq", col_renames)
col_renames <- gsub ("mean", "Mean", col_renames)
col_renames <- gsub ("std", "StdDev", col_renames)
col_renames <- gsub ("Mag", "Magnitude", col_renames)
col_renames <- gsub ("BodyBody", "Body", col_renames)
col_renames <- gsub ("Acc", "Acceleration", col_renames)
col_renames <- gsub ("[()]", "", col_renames)
col_renames <- gsub ("[-]", ".",col_renames)
colnames (merged_data) <- col_renames

# Now to add the subject to the data collection
# First merge the test and train subject data
merged_subject <- rbind (subject_test, subject_train)
names(merged_subject)[1] <- "subject"
merged_data <- cbind (merged_subject, merged_data) 

# Next we add the activity type
# First we merge the test and train activities
# Then we use the appropriate label names
# and lastly merge to the merged_data dataframe
merged_activity <- rbind (y_test, y_train)
merged_activity <- activity_labels$V2[merged_activity[,1]]
merged_activity_df <- data.frame (merged_activity)
names(merged_activity_df)[1] <- "activity"
merged_data <- data.frame (merged_data$subject, merged_activity_df, merged_data[, 2:ncol(merged_data)] )
names(merged_data)[1] <- "subject"

# Now that we have everything, we create the tidy data set
tidy_data <- merged_data %>% 
			group_by (subject, activity) %>%
			summarise_each ( funs(mean))

# Write the tidy data to file
write.table (tidy_data, "Tidy_Smartphone_By_SubjectActivity.txt", row.name=FALSE)
