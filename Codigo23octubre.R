#Código 23 octubre.

library(cluster)
library(factoextra)

head(USArrests)

df<-USArrests

df<- na.omit(df)

df<- scale(df)

#uso k medias con distancia euclídea, por eso escalo.

#Ejecutamos kmedias

k2<-kmeans(df, centers=2, nstart = 25)

str(k2)

## divide between / total, que explica un 47.5 por ciento. 
#Saca los centroides... Nosotros vamos a buscar quedarnos con el mejor número de centros.

#Ahora, lo visualizamos: 

fviz_cluster(k2, data=df)


#Podemos ver qué hace fviz_cluser en la pagina [https://www.rdocumentation.org/packages/factoextra/versions/1.0.7/topics/fviz_cluster]




#Gráfico codo: 

set.seed(123)

fviz_nbclust(df, kmeans, method="wss")


#library()
nb<- NbClust(df, distance= "euclidean", min.nc=2, max.nc=10, method="kmeans")

