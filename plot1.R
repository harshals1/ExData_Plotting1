#Global Active Power
#Save data text file in data folder in working directory and name is as household_power_consumption.txt"
#Install package data.table if not installed
#install.packages(data.table)
library(data.table)
DT <- fread("./data/household_power_consumption.txt",stringsAsFactors=FALSE)
DT[DT=="?"] <- NA
#summary(DT)
#head(DT1,10)
DT$Date <- as.Date(DT$Date,"%d/%m/%Y")
DT1.Time <- as.Date(DT1$Time, "%H:%M:%S")
DT1 <- DT[DT$Date >= as.Date("01/02/2007","%d/%m/%Y") & DT$Date <= as.Date("02/02/2007","%d/%m/%Y")]
DT <- NULL
#summary(DT1)
DT1$Global_active_power <- as.numeric(DT1$Global_active_power)
hist(DT1$Global_active_power,xlab="Global Active Power(kilowatts)",
     ylab="Frequency",
     main="Global Active Power",
     col = "Red")
