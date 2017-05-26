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
# plotting data
hist(as.numeric(as.character(subSetData$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilo watts)", ylab = "Frequency")
#copying plotted graph to png file
dev.copy(png, file="plot1.png", height=480, width=480)
# closing connection with external plotting device
dev.off()