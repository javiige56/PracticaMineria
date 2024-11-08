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

indices_train=sample(indices_entrenamiento, 0.8*n_entrenamiento)

indices_test=c(1:n)[-c(indices_validation, indices_train)]


#BASES DE DATOS. 

Boston_train=Boston[indices_train, ]
Boston_test=Boston[indices_test, ]
Boston_val=Boston[indices_validation, ]

##SOBRE EL SAMPLE: 

#Elígeme de manera aleatoria. cáda vez que lo corra, siempre sale algo distinto. 

##creamos semillas para que no estén cambiando mis bases de datos cada vez que lo corra. 


set.seed(5858)
sample(1:100,10)
#AQUÍ PONE OTRO. 
sample(1:100,10)
#Aquí, vuelve al mismo valor. luego hay que usar esto. 
set.seed(5858)
sample(1:100,10)
