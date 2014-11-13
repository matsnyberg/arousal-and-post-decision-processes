#!/usr/bin/env Rscript

moods <- read.csv("csv/MoodTableT.csv",header=TRUE,sep=";",quote="\"",dec=",")

moodMeans <- aggregate(cbind(Adiff,Ediff,Pdiff,Cdiff,Qdiff,Bdiff,Udiff,Ddiff)~Exp, data=moods, mean)

moodMeans <- as.data.frame(t(moodMeans))
colnames(moodMeans) <- moodMeans[1, ]
moodMeans <- moodMeans[-1, ]
moodMeans$octant <- factor(row.names(moodMeans))

moodMeans$mapped <- c("Aroused","Excited","Pleased","Calm","Quiet","Bored","Unhappy","Distressed")

write.csv(moodMeans, file="MoodMeans.csv",row.names=FALSE,quote=FALSE)
