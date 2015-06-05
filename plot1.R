#Load the datafile
dataFile <- "./data/household_power_consumption.txt"
fullData <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Filter the data only for the timeperiod required
myData <- fullData[fullData$Date %in% c("1/2/2007","2/2/2007") ,]

#Extract the data element (global active power) needed for the chart
globalActivePower <- as.numeric(mydata$Global_active_power)

#Initialize the file for the png device
png("plot1.png", width=480, height=480)

#Create the histogram
hist(globalActivePower, col="blue", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()