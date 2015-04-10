house_data<-read.csv("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
hdata<-house_data[house_data$Date %in% c("1/2/2007","2/2/2007"),]
rm(house_data)

library(lubridate)
hdata$datetime<-dmy_hms(paste(hdata$Date,hdata$Time))
plot(hdata$Sub_metering_1~hdata$datetime,type="l",ylab="Energy sub metering",xlab="")
lines(hdata$Sub_metering_2~hdata$datetime,col="red")
lines(hdata$Sub_metering_3~hdata$datetime,col="blue")
legend("topright",col=c("black","red","blue"),lty=1,lwd=2,cex=.75,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png,file="plot3.png",height=480,width=480)
dev.off()