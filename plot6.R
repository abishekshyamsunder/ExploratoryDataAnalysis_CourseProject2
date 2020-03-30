NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
combined<-merge(NEI,SCC, by.x = "SCC", by.y = "SCC")

data1999BC<-combined[combined$year==1999 & combined$fips=="24510" & combined$Data.Category=='Onroad' ,c(1,2,3,4,6,8,9)]
data2002BC<-combined[combined$year==2002 & combined$fips==24510 & combined$Data.Category=='Onroad' ,c(1,2,3,4,6,8,9)]
data2005BC<-combined[combined$year==2005 & combined$fips==24510 & combined$Data.Category=='Onroad' ,c(1,2,3,4,6,8,9)]
data2008BC<-combined[combined$year==2008 & combined$fips==24510 & combined$Data.Category=='Onroad' ,c(1,2,3,4,6,8,9)]

Total1999BC<-sum(data1999BC$Emissions)
Total2002BC<-sum(data2002BC$Emissions)
Total2005BC<-sum(data2005BC$Emissions)
Total2008BC<-sum(data2008BC$Emissions)

years<-c(1999,2002,2005,2008)

data1999AC<-combined[combined$year==1999 & combined$fips=="06037" & combined$Data.Category=='Onroad' ,c(1,2,3,4,6,8,9)]
data2002AC<-combined[combined$year==2002 & combined$fips=="06037" & combined$Data.Category=='Onroad' ,c(1,2,3,4,6,8,9)]
data2005AC<-combined[combined$year==2005 & combined$fips=="06037" & combined$Data.Category=='Onroad' ,c(1,2,3,4,6,8,9)]
data2008AC<-combined[combined$year==2008 & combined$fips=="06037" & combined$Data.Category=='Onroad' ,c(1,2,3,4,6,8,9)]

Total1999AC<-sum(data1999AC$Emissions)
Total2002AC<-sum(data2002AC$Emissions)
Total2005AC<-sum(data2005AC$Emissions)
Total2008AC<-sum(data2008AC$Emissions)


TotalEmissionsAC<-c(Total1999AC,Total2002AC,Total2005AC,Total2008AC)
changeAC<-c(abs(Total1999AC-Total2002AC),abs(Total2002AC-Total2005AC),abs(Total2005AC-Total2008AC))
changeTotAC<-abs(Total2008AC-Total1999AC)
TotalEmissionsBC<-c(Total1999BC,Total2002BC,Total2005BC,Total2008BC)
changeBC<-c(abs(Total1999BC-Total2002BC),abs(Total2002BC-Total2005BC),abs(Total2005BC-Total2008BC))
changeTotBC<-abs(Total2008BC-Total1999BC)
png('plot6.png',width = 800,height = 600,units = "px")
par(mfrow = c(1,2))
plot(years,TotalEmissionsAC,type = 'l',col = 'green',ylim = c(0,5500),ylab = "Total vehicular emissionsin tons",xlab = "Years")
points(years,TotalEmissionsBC,type = 'l',col='red')
legend("topright",legend = c("Los Angeles","Baltimore"), col = c("green","red"), lty = c(1,1), cex = 0.5)
title(main="Vehicular Emission across the years 1999-2008")

plot(c(1,1),c(0,changeTotAC),type = 'l',col = 'green',ylab = "Total Change in emissions",xlab = "City", xaxt='n',xlim = c(0.5,2.5), ylim = c(0,300))
points(c(2,2),c(0,changeTotBC),type = 'l',col='red')
title(main="Total change in Baltimore and Los Angeles")
legend("topright",legend = c("Los Angeles","Baltimore"), col = c("green","red"), lty = c(1,1), cex = 0.5)
dev.off()
