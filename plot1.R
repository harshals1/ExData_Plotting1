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
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
