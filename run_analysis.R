    currdir<-getwd()
    
    ## 1. read in relevant data files
    
    X_test <- read.table(paste0(currdir,"/UCI HAR Dataset/test/X_test.txt"), quote="\"")
    y_test <- read.table(paste0(currdir,"/UCI HAR Dataset/test/y_test.txt"), quote="\"")
    subject_test <- read.table(paste0(currdir,"/UCI HAR Dataset/test/subject_test.txt"), quote="\"")
    activity_labels <- read.table(paste0(currdir,"/UCI HAR Dataset/activity_labels.txt"), quote="\"")
    features <- read.table(paste0(currdir,"/UCI HAR Dataset/features.txt"), quote="\"")
    X_train <- read.table(paste0(currdir,"/UCI HAR Dataset/train/X_train.txt"), quote="\"")
    y_train <- read.table(paste0(currdir,"/UCI HAR Dataset/train/y_train.txt"), quote="\"")
    subject_train <- read.table(paste0(currdir,"/UCI HAR Dataset/train/subject_train.txt"), quote="\"")
    
    
    ## make a list in desiredcols of the columns that have either -mean() or -std()
    meancol<-grep("-mean()",features[,2], fixed=TRUE)
    stdcol<-grep("-std()",features[,2],fixed=TRUE)
    desiredcol<-sort(c(stdcol,meancol))
    
    ## 2. append the test data to the bottom of the train data
    data_set<-rbind(X_train,X_test)
    
    ## remove () from column names and apply to data_set
    features[,2]<-gsub("\\(\\)","",features[,2])
    colnames(data_set)<-features[,2]
    
    ## 3. reduce data set to only desired columns
    data_set<-data_set[,desiredcol]
    
    ## 4. add the Subject and Activity Info to the data set
    Subject<-rbind(subject_train,subject_test)
    Activity<-rbind(y_train,y_test)
    data_set<-cbind(data_set,Subject,Activity)
    names(data_set)[67:68]<-c("SubjectName", "Activity")
    
    ## 5. replace Activities with named activities
    library(plyr)
    colnames(activity_labels)=c("Activity","ActivityName")
    data_set <- join(data_set, activity_labels, by = "Activity")
    data_set<-subset(data_set, select=-Activity)
    
    ## 6. write tidy data with column means for each subject and activty to file
    tidy<-ddply(data_set, .(SubjectName, ActivityName),  numcolwise(mean))
    filename<-"tidy.txt"
    write.table(tidy, file=filename,row.names=FALSE, sep=",")
    
    
