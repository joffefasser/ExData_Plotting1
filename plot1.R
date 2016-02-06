# Load dataset
mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), dec=".")

# Prepare and filter the dataset for graphical display
mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")
mydata <- subset(mydata, mydata$Date >=  as.Date("2007-02-01") & mydata$Date <= as.Date("2007-02-02"))

# Generate the requested plot on the screen device
hist(mydata$Global_active_power, col="red", breaks=12, main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Delete old output from previously runs
fn <- "plot1.png"
if (file.exists(fn)) file.remove(fn)

# Generate PNG file including the requested plot
png(fn, width = 480, height = 480)
hist(mydata$Global_active_power, col="red", breaks=12, main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

