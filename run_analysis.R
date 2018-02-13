# This script does the following:
#
# - downloads and unzips the HAR zip file,
# - reads in activity labels, features, test and training data,
# - does some cleaning up of variable names,
# - only keeps the mean and std measurements,
# - binds all the data into one big dataset,
# - makes a tidy data set of means of the measurement variables,
#   grouped by subject and activity

# See the README file for detailed info
# See the CodeBook for a description of the output dataset "tidy_data.txt"

# Load the required libraries
library(dplyr)
library(stringr)
library(rebus)

# Save the current working directory, to be used at the end of the script
WD <- getwd()

# Download and unzip the HARUS data
url <-
    "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "HAR.zip")
unzip("HAR.zip")

# Change the working directory
setwd("UCI HAR Dataset")

# Read the activity_labels text file
activities <- read.table(
    "activity_labels.txt",
    col.names = c("activityID", "activityType"),
    stringsAsFactors = FALSE
)

# Change activity names to lower case with first character upper case
activities[, 2] <- str_to_title(activities[, 2])

# Remove underscores from activity names
activities[, 2] <- str_replace(activities[, 2], "_", " ")

## Read features text file
features <- read.table("features.txt",
                       stringsAsFactors = FALSE)
colnames(features) <- c("featureID", "featureType")

# Find out which columns measure means, "mean()", and
# put these in a vector of row indices
mean_indices <-
    features[str_detect(features$featureType, "mean" %R% "\\(\\)"), 1]

# Find out which columns measure standard deviation, "std()", and
# put these in a vector of row indices
std_indices <-
    features[str_detect(features$featureType, "std" %R% "\\(\\)"), 1]

# Strip features data to only retain info about means and standard deviation
mean_or_std_indices <- sort(c(mean_indices, std_indices))
features <- features[mean_or_std_indices, ]

# Change feature measure namea in 4 steps
# 1. Change t to Time and f to Freq
features[, 2] <-
    str_replace_all(features[, 2], START %R% "t", "Time")
features[, 2] <-
    str_replace_all(features[, 2], START %R% "f", "Freq")

# 2. Change "BodyBody" to "Body"
features[, 2] <- str_replace_all(features[, 2], "BodyBody", "Body")

# 3. Replace "-mean()-" with "Mean"
features[, 2] <- str_replace_all(features[, 2], "mean", "Mean")

# 4. Replace "-std()-" with "Std"
features[, 2] <- str_replace_all(features[, 2], "std", "Std")

# 5. Strip "()" and "-"
features[, 2] <-
    str_replace_all(features[, 2], or("\\-", "\\(\\)"), "")

# Read the 3 test datasets
subject_test <- read.table("test/subject_test.txt",
                           col.names = "subjectID")
y_test <- read.table("test/y_test.txt",
                     col.names = "activityID")
X_test <- read.table("test/X_test.txt")

# Remove all but the mean and std columns
X_test <- X_test[, mean_or_std_indices]
colnames(X_test) <- features[, 2]

# Combine the 3 test datasets to 1 test dataset
test_data <- cbind(subject_test, y_test, X_test)

# Read the 3 training datasets
subject_train <- read.table("train/subject_train.txt",
                            col.names = "subjectID")
y_train <- read.table("train/y_train.txt",
                      col.names = "activityID")
X_train <- read.table("train/X_train.txt")

# Remove all but the mean and std columns
X_train <- X_train[, mean_or_std_indices]
colnames(X_train) <- features[, 2]

# Combine the 3 train datasets to 1 train dataset
train_data <- cbind(subject_train, y_train, X_train)

# Combine the test_data and train_data to one dataset
data <- rbind(test_data, train_data)

# Merge activity labels with data dataset
data <- merge(data, activities, by = "activityID")

# Group by subjectID and activityType and take averages of all measurements
tidy_data <- data %>%
    group_by(subjectID, activityType) %>%
    summarize_all(funs(mean)) %>%
    arrange(subjectID, activityID)

# Remove activityID column
tidy_data$activityID <- NULL

# Add mean to the column names that represent measurements
colnames(tidy_data)[3:68] <-
    paste("mean", colnames(tidy_data)[3:68], sep = "")

# Set working directory
setwd(WD)

# Write tidy dataset to file
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)
