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
# Extract the Global Active Power variable as a numeric (currently a character class)
# (commented out as not needed for this plot)
# gAP <- as.numeric(subsetByDate$Global_active_power)
#
# Extract the 3 Sub Metering variables
#
subMetering1 <- as.numeric(subsetByDate$Sub_metering_1)
subMetering2 <- as.numeric(subsetByDate$Sub_metering_2)
subMetering3 <- as.numeric(subsetByDate$Sub_metering_3)
#
# Set Device as PNG file
#
png("plot3.png", width=480, height=480)
plot(dateTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dateTime, subMetering2, type="l", col="red")
lines(dateTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

