## Exploratory Data Analysis
## Peer-graded Assignment: Course Project 1

## Loading the data

FileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(FileUrl, destfile = "electric_power_consumption.zip")
unzip("electric_power_consumption.zip", exdir = "C:/Users/smacvane/OneDrive/R/Coursera/datasciencecoursera/Exploratory_data_analysis")
powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# read the data from just dates 2007-02-01 and 2007-02-02

subpowerdata <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]

# Plot 4 - Panel (plot4.png)
datetime <- strptime(paste(subpowerdata$Date, subpowerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subpowerdata$Global_active_power)
globalReactivePower <- as.numeric(subpowerdata$Global_reactive_power)
voltage <- as.numeric(subpowerdata$Voltage)
submetering1 <- as.numeric(subpowerdata$Sub_metering_1)
submetering2 <- as.numeric(subpowerdata$Sub_metering_2)
submetering3 <- as.numeric(subpowerdata$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, submetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2.5, col=c("black", "red", "blue"), bty="n")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
