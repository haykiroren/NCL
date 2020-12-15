a<-as.matrix(read.table("./forncl4.txt"))
b<-as.numeric(a[1])
c<-as.numeric(a[2])
d<-as.numeric(a[3])
b1<-b/10
c1<-c/10
d1<-d/10
count <- b1-d1
for (i in 1:17) {
if(count <= c1)  count = count+d1
print(count)
}

