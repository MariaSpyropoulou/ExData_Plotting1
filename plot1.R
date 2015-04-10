house_data<-read.csv("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
hdata<-house_data[house_data$Date %in% c("1/2/2007","2/2/2007"),]
rm(house_data)
hdata$Time<-strptime(hdata$Time,"%H:%M:%S")
hdata$Date<-as.Date(hdata$Date,"%d/%m/%Y")

hist(hdata$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)",ylab="Frequency")

dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()