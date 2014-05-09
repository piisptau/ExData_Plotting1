hhpow <- read.csv("C:/Users/pt/Downloads/household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F, na.strings="?")

hhpow$Time <- strptime(paste(hhpow$Date, hhpow$Time), format='%d/%m/%Y %H:%M:%S')
hhpow$Date = as.Date(hhpow$Date, format="%d/%m/%Y")

hhc = subset(hhpow, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

par(mfrow=c(1,1))
par(mar=c(4.1,4.1,2.1,1.1))

hist(hhc$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

png("plot1.png", width = 480, height = 480)
hist(hhc$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

