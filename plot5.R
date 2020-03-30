NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
combined<-merge(NEI,SCC, by.x = "SCC", by.y = "SCC")

data1999<-combined[combined$year==1999 & combined$fips==24510 & combined$Data.Category=='Onroad' ,c(1,2,3,4,6,8,9)]
data2002<-combined[combined$year==2002 & combined$fips==24510 & combined$Data.Category=='Onroad' ,c(1,2,3,4,6,8,9)]
data2005<-combined[combined$year==2005 & combined$fips==24510 & combined$Data.Category=='Onroad' ,c(1,2,3,4,6,8,9)]
data2008<-combined[combined$year==2008 & combined$fips==24510 & combined$Data.Category=='Onroad' ,c(1,2,3,4,6,8,9)]

Total1999<-sum(data1999$Emissions)
Total2002<-sum(data2002$Emissions)
Total2005<-sum(data2005$Emissions)
Total2008<-sum(data2008$Emissions)

years<-c(1999,2002,2005,2008)
totalEmissions<-c(total1999,total2002,total2005,total2008)
TotalEmissions<-c(Total1999,Total2002,Total2005,Total2008)
png('plot5.png',width = 580,height = 580,units = "px")
plot(years,TotalEmissions,type = 'l',col = 'green',ylab = "Total vehicular emissions in tons",xlab = "Years")
title(main="Total Emissions due to Vehicles across the years 1999-2008 in Baltimore City")
dev.off()