# Read in the original file, seperator = ";' and replace NA's with "?"
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Covert Date from Factor to Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset the data on the given dates
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Create a new column to convert character vectors Date & Time to class POSIXlt
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

# Convert from POSIXlt to POSIXct
data$datetime <- as.POSIXct(data$datetime)

# Create multi-paneled plot
par(mfrow = c(2, 2))

# Plot the graphs, repeated from previous plots: Plot 4, 
plot(data$Global_active_power ~ data$datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
plot(data$Voltage ~ data$datetime, type = "l", ylab = "Voltage", xlab = "")
plot(data$Sub_metering_1 ~ data$datetime, type = "l", ylab = "Energy sub metering", xlab = "", col = "Black")
lines(data$Sub_metering_2 ~ data$datetime, type = "l", ylab = "Energy sub metering", xlab = "", col = "Red")
lines(data$Sub_metering_3 ~ data$datetime, type = "l", ylab = "Energy sub metering", xlab = "", col = "Blue")
plot(data$Global_reactive_power ~ data$datetime, type = "l", ylab = "Global_reactive_power", xlab = "")

# Save the graph
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
