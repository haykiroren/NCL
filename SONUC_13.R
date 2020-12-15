min1<-as.matrix(read.table("./min.txt"))
max1<-as.matrix(read.table("./max.txt"))
coef1<-as.matrix(read.table("./coef.txt"))
abs_min<-min(min1)
abs_max<-min(max1)
bolum<-abs_max - abs_min
norm_coef<-1-((coef1-abs_min)/bolum)
write.table(norm_coef,"norm_coef.txt",row.names=FALSE,col.names=FALSE)
