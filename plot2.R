## Mention path of the dataset in working directory
power <- "./household_power_consumption.txt"

## Read full dataset and subset it
data <- read.table(power, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 
str(subset)

## convert the Date and Time variables to Date/Time classes in R
 datetimestrp <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


## Convert Global_active_power to numeric data type
 globalActivePower <- as.numeric(subset$Global_active_power)

##   open PNG device and create 'plot2.png' in working directory

 png("plot2.png", width=480, height=480)

## Create plot and send to a file
 plot(datetimestrp, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
 
## close PNG file device
 dev.off()