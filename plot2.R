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
png("plot2.png",width = 480, height = 480)
plot(GlobalSub$Time,GlobalSub$Global_active_power,pch=27,xlab="",ylab="Global Acive Power (kilowatts)")
lines(GlobalSub$Time,GlobalSub$Global_active_power)
dev.off()