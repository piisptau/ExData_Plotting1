#
# Exploratory Data Analysis Assigment 1 Plot 1 code
#

# Read source data file

hhpow <- read.csv("C:/Users/pt/Downloads/household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F, na.strings="?")

# Change date and time columns to suitable format

hhpow$Time <- strptime(paste(hhpow$Date, hhpow$Time), format='%d/%m/%Y %H:%M:%S')
hhpow$Date = as.Date(hhpow$Date, format="%d/%m/%Y")

# Select a subset containing only dates 2007-02-01 and 2007-02-02

hhc = subset(hhpow, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Print histogram to screen

par(mfrow=c(1,1))
par(mar=c(4.1,4.1,2.1,1.1))

hist(hhc$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Print the same histogram to a PNG file

png("plot1.png", width = 480, height = 480)
hist(hhc$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

