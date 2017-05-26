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
# plotting with data points
with(subSetData, plot(TimeStamp, Sub_metering_1, type = "n", xlab="", ylab="Energy Sub Metering"))
points(subSetData$TimeStamp, as.numeric(as.character(subSetData$Sub_metering_1)), type = "l")
points(subSetData$TimeStamp, as.numeric(as.character(subSetData$Sub_metering_2)), type = "l", col = "red")
points(subSetData$TimeStamp, as.numeric(as.character(subSetData$Sub_metering_3)), type = "l", col = "blue")
# Setting legend
legend("topright", lty=1, col = c("Black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#copying plotted graph to png file
dev.copy(png, file="plot3.png", height=480, width=480)
# closing connection with external plotting device
dev.off()