#Load the datafile
dataFile <- "./data/household_power_consumption.txt"
fullData <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Filter the data only for the timeperiod required
myData <- fullData[fullData$Date %in% c("1/2/2007","2/2/2007") ,]

#Extract the data element (global active power) needed for the chart
globalActivePower <- as.numeric(mydata$Global_active_power)

datetime <- strptime(paste(myData$Date, myData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Initialize the file for the png device
png("plot2.png", width=480, height=480)

#Plot the chart
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)",col="red")

dev.off()