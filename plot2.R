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
#
gAP <- as.numeric(subsetByDate$Global_active_power)
#
# Set Device as PNG file
png("plot2.png", width=480, height=480)
plot(dateTime, gAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()