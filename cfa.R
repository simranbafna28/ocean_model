install.packages("lavaan")
library(lavaan)
library(haven)
data<-read.csv("//Users/simranbafna/Desktop/excel sheets/Exploratory data2.csv")
View(data)
###cfa model
Cf.model<-'A=~A1+A2+A3+A4+A5
C=~C1+C2+C3+C4+C5
E=~E1+E2+E3+E4+E5
N=~N1+N2+N3+N4+N5
O=~O1+O2+O3+O4+O5'
###Fitting the model
fit1<-cfa(Cf.model,data=data)
fit1
resid(fit1,type="standardized")
summary(fit1,fit1.measures=TRUE)
summary(fit1,standardized=TRUE)
###standardized loading
inspect(fit1, what="std")
###R square
inspect(fit1,'r2')
###fit indices
fitmeasures(fit1)
fitmeasures(fit1,c("gfi","agFi","nfi","cfi","rmsea","srmr","tli"))
###modification indices
modindices(fit1, sort. = TRUE)
###cfa diagram
install.packages("semPlot")
library(semPlot)
semPaths(fit1,"std")