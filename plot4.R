#Global Active Power on Y axis
#Save data text file in data folder in working directory and name is as household_power_consumption.txt"
#unzip("data/*****.zip", exdir="data") #for unzip data

DT <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", 
               quote='\"')
DT$Date <- as.Date(DT$Date, format="%d/%m/%Y")

# Subsetting the data
data <- subset(DT, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# removed main data from memory
rm(DT) 

## date conversion
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## actual plot
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",cex=0.5,
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})


#copy png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
