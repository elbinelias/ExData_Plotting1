##plot3
par(mfcol=c(1,1))
##Read data 
pcdata <- read.table(file="household_power_consumption.txt",sep=";",header=TRUE)
date <- pcdata$Date
time <- pcdata$Time
dttime <- paste(date,time)
dt <- strptime(dttime,format="%d/%m/%Y %H:%M:%S",tz="")

#add column for date and timestamp
pcdata$dt <- dt
pcdatas <- subset(pcdata,as.Date(pcdata$dt) > as.Date("2007-01-31") & as.Date(pcdata$dt)< as.Date("2007-02-03"))
s1 <- pcdatas$Sub_metering_1
s2 <- pcdatas$Sub_metering_2
s3 <- pcdatas$Sub_metering_3
plot(pcdatas$dt,s1,type="l",ylab="Energy sub metering",xlab="")
lines(pcdatas$dt,s2,type="l",col="red")
lines(pcdatas$dt,s3,type="l",col="blue")
legend("topright",c("sub_metering_1","sub_metering_2","sub_metering_3"),lty=c(1,1),col=c("black","red","blue"))
dev.copy(png,'plot3.png')
dev.off()