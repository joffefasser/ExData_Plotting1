# Switch to standard time local settings
Sys.setlocale("LC_TIME","C")

# Load dataset
mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), dec=".")

# Prepare and filter the dataset for graphical display
mydata$DateTime <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")
mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")
mydata <- subset(mydata, mydata$Date >=  as.Date("2007-02-01") & mydata$Date <= as.Date("2007-02-02"))

# Generate the requested plots on the screen device
par(mfcol=c(2,2))

# Plot 1
plot(mydata$DateTime, mydata$Global_active_power, xlab= "", ylab= "Global Active Power (kilowatts)", type="l", col="black")

# Plot 2
plot(mydata$DateTime, mydata$Sub_metering_1, xlab= "", ylab= "Energy sub metering", type="l", col="black")
lines(mydata$DateTime, mydata$Sub_metering_2, type="l", col="red")
lines(mydata$DateTime, mydata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1) , col = c("black", "red", "blue"))

# Plot 3
plot(mydata$DateTime, mydata$Voltage, xlab= "datetime", ylab= "Voltage", type="l", col="black")

# Plot 4
plot(mydata$DateTime, mydata$Global_reactive_power, xlab= "datetime", ylab= "Global_reactive_power", type="l", col="black")


# Delete old output from previously runs
fn <- "plot4.png"
if (file.exists(fn)) file.remove(fn)

# Generate PNG file including the requested plot
png(fn, width = 480, height = 480)
par(mfcol=c(2,2))
plot(mydata$DateTime, mydata$Global_active_power, xlab= "", ylab= "Global Active Power (kilowatts)", type="l", col="black")
plot(mydata$DateTime, mydata$Sub_metering_1, xlab= "", ylab= "Energy sub metering", type="l", col="black")
lines(mydata$DateTime, mydata$Sub_metering_2, type="l", col="red")
lines(mydata$DateTime, mydata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1) , col = c("black", "red", "blue"))
plot(mydata$DateTime, mydata$Voltage, xlab= "datetime", ylab= "Voltage", type="l", col="black")
plot(mydata$DateTime, mydata$Global_reactive_power, xlab= "datetime", ylab= "Global_reactive_power", type="l", col="black")
dev.off()

