plot3 <- function() {
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
  png(filename = "plot3.png")
  ## plot Sub_metering_1
  plot(EPCdata$DateTime,EPCdata$Sub_metering_1,col = "black",type = "l",xlab = "", ylab = "Energy sub metering")
  ## add line for Sub_metering_2
  lines(EPCdata$DateTime,EPCdata$Sub_metering_2,col = "red")
  ## add line for Sub_metering_3
  lines(EPCdata$DateTime,EPCdata$Sub_metering_3,col = "blue")
  ## add legend
  legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lwd = 1)
  ## close graphic device
  dev.off()
}