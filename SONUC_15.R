a<-as.matrix(read.table("aaray.txt"))
b<-a[order(a[,2]),]
c<-rev(b[,2])
d<-rev(b[,1])
write.table(c,file="veri3c.txt")
write.table(d,file="veri3d.txt")

