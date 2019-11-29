# Venus Hernandez - T00051290 :) 
# Profe me merezco un 5.0 jeje está completo y muy bien explicado, le pongo los comentarios del código. ¡Gracias! 

# Se especifica la ruta o el directorio de trabajo
# En caso de errores, especificar manualmente la ruta del archivo venus.csv contenido en el archivo comprimido
setwd("/home/edgar/Escritorio/venus2")

# Se carga el archivo csv y se guarda en una lista llamada data
data <- read.csv("venus.csv")

# Se especifican los alias para cada elemento de la lista
names(data) <- c("individuo","estatura","retraso","seguidores","youtuber")

# Se usa paste para concatenar e imprimir de una forma optima nuestras funciones

# El método mean calcula la media
paste("Media de la estatura: ",mean(data$estatura))
paste("Media de las llegadas tardes: ",mean(data$retraso))
paste("Media de los seguidores: ",mean(data$seguidores))
paste("Media de los seguidores: ",mean(data$youtuber))

# El método sd calcula la desviación estandar
paste("Desviacion estandar de estatura:",sd(data$estatura))
paste("Desviacion estandar de llegadastarde:",sd(data$retraso))
paste("Desviacion estandar de seguidores:",sd(data$seguidores))
paste("Desviacion estandar de youtuber:",sd(data$youtuber))

# El método hist realiza un histograma que podrá verse en la pestaña de plots
hist(data$estatura,main="Histograma de estatura",xlab = "Indica los rangos de estaturas de las personas encuestadas",ylab = "Cantidad de personas")
hist(data$retraso,main="Histograma de retraso",xlab = "Indica las llegadas tarde a clase (3 o más minutos) por semana de las personas encuestadas",ylab = "Cantidad de personas")
hist(data$seguidores,main="Histograma de seguidores",xlab = "Indica la cantidad de seguidores de Instagram que tienen los encuestados",ylab = "Cantidad de personas")
hist(as.integer(as.logical(data$youtuber)),main="Histograma de youtuber - AuronPlay",xlab="La primera barra indica que no conoce al youtuber, la segunda que sí",ylab = "Cantidad de personas")


library(ggplot2)

ggplot(data,aes(x=data$estatura))+
  geom_density(fill="red")

ggplot(data,aes(x=data$seguidores))+
  geom_density(fill="pink")
ggplot(data,aes(x=data$retraso))+
  geom_density(fill="yellow")

data$youtuber_num<-rep(0,nrow(data))
data$youtuber_num[data$youtuber == "FALSE"]<-1
data$youtuber_num[data$youtuber == "TRUE"]<-2

ggplot(data,aes(x=youtuber_num))+
  geom_bar(stat="count",fill="purple")

data$estatura2<-rnorm(n=17,mean=mean(data$estatura),sd=sd(data$estatura))
data$seguidores2<- rpois(n=17,lambda=mean(data$seguidores))
data$retraso2<-rnorm(n=17,mean=mean(data$retraso),sd=sd(data$retraso))
data$youtuber2<-rbinom(n=17,size=1,prob=0.5)

estatura2<-rnorm(n=10000000,mean=mean(data$estatura),sd=sd(data$estatura))
seguidores2<-rpois(n=10000000,lambda=mean(data$seguidores))
retraso2<-rnorm(n=10000000,mean=mean(data$retraso),sd=sd(data$retraso))
youtuber2<-rbinom(n=10000000,size=1,prob=0.5)

data2<-data.frame(estatura2,seguidores2,retraso2,youtuber2)

ggplot(data2,aes(x=data2$estatura2))+
  geom_density(fill="red")

ggplot(data2,aes(x=data2$seguidores2))+
  geom_density(fill="pink")
ggplot(data2,aes(x=data2$retraso2))+
  geom_density(fill="yellow")
ggplot(data2,aes(x=data2$youtuber2))+
  geom_bar(stat="count",fill="purple")

proc.time()-ptm







