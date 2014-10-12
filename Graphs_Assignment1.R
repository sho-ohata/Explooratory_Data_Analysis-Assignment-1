col <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
	"Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
	"Sub_metering_3")
power <- read.table("household_power_consumption.txt", sep=";", nrows=2880, 
	skip=66637, col.names=col)

#Plot 1
par(mfrow=c(1,1))
hist(power$Global_active_power, xlab="Global Active Power (kilowatts)", 
	ylab="Frequency", main="Global Active Power", col="orangered")
dev.copy(png, file = "Plot_1.png")
dev.off()

#Plot 2
par(mfrow=c(1,1))
time <- ""
time <- paste(weekdays(as.Date(power$Date, "%d/%m/%Y")), 
	as.Date(power$Date, "%d/%m/%Y"), power$Time)
time <- strptime(time, "%A %Y-%m-%d %H:%M:%S")
plot(time, power$Global_active_power, type="l", ylab="Global Active
	Power (kilowatts)", lwd=0.01)
dev.copy(png, file ="Plot_2.png")
dev.off()

#Plot 3
par(mfrow=c(1,1))
plot(time, power$Sub_metering_1, type="l", col = c("brown", "orangered", "blue"),
	ylab="Energy Sub Metering", xlab="")
lines(time, power$Sub_metering_2, col="orangered")
lines(time, power$Sub_metering_3, col="blue")
legend("topright", lty = 1, col = c("brown", "orangered", "blue"), 
	legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file ="Plot_3.png")
dev.off()

#Plot 4

par(mfrow=c(2,2))
plot(time, power$Global_active_power, type="l", ylab="Global Active
	Power (kilowatts)", lwd=0.01)
plot(time, power$Voltage, type="l", ylab="Voltage", xlab="datetime")
plot(time, power$Sub_metering_1, type="l", col = c("brown", "orangered", "blue"),
	ylab="Energy Sub Metering", xlab="")
lines(time, power$Sub_metering_2, col="orangered")
lines(time, power$Sub_metering_3, col="blue")
legend("topright", lty = 1, col = c("brown", "orangered", "blue"), 
	legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(time, power$Global_reactive_power, type="l", ylab="Global_reactive_power",
	xlab="datetime")
dev.copy(png, file ="Plot_4.png")
dev.off()
