a<-as.matrix(read.table("./SUCESS2.txt"))
b<-a[,3]
i=1
for (val in b) {
if(val == "Unsucess") {cat(a[i,1], "\n")}
i=i+1
}
