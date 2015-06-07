#Get original data
orig_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Select only data from Feb 1st and Feb 2nd of 2007
mod_data <- orig_data[ which(orig_data$Date=='1/2/2007' | orig_data$Date == '2/2/2007'), ]

#Create column with Date+Time as Date-Time class
mod_data$DateTime <- as.POSIXct(paste(mod_data$Date, mod_data$Time), format="%d/%m/%Y %H:%M:%S")

#Open PNG file to put plot in
png(filename="plot2.png", width = 480, height = 480, units = "px")

#Plot 2
plot(mod_data$DateTime, mod_data$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
