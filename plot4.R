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
png("plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))
        #Plot #1
        plot(GlobalSub$Time,GlobalSub$Global_active_power,pch=27,xlab="",ylab="Global Acive Power")
        lines(GlobalSub$Time,GlobalSub$Global_active_power)
        
        #Plot #2
        plot(GlobalSub$Time,GlobalSub$Voltage,pch=27,xlab="datetime",ylab="Voltage")
        lines(GlobalSub$Time,GlobalSub$Voltage)
        
        #Plot #3
        plot(GlobalSub$Time,GlobalSub$Sub_metering_1,pch=27,xlab="",ylab="Energy sub metering",type="n")
        points(GlobalSub$Time,GlobalSub$Sub_metering_1,pch=27)
        lines(GlobalSub$Time,GlobalSub$Sub_metering_1)
        points(GlobalSub$Time,GlobalSub$Sub_metering_2,pch=27)
        lines(GlobalSub$Time,GlobalSub$Sub_metering_2,col=2)
        points(GlobalSub$Time,GlobalSub$Sub_metering_3,pch=27)
        lines(GlobalSub$Time,GlobalSub$Sub_metering_3,col=4)
        legend("topright",legend = c("Sub_metering_1","Sub_metering_2",
                                     "Sub_metering_3"),lty=c(1,1,1),col=c(1,2,4),
               x.intersp =0,5,lwd=c(1,1,1),bty = "n",y.intersp = 1)

        #Plot #4
        plot(GlobalSub$Time,GlobalSub$Global_reactive_power,pch=27,xlab="datetime",ylab="Global_reacive_power")
        lines(GlobalSub$Time,GlobalSub$Global_reactive_power)
        
dev.off()