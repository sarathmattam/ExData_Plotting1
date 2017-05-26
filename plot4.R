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
# setting frame to plot
par(mfrow=c(2,2))
#plot1
plot(subSetData$TimeStamp, subSetData$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
#plot2
plot(subSetData$TimeStamp, subSetData$Voltage, type = "l", xlab = "datetime", ylab = "Global Active Power (kilowatts)")
#plot3
with(subSetData, plot(TimeStamp, Sub_metering_1, type = "n", xlab="Energy Sub Metering", ylab="Global Active Power (kilowatts)"))
points(subSetData$TimeStamp, as.numeric(as.character(subSetData$Sub_metering_1)), type = "l")
points(subSetData$TimeStamp, as.numeric(as.character(subSetData$Sub_metering_2)), type = "l", col = "red")
points(subSetData$TimeStamp, as.numeric(as.character(subSetData$Sub_metering_3)), type = "l", col = "blue")
#plot4
plot(subSetData$TimeStamp, as.numeric(as.character(subSetData$Global_reactive_power)), type = "l", xlab = "datetime", ylab = "Global Active Power (kilowatts)")
#copying plotted graph to png file
dev.copy(png, file="plot4.png", height=480, width=480)
# closing connection with external plotting device
dev.off()