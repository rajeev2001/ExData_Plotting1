## Mention path of the dataset in working directory
power <- "./household_power_consumption.txt"

## Read full dataset and subset it
data <- read.table(power, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 
str(subset)

## Convert Global_active_power to numeric
globalActivePower <- as.numeric(subset$Global_active_power)

##   open PNG device and create 'plot1.png' in working directory

png("plot1.png", width=480, height=480)

## Create histogram and send to a file
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## close PNG file device
dev.off()