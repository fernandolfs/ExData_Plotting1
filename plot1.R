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

png("plot1.png")

hist(period$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

dev.off()
