# Script to create plot2.png showing a histogram of Global Active Power
#
# Script assumes data is unzipped in the data subdirectory of your working directory
#
# read in raw data file and subset it based on the desired date range
rawDataID <- "./data/household_power_consumption.txt"
rawDataFile <- read.table(rawDataID, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetByDate <- rawDataFile[rawDataFile$Date %in% c("1/2/2007","2/2/2007") ,]
#
# Concatenate date and time and convert
#
dateTime <- strptime(paste(subsetByDate$Date, subsetByDate$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#
# Extract all needed variables as numeric
#
gAP <- as.numeric(subsetByDate$Global_active_power)

subMetering1 <- as.numeric(subsetByDate$Sub_metering_1)
subMetering2 <- as.numeric(subsetByDate$Sub_metering_2)
subMetering3 <- as.numeric(subsetByDate$Sub_metering_3)

gRP <- as.numeric(subsetByDate$Global_reactive_power)
voltage <- as.numeric(subsetByDate$Voltage)

#
# Set Device as PNG file and set up 2x2 plot space
#
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

#
# run all of the plots
#

plot(dateTime, gAP, type="l", xlab="", ylab="Global Active Power")

plot(dateTime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dateTime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(dateTime, subMetering2, type="l", col="red")
lines(dateTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, bty=0, col=c("black", "red", "blue"))

plot(dateTime, gRP, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
