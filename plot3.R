

dataFile <- "household_power_consumption.txt"
electricData <- read.table(dataFile, header = TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")
# convering dates
electricData$Date <- as.Date(electricData$Date, format="%d/%m/%Y")
# Subsetting the data, selecting the data for Feb 1 & 2 
requiredData <- subset(electricData, (Date =="2007-02-01" | Date =="2007-02-02"))
# convering date and time
dateTime <- paste(as.Date(electricData$Date), electricData$Time)
electricData$dateTime <- as.POSIXct(dateTime)
# plot3
with(requiredData, {
  plot(Sub_metering_1~dateTime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
})
legend("topright", col=c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2)
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
