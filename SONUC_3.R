a<-as.matrix(read.table("./SUCESS.txt"))
b<-a[,3]
i=1
for (val in b) {
if(val == "Sucess") {cat(a[i,1] ," ",a[i,2], "\n")}
if(val == "UNSUCESS") {cat("\n")} 
i=i+1
}
