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
plot(dt$Time,dt$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#plot to file
png('plot2.png')
plot(dt$Time,dt$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()