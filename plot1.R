# Script to create plot1.png showing a histogram of Global Active Power
#
# Script assumes data is unzipped in the data subdirectory of your working directory
#
# read in raw data file and subset it based on the desired date range
rawDataID <- "./data/household_power_consumption.txt"
rawDataFile <- read.table(rawDataID, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetByDate <- rawDataFile[rawDataFile$Date %in% c("1/2/2007","2/2/2007") ,]
#
# Extract the Global Active Power variable as a numeric (currently a character class)
#
gAP <- as.numeric(subsetByDate$Global_active_power)
#
# Set Device as PNG file
png("plot1.png", width=480, height=480)
hist(gAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()