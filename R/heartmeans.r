#!/usr/bin/env Rscript

heart <- read.csv("csv/HeartRateT.csv",header=TRUE,sep=";",quote="\"",dec=",")

heartMeans <- aggregate(cbind(Heart1, Heart2, Heart3)~Exp, data=heart, mean)

heartMeans <- as.data.frame(t(heartMeans))
colnames(heartMeans) <- heartMeans[1, ]
heartMeans <- heartMeans[-1, ]
heartMeans$myfactor <- factor(row.names(heartMeans))

#str(heartMeans) # Check the column types
write.csv(heartMeans, file="HeartMeans.csv",row.names=FALSE,quote=FALSE)


