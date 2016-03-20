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
 subMetering1 <- as.numeric(subset$Sub_metering_1)
 subMetering2 <- as.numeric(subset$Sub_metering_2)
 subMetering3 <- as.numeric(subset$Sub_metering_3)
 
##   open PNG device and create 'plot3.png' in working directory
 png("plot3.png", width=480, height=480)
 plot(datetimestrp, subMetering1, type="l", ylab="Energy Submetering", xlab="")
 lines(datetimestrp, subMetering2, type="l", col="red")
 lines(datetimestrp, subMetering3, type="l", col="blue")
 legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
 
## close PNG file device
 dev.off() 