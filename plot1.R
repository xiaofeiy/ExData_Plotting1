plot1 <- function() {
  ## set working directory
  setwd("~/datasciencecoursera/exploratory data analysis/")
  ## read in data file
  data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
  ## subsetting data to the date of interest
  EPCdata <- data[data$Date == "1/2/2007"|data$Date == "2/2/2007",]
  ## combining columns Date and Time and convert to Date/Time classes
  EPCdata$DateTime <- paste(as.character.Date(EPCdata[,1]), as.character.POSIXt(EPCdata[,2]), sep = " ")
  EPCdata$DateTime <- strptime(EPCdata$DateTime, format = "%d/%m/%Y %H:%M:%S")
  ## open PNG graphic device
  png(filename = "plot1.png")
  ## create histogram
  hist(EPCdata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
  ## close graphic device
  dev.off()
}




