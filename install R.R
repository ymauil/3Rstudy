## install packages that will be used
#make some changes
pckgs <-c("lme4.0", "nlmeU", "plyr", "reshape", "RLRsim", "WWGbook","ellipse")
pckgs =c('knitr',"tinytex","rticles",'bookdown','rmarkdown', 'xfun')
pckgs =dir('library')  
install.packages(pckgs)
library(nlme)
conflicts(detail = TRUE) # Identifies names' conflicts
detach(package:nlme) # Detach package
library(lme4.0)
detach(package:lme4.0)
detach(package:Matrix) # Recommended
### 修改工作路径
dir('library')
getwd()
setwd('library')
setwd("../")

library(openxlsx)
?read.xlsx
xlsxFile <- system.file("extdata", "readTest.xlsx", package = "openxlsx")
df1 <- read.xlsx(xlsxFile = xlsxFile, sheet = 1, skipEmptyRows = FALSE)

## DATA I\O
##.Rdata
load('disease_ICD.Rdata')
head(testdata)
save(testdata,file='输出结果\\disease_ICD.Rdata')

##.csv 逗号隔开的数据格式
testdata=read.csv('disease_ICD.csv')
head(testdata)
write.csv(testdata,file='输出结果\\disease_ICD.csv')

###.txt
read.table('disease_ICD.txt')
testdata=head(testdata)
write.table(testdata,file='输出结果\\disease_ICD.txt')

####生成数列
x<-1:10

x=1:10
x=seq(1,10,by=2)
a=0
for(i in 1:5){
  a=a+1
  print(a)
}

rep('疾病名称',times=10)
#合并数据非常好用
cbind()
?cbind

m<- cbind(1, 1:7) # the '1' (= shorter vector) is recycled
m
m <- cbind(m, 8:14)[, c(1, 3, 2)] # insert a column
m
cbind(1:7, diag(3)) # vector is subset -> warning

cbind(0, rbind(1, 1:3))
cbind(I = 0, X = rbind(a = 1, b = 1:3))  # use some names
xx <- data.frame(I = rep(0,2))
cbind(xx, X = rbind(a = 1, b = 1:3))   # named differently

cbind(0, matrix(1, nrow = 0, ncol = 4)) #> Warning (making sense)
dim(cbind(0, matrix(1, nrow = 2, ncol = 0))) #-> 2 x 1

## deparse.level
dd <- 10
rbind(1:4, c = 2, "a++" = 10, dd, deparse.level = 0) # middle 2 rownames
rbind(1:4, c = 2, "a++" = 10, dd, deparse.level = 1) # 3 rownames (default)
rbind(1:4, c = 2, "a++" = 10, dd, deparse.level = 2) # 4 rownames



rbind()
merge()

###变量转换
c('1',2,3)
as.numeric(c('1',2,3))
##矩阵格式
as.matrix()
?as.matrix
is.matrix(as.matrix(1:10))
!is.matrix(warpbreaks)  # data.frame, NOT matrix!
warpbreaks[1:10,]
as.matrix(warpbreaks[1:10,])  # using as.matrix.data.frame(.) method

## Example of setting row and column names
mdat <- matrix(c(1,2,3, 11,12,13), nrow = 2, ncol = 3, byrow = TRUE,
               dimnames = list(c("row1", "row2"),
                               c("C.1", "C.2", "C.3")))
mdat

##
?match
?subset
?substr
?grep
?gsub
###查看R函数源代码
fivenum
mean
methods(mean)
mean.default

  
#其次看图选函数：<https://www.r-graph-gallery.com/index.html>
##试一个：<https://www.r-graph-gallery.com/247-network-chart-layouts.html>
### library
install.packages('igraph')
library(igraph)

# Create data
data <- matrix(sample(0:1, 400, replace=TRUE, prob=c(0.8,0.2)), nrow=20)
head(data)# 1表示行和列对应的点间连线
network <- graph_from_adjacency_matrix(data , mode='undirected', diag=F )

# When ploting, we can use different layouts:
par(mfrow=c(2,2), mar=c(1,1,1,1))
plot(network, layout=layout.sphere, main="sphere")
plot(network, layout=layout.circle, main="circle")
plot(network, layout=layout.random, main="random")
plot(network, layout=layout.fruchterman.reingold, main="fruchterman.reingold")

# See the complete list with
# help(layout)
  