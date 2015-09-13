rm(list=ls())
#read all data
alldat<-read.csv2("household_power_consumption.txt", colClasses = "character")
#select data for 2 days
dt<-alldat[as.Date("2007-02-01")<=as.Date(alldat$Date, format="%d/%m/%Y") & as.Date("2007-02-02")>=as.Date(alldat$Date, format="%d/%m/%Y"),]
row.names(dt)<-1:nrow(dt)
rm(alldat)

#convert date/time
dt$Time=strptime(paste(dt$Date,dt$Time), format="%d/%m/%Y %H:%M:%S")
dt$Date=as.Date(dt$Date, format="%d/%m/%Y")
dt$Global_active_power=as.numeric(dt$Global_active_power)

#plot
par(mfrow=c(1,1))
hist(dt$Global_active_power, col=c("red"), main="Global Active Power", xlab="Global Active Power (kilowatts)")

#plot to file
png('plot1.png')
hist(dt$Global_active_power, col=c("red"), main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()