# GettingAndCleaningData
W4 assignment for Coursera course: Getting and Cleaning Data

The script included herein uses data obtained from a smartphone, which has been analyzed motion analysis. The original data has already been partly summarized, converting the raw data to averages, standard deviations, max & min data, etc., over rolling time segments. The raw summarized data were put in one file, while the variable names, subject ids and activity ids have been each placed in separate files. The data were then split into a testing set and a training set. The purpose of this assignment was to combine all of this information into a single flat file, pull out user averages for each of the activities in question for each required variable, and then store the averages in a tidy data set. The "required variables" were any that contained mean or standard deviation information. Variables containing information such as max and min information were excluded, as were any other variables which were not mean or standard deviation information.

The script accomplishes this with the following steps:
  1. Read in data from files
  2. Using a conversion table, converts the numeric activity code into a character string which indicates which activity is being recorded.
  3. Combines all of the data (from both training and testing data sets) into a single data frame, using the following steps:
    a. Two new columns were added to the left side of the table, containing the subject id and activity label.
    b. All columns were named, using "subject" and "activity" for the new columns and information from the "features.txt" file for the data columns.
    c. Identify the columns containing mean and standard deviation data.
    d. Combine the testing and training data sets, using only the required variables, into a single data frame.
  4. Create a new tidy data set by summarizing over subject id and activity label and storing the resulting data set into a new file
    a. Use group_by() to group the data set by subject and activity.
    a. The summarize() and across() functions were used here to give the mean by subject and activity "across" all columns containing data from the study.
