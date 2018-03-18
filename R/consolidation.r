#!/usr/bin/env Rscript

raw <- read.csv("csv/RawData.csv",header=TRUE,sep=";",quote="\"",dec=",")

raw$difference1 <- raw$Prio1 - raw$SecPrio1
raw$difference2 <- raw$Prio2 - raw$SecPrio2
raw$difference3 <- raw$Prio3 - raw$SecPrio3
raw$difference4 <- raw$Prio4 - raw$SecPrio4

differences <- raw[, c("Exp", "difference1", "difference2", "difference3", "difference4")]

outdata <- aggregate(cbind(difference1, difference2, difference3, difference4)~Exp, data=differences, mean)

write.csv(outdata, file="Consolidation.csv",row.names=FALSE,quote=FALSE)
