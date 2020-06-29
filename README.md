# Data-Cleaning-Assignment
Assignment submission under Getting and Cleaning Data Course by John Hopkins University

run_analysis takes in the directory of the folder containing the data provided by the assignment (default ="UCI HAR Dataset)

With the directory of the folder containing the data, firstly read the raw features.txt, x_train.txt, y_train.txt, subject_train.txt, x_test.txt, y_test.txt, subject_test.txt into respective data frames.

Using rbind, merge the x_train and x_test dataframes, y_train and y_test dataframes, subject_train and subject_test dataframes.

Using grep, filter x dataframe to those columns that contain either the word "mean" or "std".

Using a character vector that contains the descriptions for the separate numbers indicataed in activity_labels.txt, change the numbers in the y dataframe to their respective activity labels.

Using cbind, merge the x dataframe and y dataframe to obtain a x-y dataframe with appropriate activity labels and containing only measurements of either mean or std.

Using cbind, merge the x-y and subject id data frames.

Using aggregate function from plyr library, apply the mean function to the dataframe according to subject id and the activity labels.

Using write.table, produce a .txt file with name "tidy.txt" that contains tidied data for the average of each measurement for each activity and each subject.

Feel free to refer to the codebook for a comprehensive explanation about what each variable means! :)
