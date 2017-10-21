# Read in the original file, seperator = ";' and replace NA's with "?"
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Covert Date from Factor to Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset the data on the given dates
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Create a new column to convert character vectors Date & Time to class POSIXlt
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

# Plot the graph: Plot 1
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "Red")

# Save the graph
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()