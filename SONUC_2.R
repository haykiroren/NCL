a<-as.matrix(read.table("./SONUC_1.txt"))
b<-as.numeric(a[,2])
c<-mean(b)
d<-sd(b)
e<-c+d
i=1
for (val in b) {
if(val >e) {cat(a[i,1]," ", a[i,2],"Sucess \n")}
if(val <e) {cat(a[i,1]," ", a[i,2], "Unsucess \n")}
i=i+1
}
