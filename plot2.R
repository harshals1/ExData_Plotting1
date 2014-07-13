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
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
