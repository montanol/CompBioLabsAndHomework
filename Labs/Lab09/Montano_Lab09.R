#Lab 9

#import camera trap data 
camData <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv", stringsAsFactors = F)
str(camData)
?strptime

#work with smaller pieces of the data
smallVec <- camData$DateTime[1:5]
oneDate <- camData$DateTime[1]


newSmallVec <- strptime(smallVec, format = "%d/%m/%Y %H:%M")
strptime(oneDate, format = "%d/%m/%Y %H:%M")

str(newSmallVec)


#try with whole DataTime vector
newDateTimeVec <- strptime(camData$DateTime, format = "%d/%m/%Y %H:%M")
str(newDateTimeVec)

#check which values have the 2 digit year format, TRUE = two digit year format
as.numeric(format(newDateTimeVec, "%Y")) < 2000
which(as.numeric(format(newDateTimeVec, "%Y")) < 2000)

#create an accurate vector of the dates and times, fix the two digit year format
