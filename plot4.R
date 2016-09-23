

dataFile <- "household_power_consumption.txt"
electricData <- read.table(dataFile, header = TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")
# Subsetting the data, selecting the data for Feb 1 & 2 
requiredData <- subset(electricData, (Date =="2007-02-01" | Date =="2007-02-02"))
# convering dates
dateTime <- paste(as.Date(requiredData$Date), requiredData$Time)
requiredData$dateTime <- as.POSIXct(dateTime)
# plot4
par(mfrow=c(2,2), mar=c(4,4,2,1))
# 1
plot(requiredData$Global_active_power~requiredData$dateTime, type="l", xlab =" ", ylab="Global Active Power (kilowatts)")
# 2
plot(requiredData$Voltage~requiredData$dateTime, type="l", xlab ="datetime", ylab="Voltage")
# 3
with(requiredData, {
  plot(Sub_metering_1~dateTime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
})
legend("topright", col=c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, bty="n")
# 4
plot(requiredData$Global_reactive_power~requiredData$dateTime, type="l", xlab ="datetime", ylab="Global_reactive_power")
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()