##download file and unzip contents. The same content is used in all 4 plots, so not downloaded again!
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="powerconsumption.zip")
unzip("powerconsumption.zip")

##Read data 
pcdata <- read.table(file="household_power_consumption.txt",sep=";",header=TRUE)

##plot1
##subsetting the required data
pcdata$Date <- dmy(pcdata$Date)
pcdatas <- subset(pcdata,Date > as.Date("2007-01-31") & Date < as.Date("2007-02-03"))
gap <- as.numeric(as.character(pcdatas$Global_active_power))
hist(gap,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.copy(png,'plot1.png')
dev.off()