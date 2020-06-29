run_analysis <- function(directory="UCI HAR Dataset"){
    #input directory of main folder
  initialwd <- getwd()
  setwd(directory)
  mainwd <- getwd()
    #create a dataframe with features
  features <- read.table("features.txt")

  # merge training and test sets to create one data set, with appropriate 
  #variable names
  setwd("train")
  x_train <- read.table("X_train.txt",col.names = features$V2)
  y_train <- read.table("Y_train.txt",col.names="Activity")
  subject_train <- read.table("subject_train.txt",col.names="Subject_ID")

  setwd(mainwd)
  setwd("test")
  x_test <- read.table("X_test.txt",col.names= features$V2)
  y_test <- read.table("Y_test.txt",col.names = "Activity")
  subject_test <- read.table("subject_test.txt",col.names="Subject_ID")
  
  merged_x <- rbind(x_train,x_test)
  merged_y <- rbind(y_train,y_test)
  merged_subject <- rbind(subject_train,subject_test)
  
  setwd(initialwd)
  # extracts measurements on mean and sd for each measurement
    # check which columns describe mean and std
  meanstd_col <- grep("mean|std",names(merged_x))
    # refine merged x data to only include mean and std
  merged_x <- merged_x[,meanstd_col]
  
  # name activities in data set accordingly
  activity_list <- c("WALKING","WALKING UPSTAIRS","WALKING DOWNSTAIRS","SITTING",
                     "STANDING","LAYING")
  merged_y$Activity <- activity_list[merged_y$Activity]
  merged_data <- cbind(merged_y,merged_x)
 
   # create second independent tidy data set with average for each variable for 
  #each activity and for each subject
  tidy <- cbind(merged_subject,merged_data)
    # use aggregate from plyr library to apply mean function to all columns 
    #according to subject id and activity
  tidy <- aggregate(.~Subject_ID + Activity, tidy, mean)
  #write.table(tidy, file ="tidy.txt",row.names= FALSE)
  
}