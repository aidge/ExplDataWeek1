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

# Plot the graph, type = "l" specifies line plot: Plot 2
plot(data$Global_active_power ~ data$datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# Save the graph
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()