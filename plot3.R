## loading data
getFile <- function(url, filename){
  zipname <- paste(filename, "zip", sep=".")
  download.file(url, zipname)
  
  unzip(zipname)  
}

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filename <- "household_power_consumption"
txtname <- paste(filename, "txt", sep=".")

if (!file.exists(txtname))
{
  getData(url, filename)
}

data <- read.csv(txtname, sep=";", quote="\"", header = TRUE,  na.strings = "?")

period <- data[data[,1]=="1/2/2007" | data[,1]=="2/2/2007",]

x <- strptime(paste(period$Date, period$Time), "%d/%m/%Y %H:%M:%S")

png("plot3.png")

plot(x, period$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")

lines(x, period$Sub_metering_2, col="red")
lines(x, period$Sub_metering_3, col="blue")

legend('topright',  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), col = c('black', 'red', 'blue'))

dev.off()