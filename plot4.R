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
dt$Sub_metering_1=as.numeric(dt$Sub_metering_1)
dt$Sub_metering_2=as.numeric(dt$Sub_metering_2)
dt$Sub_metering_3=as.numeric(dt$Sub_metering_3)
dt$Voltage=as.numeric(dt$Voltage)
dt$Global_reactive_power=as.numeric(dt$Global_reactive_power)

#plot
par(mfrow=c(2,2))
plot(dt$Time,dt$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="",cex.lab=0.5, cex.axis=0.5)

plot(dt$Time,dt$Voltage, type="l", ylab="Voltage", xlab="datetime",cex.lab=0.5, cex.axis=0.5)

plot(dt$Time, dt$Sub_metering_1, type="l", col=c("black"), xlab="", ylab="Energy sub metering", cex.lab=0.5, cex.axis=0.5)
lines(dt$Time, dt$Sub_metering_2, type="l", col=c("red"))
lines(dt$Time, dt$Sub_metering_3, type="l", col=c("blue"))
legend("topright", legend = colnames(dt[,7:9]), col=c("black", "red", "blue"), lty=1, bty = "n", cex=0.5)

plot(dt$Time,dt$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime",cex.lab=0.5, cex.axis=0.5)



#plot to file
png('plot4.png')
par(mfrow=c(2,2))
plot(dt$Time,dt$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

plot(dt$Time,dt$Voltage, type="l", ylab="Voltage", xlab="datetime")

plot(dt$Time, dt$Sub_metering_1, type="l", col=c("black"), xlab="", ylab="Energy sub metering")
lines(dt$Time, dt$Sub_metering_2, type="l", col=c("red"))
lines(dt$Time, dt$Sub_metering_3, type="l", col=c("blue"))
legend("topright", legend = colnames(dt[,7:9]), col=c("black", "red", "blue"), lty=1, bty = "n")

plot(dt$Time,dt$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()