## Mention path of the dataset in working directory
power <- "./household_power_consumption.txt"

## Read full dataset and subset it
data <- read.table(power, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 
str(subset)


## convert the Date and Time variables to Date/Time classes in R
datetimestrp <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Convert to numeric data type
 globalActivePower <- as.numeric(subset$Global_active_power)
 globalReactivePower <- as.numeric(subset$Global_reactive_power)
 voltage <- as.numeric(subset$Voltage)
 subMetering1 <- as.numeric(subset$Sub_metering_1)
 subMetering2 <- as.numeric(subset$Sub_metering_2)
 subMetering3 <- as.numeric(subset$Sub_metering_3)
 
 ##   open PNG device and create 'plot4.png' in working directory

 png("plot4.png", width=480, height=480)
 par(mfrow = c(2, 2)) 
 
 plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
 
 plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
 
 plot(datetimestrp, subMetering1, type="l", ylab="Energy Submetering", xlab="")
 lines(datetimestrp, subMetering2, type="l", col="red")
 lines(datetimestrp, subMetering3, type="l", col="blue")
 legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
 
 plot(datetimestrp, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
 
## close PNG file device
 dev.off()