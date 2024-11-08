library(MASS)
str(Boston)
plot(log(Boston$crim),log(Boston$medv),pch=19,cex=2,col=4)

#tamaño
n=dim(Boston)[1]
n
#creamos las particiones
set.seed(232929)
indices_validation=sample(1:n,n*.2)
indices_entrenamiento=c(1:n)[-indices_validation]
n_entrenamiento=length(indices_entrenamiento)
indices_train=sample(indices_entrenamiento,.8*n_entrenamiento)
indices_test=c(1:n)[-c(indices_validation,indices_train)]


Boston_train=Boston[indices_train,]
Boston_test=Boston[indices_test,]
Boston_val=Boston[indices_validation,]

