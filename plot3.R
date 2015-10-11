#Reading the DataSet"
Global<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")

#Adjustig Date variable in the Data set
Global$Date<-as.Date(Global$Date,format="%d/%m/%Y")
Global$timetemp<-paste(Global$Date,Global$Time)
Global$Time<-strptime(Global$timetemp,format="%Y-%m-%d %H:%M:%S")

#Subsetting the required analysis period
GlobalSub<-Global[Global$Date>="2007-02-01" & Global$Date<="2007-02-02",]

#Changing language to english
Sys.setlocale("LC_ALL","English")

#Creating png plot
png("plot3.png",width = 480, height = 480)
plot(GlobalSub$Time,GlobalSub$Sub_metering_1,pch=27,xlab="",ylab="Energy sub metering",type="n")
points(GlobalSub$Time,GlobalSub$Sub_metering_1,pch=27)
lines(GlobalSub$Time,GlobalSub$Sub_metering_1)
points(GlobalSub$Time,GlobalSub$Sub_metering_2,pch=27)
lines(GlobalSub$Time,GlobalSub$Sub_metering_2,col=2)
points(GlobalSub$Time,GlobalSub$Sub_metering_3,pch=27)
lines(GlobalSub$Time,GlobalSub$Sub_metering_3,col=4)
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c(1,2,4),x.intersp = 1,lwd=c(1,1,1))
dev.off()