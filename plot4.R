#Load the datafile
dataFile <- "./data/household_power_consumption.txt"
fullData <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Filter the data only for the timeperiod required
myData <- fullData[fullData$Date %in% c("1/2/2007","2/2/2007") ,]

#Extract the global active power data needed for the chart
globalActivePower <- as.numeric(mydata$Global_active_power)

datetime <- strptime(paste(myData$Date, myData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Extract the submetering data
subMetering1 <- as.numeric(myData$Sub_metering_1)
subMetering2 <- as.numeric(myData$Sub_metering_2)
subMetering3 <- as.numeric(myData$Sub_metering_3)

#Extract the Global Reactive Power data
globalReactivePower <- as.numeric(myData$Global_reactive_power)

voltage <- as.numeric(myData$Voltage)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()