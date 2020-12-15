a<-as.matrix(read.table("./MAX"))
b<-as.numeric(a[,1])
max<-max(b)
c<-as.matrix(read.table("./MIN"))
d<-as.numeric(c[,1])
min<-min(d)
fark<-as.double((max-min)/16)
mind = formatC(min, digits=1,format = "f")
maxd = formatC(max, digits=1,format = "f")
farkd = formatC(fark, digits=1,format = "f")
mind
maxd
farkd

