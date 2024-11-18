library(MASS)
str(Boston)
plot(log(Boston$crim), log(Boston$medv), pch=19, cex=2, col=4)
#cada punto es una zona de boston. 

#cómo hacemos el train test?

##Tamaño de la muestra

n=dim(Boston)[1]

#Creamos las particiones: 

set.seed(48585)
indices_validation= sample(1:n, n*0.2)

indices_entrenamiento= c(1:n)[-indices_validation]


#he dividido los datos, ahora, cojo los de entreno y divido otra vez. 

n_entrenamiento=length(indices_entrenamiento)
set.seed(39881)
indices_train=sample(indices_entrenamiento, 0.8*n_entrenamiento)

indices_test=c(1:n)[-c(indices_validation, indices_train)]


#BASES DE DATOS. 

Boston_train=Boston[indices_train, ]
Boston_test=Boston[indices_test, ]
Boston_val=Boston[indices_validation, ]





#CLASE 13 NOVIEMBRE

library(MASS)
library(caret)
Pima.tr
summary(Pima.tr)

table(Pima.tr$npreg)
barplot(Pima.tr$npreg)
barplot(table(Pima.tr$npreg))


hist(Pima.tr$glu,20)
hist(Pima.tr$bp, 20)
hist(Pima.tr$skin, 20)
hist(Pima.tr$bmi, 20)
plot(Pima.tr$bmi, Pima.tr$npreg)
plot(Pima.tr$bmi, Pima.tr$age)


table(Pima.tr$type)

68/(68+132)

#El 34% es diabético. 


# Si está muy desequilibrado, entonces, no tiene sentido aplicar los k-vecinos.
#Test
Pima.tr
#Train
Pima.te


prob1=knn3Train(Pima.tr[,-8], Pima.tr[,-8], as.factor(Pima.tr$type), k=5, prob=TRUE)

#tabla que me cruce las probabilidades con la verdad: 


table(prob1, Pima.tr$type)


#de aquí puedo sacar los errores. 
#ahora quiero tests. 
  
prob2=knn3Train(Pima.tr[,-8], Pima.te[,-8], as.factor(Pima.tr$type), k=5, prob=TRUE)
table(prob2,Pima.te$type)

precision5=66/(66+27)
rec5= 66/(66+43)
f1_5= 2*perc5*rec5/(perc5+rec5)





#NO me gusta, es muy bajo, voy a coger más vecinos: 

prob11=knn3Train(Pima.tr[,-8], Pima.te[,-8], as.factor(Pima.tr$type), k=11, prob=TRUE)
table(prob11, Pima.te$type)
#va peor. 
#Me fijo sólo en el más parecido, a veces funciona.
probUno=knn3Train(Pima.tr[,-8], Pima.te[,-8], as.factor(Pima.tr$type), k=3, prob=TRUE)
table(probUno, Pima.te$type)

#¿Cómo defines la distancia para encontrar a los vecinos?.

Pima.te[1,]
Pima.tr[1,]
#por defecto mide la distancia euclídea, no tiene nada de sentido. O escalas, o no tiene sentido.

#¿Escala la función knn3Train?. 

a=scale(Pima.tr[,-8])
#cojo en el k valores impares para evitar empatesssssssssssssssssssssssssssssssssssssssssssss


#Parece que lo mejor es no escalar, vamos a coger la glucosa, a ver:

probabilidad= knn3Train(Pima.tr[,c(2:3)], Pima.te[, c(2,3)], as.factor(Pima.tr$type), k=1, prob=TRUE)

#podemos hacer t.tests
t.test(glu~type, data=Pima.tr)
t.test(npreg~type, data=Pima.tr)
##y así con todas. Todas son relevantes parece, no nos dice mucho. Podemos hacer un pca y meter las componentes principales. 


#Matriz de distancias:

#Primer vecino más cercano a mano:


matriz_datos=rbind(Pima.tr[,-8], Pima.te[1,-8])

M=as.matrix(dist(matriz_datos, diag=TRUE, upper=TRUE))
M[1:5, 1:5]
#ya tengo la matriz de distancias, me gusta la de 201:
#distancia de esos al más pequeño
M[201,-201]
v=sort(M[201,-201], index.return=TRUE)

#tenemos que es el 93 el vecino más cercano. Vemos cuál es el valor predicho: 
predicho=Pima.tr[v$ix[1],8]


#Ahora lo hago para todos los datos de test.

predicho=c()
n=dim(Pima.te)[1]
for (i in 1:n){
  matriz_datos=rbind(Pima.tr[,-8], Pima.te[i,-8])
  M=as.matrix(dist(matriz_datos, diag=TRUE, upper=TRUE, method="minkowski"), p=-2)
  M[1:5, 1:5]
  #ya tengo la matriz de distancias, me gusta la de 201:
  #distancia de esos al más pequeño
  M[201,-201]
  v=sort(M[201,-201], index.return=TRUE)
  
  #tenemos que es el 93 el vecino más cercano. Vemos cuál es el valor predicho: 
  predicho[i]=Pima.tr[v$ix[1],8]
}

table(predicho, Pima.te$type)

#en datos de imágenes funciona muy bien el k-vecinos.