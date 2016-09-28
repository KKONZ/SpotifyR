setwd("C:/Users/karlk/Desktop/EconometricsData")

month <- seq(from = 5, to = 9, by = 1)
DateDF <- data.frame(paste("0", month, sep="")); colnames(DateDF) <- "Month"

ThryDays <- seq(from = 1, to = 30, by = 1)
ThryDaysStrng <- ifelse(ThryDays < 10, paste("0", ThryDays,sep=""), as.character(ThryDays))

Thry1Days <- seq(from = 1, to = 31, by = 1)
Thry1DaysStrng <- ifelse(Thry1Days < 10, paste("0", Thry1Days,sep=""), as.character(Thry1Days))

May <- data.frame(Month <- "05", Thry1DaysStrng); MayFiles <- data.frame(paste(May[ ,1], "-",May[ ,2], sep ="")); colnames(MayFiles) <- "Date"
June <- data.frame(Month <- "06",ThryDaysStrng); JuneFiles <- data.frame(paste(June[ ,1], "-",June[ ,2], sep ="")); colnames(JuneFiles) <- "Date"
July <- data.frame(Month <- "07",Thry1DaysStrng); JulyFiles <- data.frame(paste(July[ ,1], "-",July[ ,2], sep ="")); colnames(JulyFiles) <- "Date"
Aug <- data.frame(Month <- "08",Thry1DaysStrng); AugFiles <- data.frame(paste(Aug[ ,1], "-",Aug[ ,2], sep ="")); colnames(AugFiles) <- "Date"
Sept <- data.frame(Month <- "09",ThryDaysStrng); SeptFiles <- data.frame(paste(Sept[ ,1], "-",Sept[ ,2], sep ="")); colnames(SeptFiles) <- "Date"

DateFile <- rbind(MayFiles, JuneFiles, JulyFiles, AugFiles, SeptFiles)
DownloadDF <- data.frame(paste("https://spotifycharts.com/regional/global/daily/2016-", DateFile[ ,1], "/download", sep = ""))


MayF <- data.frame(Month <- "May", Thry1DaysStrng); MayDest <- data.frame(paste(MayF[ ,1], "",MayF[ ,2], sep ="")); colnames(MayDest) <- "Date"
JuneF <- data.frame(Month <- "June",ThryDaysStrng); JuneDest <- data.frame(paste(JuneF[ ,1], "",JuneF[ ,2], sep ="")); colnames(JuneDest) <- "Date"
JulyF <- data.frame(Month <- "July",Thry1DaysStrng); JulyDest <- data.frame(paste(JulyF[ ,1], "",JulyF[ ,2], sep ="")); colnames(JulyDest) <- "Date"
AugF <- data.frame(Month <- "Aug",Thry1DaysStrng); AugDest <- data.frame(paste(AugF[ ,1], "",AugF[ ,2], sep ="")); colnames(AugDest) <- "Date"
SeptF <- data.frame(Month <- "Sept",ThryDaysStrng); SeptDest <- data.frame(paste(SeptF[ ,1], "",SeptF[ ,2], sep ="")); colnames(SeptDest) <- "Date"

DestFile <- rbind(MayDest, JuneDest, JulyDest, AugDest, SeptDest)

DownloadDF$DestFile <- paste(DestFile[1:153, ], "csv", sep = '.')

colnames(DownloadDF)[1] <- "Download"

for (r in 1:nrow(DownloadDF)) {
  download.file(paste(DownloadDF[r,1], sep = ""), 
                destfile=DownloadDF[r,2])
}
