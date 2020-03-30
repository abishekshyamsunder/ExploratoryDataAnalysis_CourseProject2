NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
combined<-merge(NEI,SCC, by.x = "SCC", by.y = "SCC")

data1999<-combined[combined$year==1999,c(1,2,3,4,6,8)]
data2002<-combined[combined$year==2002,c(1,2,3,4,6,8)]
data2005<-combined[combined$year==2005,c(1,2,3,4,6,8)]
data2008<-combined[combined$year==2008,c(1,2,3,4,6,8)]

common_sources1<-intersect(data1999$SCC,data2008$SCC)
common_sources2<-intersect(data2002$SCC,data2005$SCC)
common_sources<-intersect(common_sources1,common_sources2)

Ldata1999<-data1999[data1999$SCC %in% common_sources,]
Ldata2002<-data2002[data2002$SCC %in% common_sources,]
Ldata2005<-data2005[data2005$SCC %in% common_sources,]
Ldata2008<-data2008[data2008$SCC %in% common_sources,]

total1999<-sum(Ldata1999$Emissions)
total2002<-sum(Ldata2002$Emissions)
total2005<-sum(Ldata2005$Emissions)
total2008<-sum(Ldata2008$Emissions)

Total1999<-sum(data1999$Emissions)
Total2002<-sum(data2002$Emissions)
Total2005<-sum(data2005$Emissions)
Total2008<-sum(data2008$Emissions)

years<-c(1999,2002,2005,2008)
totalEmissions<-c(total1999,total2002,total2005,total2008)
TotalEmissions<-c(Total1999,Total2002,Total2005,Total2008)
png('plot1.png',width = 480,height = 480,units = "px")
plot(years,totalEmissions,type = 'l',col = 'green',ylim = c(2500000,7500000),ylab = "Total Emissions in tons",xlab = "Years")
points(years,TotalEmissions,type = 'l',col = 'red')
title(main="Total Emissions across the years 1999-2008")
legend("topright",legend = c("All Sources","Common Sources"), col = c("red","green"), lty = c(1,1), cex = 0.5)
dev.off()

