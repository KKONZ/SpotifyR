setwd("~/Desktop")

ThryDays <- seq(from = 1, to = 30, by = 1)
ThryDaysStrng <- ifelse(ThryDays < 10, paste("0", ThryDays,sep=""), as.character(ThryDays)); rm(ThryDays)

Thry1Days <- seq(from = 1, to = 31, by = 1)
Thry1DaysStrng <- ifelse(Thry1Days < 10, paste("0", Thry1Days,sep=""), as.character(Thry1Days)); rm(Thry1Days)

TwntyN9neDays <- seq(from = 1, to = 29, by = 1)
TwntyN9neDaysStrng <- ifelse(TwntyN9neDays < 10, paste("0", TwntyN9neDays,sep=""), as.character(TwntyN9neDays)); rm(TwntyN9neDays)

Twnty8Days <- seq(from = 1, to = 28, by = 1)
Twnty8DaysStrng <- ifelse(Twnty8Days < 10, paste("0", Twnty8Days,sep=""), as.character(Twnty8Days)); rm(Twnty8Days)

Jan <- data.frame(Month <- "01", Thry1DaysStrng); JanFiles <- data.frame(paste(Jan[ ,1], "-",Jan[ ,2], sep ="")); colnames(JanFiles) <- "Date"; rm(Jan)
Feb15 <- data.frame(Month <- "02", Twnty8DaysStrng); Feb15Files <- data.frame(paste(Feb15[ ,1], "-",Feb15[ ,2], sep ="")); colnames(Feb15Files) <- "Date"; rm(Feb15)
Feb16 <- data.frame(Month <- "02", TwntyN9neDaysStrng); Feb16Files <- data.frame(paste(Feb16[ ,1], "-",Feb16[ ,2], sep ="")); colnames(Feb16Files) <- "Date"; rm(Feb16)
Mar <- data.frame(Month <- "03", Thry1DaysStrng); MarFiles <- data.frame(paste(Mar[ ,1], "-",Mar[ ,2], sep ="")); colnames(MarFiles) <- "Date"; rm(Mar)
Apr <- data.frame(Month <- "04",ThryDaysStrng); AprFiles <- data.frame(paste(Apr[ ,1], "-",Apr[ ,2], sep ="")); colnames(AprFiles) <- "Date"; rm(Apr)
May <- data.frame(Month <- "05", Thry1DaysStrng); MayFiles <- data.frame(paste(May[ ,1], "-",May[ ,2], sep ="")); colnames(MayFiles) <- "Date"; rm(May)
June <- data.frame(Month <- "06",ThryDaysStrng); JuneFiles <- data.frame(paste(June[ ,1], "-",June[ ,2], sep ="")); colnames(JuneFiles) <- "Date"; rm(June)
July <- data.frame(Month <- "07",Thry1DaysStrng); JulyFiles <- data.frame(paste(July[ ,1], "-",July[ ,2], sep ="")); colnames(JulyFiles) <- "Date"; rm(July)
Aug <- data.frame(Month <- "08",Thry1DaysStrng); AugFiles <- data.frame(paste(Aug[ ,1], "-",Aug[ ,2], sep ="")); colnames(AugFiles) <- "Date"; rm(Aug)
Sept <- data.frame(Month <- "09",ThryDaysStrng); SeptFiles <- data.frame(paste(Sept[ ,1], "-",Sept[ ,2], sep ="")); colnames(SeptFiles) <- "Date"; rm(Sept)
Oct <- data.frame(Month <- "10",Thry1DaysStrng); OctFiles <- data.frame(paste(Oct[ ,1], "-",Oct[ ,2], sep ="")); colnames(OctFiles) <- "Date"; rm(Oct)
Nov <- data.frame(Month <- "11",ThryDaysStrng); NovFiles <- data.frame(paste(Nov[ ,1], "-",Nov[ ,2], sep ="")); colnames(NovFiles) <- "Date"; rm(Nov)
Dec <- data.frame(Month <- "12",Thry1DaysStrng); DecFiles <- data.frame(paste(Dec[ ,1], "-",Dec[ ,2], sep ="")); colnames(DecFiles) <- "Date"; rm(Dec)

May2015 <- data.frame(MayFiles$FullDate15 <- paste("2015", MayFiles$Date, sep="-")); colnames(May2015) <- "Date"
Jun2015 <- data.frame(JuneFiles$FullDate15 <- paste("2015", JuneFiles$Date, sep="-")); colnames(Jun2015) <- "Date"
Jul2015 <- data.frame(JulyFiles$FullDate15 <- paste("2015", JulyFiles$Date, sep="-")); colnames(Jul2015) <- "Date" 
Aug2015 <- data.frame(AugFiles$FullDate15 <- paste("2015", AugFiles$Date, sep="-")); colnames(Aug2015) <- "Date"
Sept2015 <- data.frame(SeptFiles$FullDate15 <- paste("2015", SeptFiles$Date, sep="-")); colnames(Sept2015) <- "Date"
Oct2015 <- data.frame(OctFiles$FullDate15 <- paste("2015", OctFiles$Date, sep="-")); colnames(Oct2015) <- "Date" 
Nov2015 <- data.frame(NovFiles$FullDate15 <- paste("2015", NovFiles$Date, sep="-")); colnames(Nov2015) <- "Date" 
Dec2015 <- data.frame(DecFiles$FullDate15 <- paste("2015", DecFiles$Date, sep="-")); colnames(Dec2015) <- "Date" 
  
Jan2016 <- data.frame(JanFiles$FullDate16 <- paste("2016", JanFiles$Date, sep="-")); colnames(Jan2016) <- "Date"
Feb2016 <- data.frame(Feb16Files$Date16 <- paste("2016", Feb16Files$Date, sep="-")); colnames(Feb2016) <- "Date"
Mar2016 <- data.frame(MarFiles$Date16 <- paste("2016", MarFiles$Date, sep="-")); colnames(Mar2016) <- "Date"
Apr2016 <- data.frame(AprFiles$Date16 <- paste("2016", AprFiles$Date, sep="-")); colnames(Apr2016) <- "Date"
May2016 <- data.frame(MayFiles$Date16 <- paste("2016", MayFiles$Date, sep="-")); colnames(May2016) <- "Date"
Jun2016 <- data.frame(JuneFiles$Date16 <- paste("2016", JuneFiles$Date, sep="-")); colnames(Jun2016) <- "Date"
Jul2016 <- data.frame(JulyFiles$Date16 <- paste("2016", JulyFiles$Date, sep="-")); colnames(Jul2016) <- "Date" 
Aug2016 <- data.frame(AugFiles$Date16 <- paste("2016", AugFiles$Date, sep="-")); colnames(Aug2016) <- "Date"
Sept2016 <- data.frame(SeptFiles$Date16 <- paste("2016", SeptFiles$Date, sep="-")); colnames(Sept2016) <- "Date"

DateFile2015 <- rbind(May2015, Jun2015, Jul2015, Aug2015, Sept2015, Oct2015, Nov2015, Dec2015)

DateFile2016 <- rbind(Jan2016, Feb2016, Mar2016, Apr2016, May2016, Jun2016, Jul2016, Aug2016, Sept2016)

DateFile <- rbind(DateFile2015, DateFile2016); colnames(DateFile) <- "File"
DateFile$File <- paste(DateFile[1:519, ], ".csv", sep="")


DownloadDF15 <- data.frame(paste("https://spotifycharts.com/regional/global/daily/", DateFile2015[ ,1], "/download", sep = "")); colnames(DownloadDF15) <- "File"
DownloadDF16 <- data.frame(paste("https://spotifycharts.com/regional/global/daily/", DateFile2016[ ,1], "/download", sep = "")); colnames(DownloadDF16) <- "File"

DownloadDF <- rbind(DownloadDF15, DownloadDF16); rm(DownloadDF15); rm(DownloadDF16)
DownloadDF <- cbind(DownloadDF, DateFile)

setwd("~/Desktop/SpotifyData")
for (r in 1:nrow(DownloadDF)) {
  download.file(paste(DownloadDF[r,1], sep = ""), 
                destfile=DownloadDF[r,2])
}

