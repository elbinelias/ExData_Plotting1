par(mfcol=c(2,2))
gap <- as.numeric(as.character(pcdatas$Global_active_power))
plot(pcdatas$dt,gap,type="l",xlab="",ylab="Global Active Power (kilowatts)")
s1 <- pcdatas$Sub_metering_1
s2 <- pcdatas$Sub_metering_2
s3 <- pcdatas$Sub_metering_3
plot(pcdatas$dt,s1,type="l",ylab="Energy sub metering",xlab="")
lines(pcdatas$dt,s2,type="l",col="red")
lines(pcdatas$dt,s3,type="l",col="blue")
legend("topright",c("sub_metering_1","sub_metering_2","sub_metering_3"),lty=c(1,1),col=c("black","red","blue"))
vol <- as.numeric(as.character(pcdatas$Voltage))
plot(pcdatas$dt,vol,type="l",ylab="Voltage",xlab="datetime")
rp <- as.numeric(as.character(pcdatas$Global_reactive_power))
plot(pcdatas$dt,rp,type="l",ylab="Global_reactive_power",xlab="datetime")
dev.copy(png,'plot4.png')
dev.off()