# Switch to standard time local settings
Sys.setlocale("LC_TIME","C")

# Load dataset
mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), dec=".")

# Prepare and filter the dataset for graphical display
mydata$DateTime <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")
mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")
mydata <- subset(mydata, mydata$Date >=  as.Date("2007-02-01") & mydata$Date <= as.Date("2007-02-02"))

# Generate the requested plot on the screen device
plot(mydata$DateTime, mydata$Global_active_power, xlab= "", ylab= "Global Active Power (kilowatts)", type="l", col="black")

# Delete old output from previously runs
fn <- "plot2.png"
if (file.exists(fn)) file.remove(fn)

# Generate PNG file including the requested plot
png(fn, width = 480, height = 480)
plot(mydata$DateTime, mydata$Global_active_power, xlab= "", ylab= "Global Active Power (kilowatts)", type="l", col="black")
dev.off()

