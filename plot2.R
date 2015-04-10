house_data<-read.csv("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
hdata<-house_data[house_data$Date %in% c("1/2/2007","2/2/2007"),]
rm(house_data)

library(lubridate)
Sys.setlocale("LC_ALL","C")
hdata$datetime<-dmy_hms(paste(hdata$Date,hdata$Time))
plot(hdata$Global_active_power~hdata$datetime,type="l",ylab="Global Active Power(kilowatts)",xlab="")

dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()