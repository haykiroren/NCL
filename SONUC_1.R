a<-as.matrix(read.table("./SONUC_1.txt"))
b<-as.numeric(a[,2])
c<-mean(b)
i=1
for (val in b) {
if(val >c) {cat(a[i,1]," ", a[i,2],"Sucess \n")}
if(val <c) {cat(a[i,1]," ", a[i,2], "Unsucess \n")}
i=i+1
}
