#
# Exploratory Data Analysis Assigment 1 Plot 2 code
#

# Read source data file

hhpow <- read.csv("C:/Users/pt/Downloads/household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F, na.strings="?")

# Change date and time columns to suitable format

hhpow$Time <- strptime(paste(hhpow$Date, hhpow$Time), format='%d/%m/%Y %H:%M:%S')
hhpow$Date = as.Date(hhpow$Date, format="%d/%m/%Y")

# Select a subset containing only dates 2007-02-01 and 2007-02-02

hhc = subset(hhpow, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Set locale so that the plot x axis weekday labels show up in english

Sys.setlocale(category = "LC_ALL", locale = "C")
par(mfrow=c(1,1))
par(mar=c(4.1,4.1,2.1,1.1))

# Print the plot to the screen

plot(hhc$Time, hhc$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Print the same plot to a PNG file

png("plot2.png", width = 480, height = 480, bg = "transparent")
plot(hhc$Time, hhc$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()


