# run_analysis.R
# Coursera Getting and Cleaning Data Course Project

library(dplyr)

# 1. Read metadata files
features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)

# 2. Read training data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

# 3. Read test data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")

# 4. Assign feature names to x_train and x_test
feature_names <- features$V2
colnames(x_train) <- feature_names
colnames(x_test) <- feature_names

# 5. Merge training and test datasets
train_data <- cbind(subject_train, y_train, x_train)
test_data <- cbind(subject_test, y_test, x_test)
merged_data <- rbind(train_data, test_data)

# 6. Extract only columns with mean() and std()
mean_std_columns <- grep("mean\\(\\)|std\\(\\)", names(merged_data))
data_mean_std <- merged_data[, c(1, 2, mean_std_columns)]

# 7. Use descriptive activity names
colnames(activity_labels) <- c("activity", "activity_name")
data_mean_std <- merge(data_mean_std, activity_labels, by = "activity")

# 8. Reorder columns so subject and activity_name come first
data_mean_std <- data_mean_std %>%
  select(subject, activity_name, everything(), -activity)

# 9. Clean variable names
clean_names <- names(data_mean_std)
clean_names <- gsub("^t", "time", clean_names)
clean_names <- gsub("^f", "frequency", clean_names)
clean_names <- gsub("Acc", "Accelerometer", clean_names)
clean_names <- gsub("Gyro", "Gyroscope", clean_names)
clean_names <- gsub("Mag", "Magnitude", clean_names)
clean_names <- gsub("BodyBody", "Body", clean_names)
clean_names <- gsub("-mean\\(\\)", "Mean", clean_names)
clean_names <- gsub("-std\\(\\)", "Std", clean_names)
clean_names <- gsub("-", "", clean_names)
clean_names <- gsub("\\(\\)", "", clean_names)
names(data_mean_std) <- clean_names

# 10. Create second tidy dataset with average of each variable
tidy_data <- data_mean_std %>%
  group_by(subject, activity_name) %>%
  summarise(across(everything(), mean), .groups = "drop")

# 11. Write final tidy dataset
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)

# 12. Optional preview
print(head(tidy_data))

