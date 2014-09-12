Study design
=============================

The code in this repository is my work on an assignment for the Coursera course "Getting and Cleaning Data"

The purpose of project is to demonstrate processing on a set of data.   The original data is available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  with reference information at 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Information about the initial data collection and factors is available in the README.txt and features_info.txt files in the zip package

Only columns from the initial data that represent averages and standard deviations were selected

	Mapping from original column names to descriptive column names:
	-----------------
	 * Remove initial "t" or "f" from variable name.  Variable is understood to be time domain unless variable name ends with ".frequency" in which case it represents frequency domain.
	 * Replace  "Acc" with "accelerometer" "Gyro" with "gyroscope" "Mag"with "magnitude"
	 * Remove "-" "()" and turn to lowercase
 


Code book
============================= 

Merged training and test data is summarized by activity and subject by averaging each numeric columns.  The columns in the resulting "groupedsummary.txt" are:

 "activity" - Factor variable with 6 Levels: WALKING WALKING_UPSTAIRS WALKING_DOWNSTAIRS SITTING STANDING LAYING                                   
 "subject" - Identifier of the volunteer

	The remaining factors are normalized and bounded within [-1,1].  They are time domain signal measurements unless they are denoted with ".frequency".  

 "bodyaccelerometerxmean"                          
 "bodyaccelerometerymean"                          
 "bodyaccelerometerzmean"                          
 "bodyaccelerometerxstd"                           
 "bodyaccelerometerystd"                           
 "bodyaccelerometerzstd"                           
 "gravityaccelerometerxmean"                       
 "gravityaccelerometerymean"                       
 "gravityaccelerometerzmean"                       
 "gravityaccelerometerxstd"                        
 "gravityaccelerometerystd"                        
 "gravityaccelerometerzstd"                        
 "bodyaccelerometerjerkxmean"                      
 "bodyaccelerometerjerkymean"                      
 "bodyaccelerometerjerkzmean"                      
 "bodyaccelerometerjerkxstd"                       
 "bodyaccelerometerjerkystd"                       
 "bodyaccelerometerjerkzstd"                       
 "bodygyroscopexmean"                              
 "bodygyroscopeymean"                              
 "bodygyroscopezmean"                              
 "bodygyroscopexstd"                               
 "bodygyroscopeystd"                               
 "bodygyroscopezstd"                               
 "bodygyroscopejerkxmean"                          
 "bodygyroscopejerkymean"                          
 "bodygyroscopejerkzmean"                          
 "bodygyroscopejerkxstd"                           
 "bodygyroscopejerkystd"                           
 "bodygyroscopejerkzstd"                           
 "bodyaccelerometermagnitudemean"                  
 "bodyaccelerometermagnitudestd"                   
 "gravityaccelerometermagnitudemean"               
 "gravityaccelerometermagnitudestd"                
 "bodyaccelerometerjerkmagnitudemean"              
 "bodyaccelerometerjerkmagnitudestd"               
 "bodygyroscopemagnitudemean"                      
 "bodygyroscopemagnitudestd"                       
 "bodygyroscopejerkmagnitudemean"                  
 "bodygyroscopejerkmagnitudestd"                   
 "bodyaccelerometerxmean.frequency"                
 "bodyaccelerometerymean.frequency"                
 "bodyaccelerometerzmean.frequency"                
 "bodyaccelerometerxstd.frequency"                 
 "bodyaccelerometerystd.frequency"                 
 "bodyaccelerometerzstd.frequency"                 
 "bodyaccelerometerjerkxmean.frequency"            
 "bodyaccelerometerjerkymean.frequency"            
 "bodyaccelerometerjerkzmean.frequency"            
 "bodyaccelerometerjerkxstd.frequency"             
 "bodyaccelerometerjerkystd.frequency"             
 "bodyaccelerometerjerkzstd.frequency"             
 "bodygyroscopexmean.frequency"                    
 "bodygyroscopeymean.frequency"                    
 "bodygyroscopezmean.frequency"                    
 "bodygyroscopexstd.frequency"                     
 "bodygyroscopeystd.frequency"                     
 "bodygyroscopezstd.frequency"                     
 "bodyaccelerometermagnitudemean.frequency"        
 "bodyaccelerometermagnitudestd.frequency"         
 "bodybodyaccelerometerjerkmagnitudemean.frequency"
 "bodybodyaccelerometerjerkmagnitudestd.frequency" 
 "bodybodygyroscopemagnitudemean.frequency"        
 "bodybodygyroscopemagnitudestd.frequency"         
 "bodybodygyroscopejerkmagnitudemean.frequency"    
 "bodybodygyroscopejerkmagnitudestd.frequency"   
 
