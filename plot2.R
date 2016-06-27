##plot2
##Read data 
par(mfcol=c(1,1))
pcdata <- read.table(file="household_power_consumption.txt",sep=";",header=TRUE)
date <- pcdata$Date
time <- pcdata$Time
dttime <- paste(date,time)
dt <- strptime(dttime,format="%d/%m/%Y %H:%M:%S",tz="")
#dt <- strptime(dttime,format="%Y-%m-%d %H:%M:%S",tz="")

#Add column for date and time stamp
pcdata$dt <- dt
pcdatas <- subset(pcdata,as.Date(pcdata$dt) > as.Date("2007-01-31") & as.Date(pcdata$dt)< as.Date("2007-02-03"))
gap <- as.numeric(as.character(pcdatas$Global_active_power))
plot(pcdatas$dt,gap,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,'plot2.png')
dev.off()