#
# Exploratory Data Analysis Assigment 1 Plot 3 code
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
par(mar=c(4.1,4.1,2.1,1.1))

# Print the plot to the screen

par(mfrow=c(1,1))
plot(hhc$Time, hhc$Sub_metering_1, type="l", xlab="", ylim=c(0,40), ylab="Energy sub metering", col="black")
par(new=T)
plot(hhc$Time, hhc$Sub_metering_2, type="l", xlab="", ylab="", ylim=c(0,40), col="red")
par(new=T)
plot(hhc$Time, hhc$Sub_metering_3, type="l", xlab="", ylab="", ylim=c(0,40), col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub metering_3"), lty=c(1,1), col=c("black", "red","blue"), cex=0.7)
par(new=F)

# Print the same plot to a PNG file

png("plot3.png", width = 480, height = 480)
par(mfrow=c(1,1))
plot(hhc$Time, hhc$Sub_metering_1, type="l", xlab="", ylim=c(0,40), ylab="Energy sub metering", col="black")
par(new=T)
plot(hhc$Time, hhc$Sub_metering_2, type="l", xlab="", ylab="", ylim=c(0,40), col="red")
par(new=T)
plot(hhc$Time, hhc$Sub_metering_3, type="l", xlab="", ylab="", ylim=c(0,40), col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub metering_3"), lty=c(1,1), col=c("black", "red","blue"), cex=0.7)
par(new=F)
dev.off()

