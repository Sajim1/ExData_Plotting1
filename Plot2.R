#plot 1

# reading files

dt_header <- read.table("household_power_consumption.txt",sep=";",skip=0,nrow=1,header=TRUE,na.strings = "?")

gh <- read.table("household_power_consumption.txt",sep=";",skip=66637,nrow=2880,header=FALSE,na.strings = "?")



dt <- read.table("household_power_consumption.txt",sep=";",skip=0,nrow=0,header=TRUE,na.strings = "?")

dt$Date <- as.Date(dt$Date,"%d/%m/%Y")

dt <- subset(dt, Date %in% as.Date(c("01/02/2007","02/02/2007"),"%d/%m/%Y"))

dt <- dt[complete.cases(dt),]

#dt$Global_active_power_kw <- dt$Global_active_power*.001
dt$time_date <- as.POSIXct(paste0(dt$Date,dt$Time))

par(mfrow=c(1,1))
plot(dt$time_date,dt$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")



dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
