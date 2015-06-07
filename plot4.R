#Get original data
orig_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Select only data from Feb 1st and Feb 2nd of 2007
mod_data <- orig_data[ which(orig_data$Date=='1/2/2007' | orig_data$Date == '2/2/2007'), ]

#Create column with Date+Time as Date-Time class
mod_data$DateTime <- as.POSIXct(paste(mod_data$Date, mod_data$Time), format="%d/%m/%Y %H:%M:%S")

#Open PNG file to put plot in
png(filename="plot4.png", width = 480, height = 480, units = "px")

#Make 2 by 2 plot page
par(mfrow=c(2,2))

#Plot4
#A
plot(mod_data$DateTime, mod_data$Global_active_power, type="l", xlab = "", ylab = "Global Active Power")

#B
plot(mod_data$DateTime, mod_data$Voltage, type="l", xlab="datetime", ylab="Voltage")

#C
with(mod_data, plot(DateTime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(mod_data, points(DateTime, Sub_metering_1, col = "black", type="l"))
with(mod_data, points(DateTime, Sub_metering_2, col = "red", type="l"))
with(mod_data, points(DateTime, Sub_metering_3, col = "blue", type="l"))
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.9, bty="n")

#D
plot(mod_data$DateTime, mod_data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
