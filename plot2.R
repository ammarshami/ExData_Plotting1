

dataFile <- "household_power_consumption.txt"
electricData <- read.table(dataFile, header = TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")
# Subsetting the data, selecting the data for Feb 1 & 2 
requiredData <- subset(electricData, (Date =="2007-02-01" | Date =="2007-02-02"))
# convering date and time
dateTime <- paste(as.Date(requiredData$Date), requiredData$Time)
requiredData$dateTime <- as.POSIXct(dateTime)
# plot2
plot(requiredData$Global_active_power~requiredData$dateTime, type="l", xlab =" ", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()






