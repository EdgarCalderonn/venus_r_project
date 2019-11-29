ptm<-proc.time()
setwd("/home/edgar/Escritorio/venus")
datos <- read.table("camila.csv",header=FALSE,col.names =c("estatura","seguidores","vecesTarde","roccibella"),sep=";",quote="",colClasses=c("estatura"="numeric","seguidores"="numeric","vecesTarde"="numeric","roccibella"="factor"))
mean(datos$estatura)
mean(datos$seguidores)
mean(datos$vecesTarde)
sd(datos$estatura)
sd(datos$seguidores)
sd(datos$vecesTarde)
hist(datos$estatura)
hist(datos$seguidores)
hist(datos$vecesTarde)

paste(datos$roccibella_num)

library(ggplot2)

ggplot(datos,aes(x=datos$estatura))+
  geom_density(fill="red")

ggplot(datos,aes(x=datos$seguidores))+
  geom_density(fill="pink")
ggplot(datos,aes(x=datos$vecesTarde))+
  geom_density(fill="yellow")

datos$roccibella_num<-rep(0,nrow(dat))
datos$roccibella_num[datos$roccibella=="no"]<-1
datos$roccibella_num[datos$roccibella=="si"]<-2

ggplot(datos,aes(x=roccibella_num))+
  geom_bar(stat="count",fill="purple")

datos$estatura2<-rnorm(n=18,mean=167.1667,sd=9.357287)
datos$seguidores2<- rpois(n=18,lambda=574.6111)
datos$vecesTarde2<-rnorm(n=18,mean=1.722222,sd=1.074055)
datos$roccibella2<-rbinom(n=18,size=1,prob=0.5)

estatura2<-rnorm(n=10000000,mean=167.1667,sd=9.357287)
seguidores2<-rpois(n=10000000,lambda=574.6111)
vecesTarde2<-rnorm(n=10000000,mean=1.722222,sd=1.074055)
roccibella2<-rbinom(n=10000000,size=1,prob=0.5)

datos2<-data.frame(estatura2,seguidores2,vecesTarde2,roccibella2)

ggplot(datos2,aes(x=datos2$estatura2))+
  geom_density(fill="red")

ggplot(datos2,aes(x=datos2$seguidores2))+
  geom_density(fill="pink")
ggplot(datos2,aes(x=datos2$vecesTarde2))+
  geom_density(fill="yellow")
ggplot(datos2,aes(x=datos2$roccibella2))+
  geom_bar(stat="count",fill="purple")

proc.time()-ptm
