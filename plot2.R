## Exploratory Data Analysis
## Peer-graded Assignment: Course Project 1

## Loading the data

FileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(FileUrl, destfile = "electric_power_consumption.zip")
unzip("electric_power_consumption.zip", exdir = "C:/Users/smacvane/OneDrive/R/Coursera/datasciencecoursera/Exploratory_data_analysis")
powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# read the data from just dates 2007-02-01 and 2007-02-02

subpowerdata <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]

# Plot 2 - Global Active Power (plot2.png)
datetime <- strptime(paste(subpowerdata$Date, subpowerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subpowerdata$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, subpowerdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
