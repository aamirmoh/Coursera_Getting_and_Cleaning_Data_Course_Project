#a code book that describes the variables, the data, and any transformations or work that you performed to 
#clean up the data called CodeBook.md

Note: 
1. this is not a copy of featuresinfo,txt file
2. activityID column has been removed from the data set, since it was a repeat of the same activity Data, also available in activityType column

I've removed it as following. 

tidyDataSet <- select(mergedData,-(activityID)) %>%
    group_by(subjectID,activityType) %>%
        summarise_all(mean)


The following columns are available in the tidyDataSet.txt file. 

"subjectID"                                
"TimeBodyAccelerationMean-X"                
"TimeBodyAccelerationMean-Y"               
"TimeBodyAccelerationMean-Z"                
"TimeBodyAccelerationStdDev-X"             
"TimeBodyAccelerationStdDev-Y"              
"TimeBodyAccelerationStdDev-Z"             
"TimeGravityAccelerationMean-X"             
"TimeGravityAccelerationMean-Y"            
"TimeGravityAccelerationMean-Z"             
"TimeGravityAccelerationStdDev-X"          
"TimeGravityAccelerationStdDev-Y"           
"TimeGravityAccelerationStdDev-Z"          
"TimeBodyAccelerationJerkMean-X"            
"TimeBodyAccelerationJerkMean-Y"           
"TimeBodyAccelerationJerkMean-Z"            
"TimeBodyAccelerationJerkStdDev-X"         
"TimeBodyAccelerationJerkStdDev-Y"          
"TimeBodyAccelerationJerkStdDev-Z"         
"TimeBodyGyroMean-X"                        
"TimeBodyGyroMean-Y"                       
"TimeBodyGyroMean-Z"                        
"TimeBodyGyroStdDev-X"                     
"TimeBodyGyroStdDev-Y"                      
"TimeBodyGyroStdDev-Z"                     
"TimeBodyGyroJerkMean-X"                    
"TimeBodyGyroJerkMean-Y"                   
"TimeBodyGyroJerkMean-Z"                    
"TimeBodyGyroJerkStdDev-X"                 
"TimeBodyGyroJerkStdDev-Y"                  
"TimeBodyGyroJerkStdDev-Z"                 
"TimeBodyAccelerationMagnitudeMean"         
"TimeBodyAccelerationMagnitudeStdDev"      
"TimeGravityAccelerationMagnitudeMean"      
"TimeGravityAccelerationMagnitudeStdDev"   
"TimeBodyAccelerationJerkMagnitudeMean"     
"TimeBodyAccelerationJerkMagnitudeStdDev"  
"TimeBodyGyroMagnitudeMean"                 
"TimeBodyGyroMagnitudeStdDev"              
"TimeBodyGyroJerkMagnitudeMean"             
"TimeBodyGyroJerkMagnitudeStdDev"          
"FreqBodyAccelerationMean-X"                
"FreqBodyAccelerationMean-Y"               
"FreqBodyAccelerationMean-Z"                
"FreqBodyAccelerationStdDev-X"             
"FreqBodyAccelerationStdDev-Y"              
"FreqBodyAccelerationStdDev-Z"             
"FreqBodyAccelerationMeanFreq-X"            
"FreqBodyAccelerationMeanFreq-Y"           
"FreqBodyAccelerationMeanFreq-Z"            
"FreqBodyAccelerationJerkMean-X"           
"FreqBodyAccelerationJerkMean-Y"            
"FreqBodyAccelerationJerkMean-Z"           
"FreqBodyAccelerationJerkStdDev-X"          
"FreqBodyAccelerationJerkStdDev-Y"         
"FreqBodyAccelerationJerkStdDev-Z"          
"FreqBodyAccelerationJerkMeanFreq-X"       
"FreqBodyAccelerationJerkMeanFreq-Y"        
"FreqBodyAccelerationJerkMeanFreq-Z"       
"FreqBodyGyroMean-X"                        
"FreqBodyGyroMean-Y"                       
"FreqBodyGyroMean-Z"                        
"FreqBodyGyroStdDev-X"                     
"FreqBodyGyroStdDev-Y"                      
"FreqBodyGyroStdDev-Z"                     
"FreqBodyGyroMeanFreq-X"                    
"FreqBodyGyroMeanFreq-Y"                   
"FreqBodyGyroMeanFreq-Z"                    
"FreqBodyAccelerationMagnitudeMean"        
"FreqBodyAccelerationMagnitudeStdDev"       
"FreqBodyAccelerationMagnitudeMeanFreq"    
"FreqBodyAccelerationJerkMagnitudeMean"     
"FreqBodyAccelerationJerkMagnitudeStdDev"  
"FreqBodyAccelerationJerkMagnitudeMeanFreq" 
"FreqBodyGyroMagnitudeMean"                
"FreqBodyGyroMagnitudeStdDev"               
"FreqBodyGyroMagnitudeMeanFreq"            
"FreqBodyGyroJerkMagnitudeMean"             
"FreqBodyGyroJerkMagnitudeStdDev"          
"FreqBodyGyroJerkMagnitudeMeanFreq"         
"activityType" 


Column Names were cleaned by using string substitution

colnames(allDF) <- gsub("\\()","",colnames(allDF))
colnames(allDF) <- gsub("-std","StdDev",colnames(allDF))
colnames(allDF) <- gsub("-mean","Mean",colnames(allDF))
colnames(allDF) <- gsub("^(t)","Time",colnames(allDF))
colnames(allDF) <- gsub("^(f)","Freq",colnames(allDF))
colnames(allDF) <- gsub("([Gg]ravity)","Gravity",colnames(allDF))
colnames(allDF) <- gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colnames(allDF))
colnames(allDF) <- gsub("[Gg]yro","Gyro",colnames(allDF))
colnames(allDF) <- gsub("[Mm]ag","Magnitude",colnames(allDF))
colnames(allDF) <- gsub("[Aa]cc","Acceleration",colnames(allDF))

In addition the activity data set is merged with training and test data sets. The data is merged using the activityId Column.
  activityID       activityType
   1            WALKING
   2            WALKING_UPSTAIRS
   3            WALKING_DOWNSTAIRS
   4            SITTING
   5            STANDING
   6            LAYING
