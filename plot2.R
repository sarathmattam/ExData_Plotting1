#clearing varibles in the environment
rm(list=ls(all=T))
# Reading data
powerData <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")
# Formatting Date column
powerData$Date <- as.Date(powerData$Date, format = "%d/%m/%Y")
# Subsetting data 
subSetData <- subset(powerData, (Date == "2007-02-01" | Date == "2007-02-02"))
# Deleting master data
rm("powerData")
# transforming data to create Timestamp field
subSetData <- transform(subSetData, TimeStamp = strptime(paste(Date, Time, sep=" "), "%Y-%m-%d %H:%M:%S"))
# plotting graph for Timestamp and Global Active Power
plot(subSetData$TimeStamp, subSetData$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
#copying plotted graph to png file
dev.copy(png, file="plot2.png", height=480, width=480)
# closing connection with external plotting device
dev.off()