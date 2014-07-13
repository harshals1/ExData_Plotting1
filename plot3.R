#Global Active Power 
#Save data text file in data folder in working directory and name is as household_power_consumption.txt"

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
par(mar=c(4.1,4.1,4.1,2.1))
par(lheight=1)
with(data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
par(mar=c(1,0,0,0))
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1,y.intersp=1,cex=0.5,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
