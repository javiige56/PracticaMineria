## Es importante solo utilizar las variables continuas si uso distancia euclídea
# y escalar los datos
# Seleccionar aquellas variables que son realmente influyentes para el modelos

## KNN solo con variables continuas

df <- datos2015Target_train %>% select(target, reactiontimeF, edad, pointP, reactiontimeP, swimtimeP, mediaParcialesP, minimoParcialesP, maximoParcialesP, medianaParcialesP)

modelo1knn = knn3(scale(df[,-1]), as.factor(df$target), k=13, prob=TRUE)

# Obtener las predicciones de clase y la matriz de confusión
predicciones <- predict(modelo1knn, newdata = df[,-1], type = "class")
matrizconfusion1 <- confusionMatrix(predicciones, as.factor(df$target), positive = "1")
print(matrizconfusion1)

# Veamos con test
df_test <-  datos2015Target_test %>% select(target, reactiontimeF, edad, pointP, reactiontimeP, swimtimeP, mediaParcialesP, minimoParcialesP,
                                            maximoParcialesP, medianaParcialesP )

# Realizar predicciones en el conjunto de test
predicciones_test <- predict(modelo1knn, newdata = scale(df_test[,-1]), type = "class")
matrizconfusion2 <- confusionMatrix(predicciones_test, as.factor(df_test$target), positive = "1")
print(matrizconfusion2)


# Probamos solo con swimtime

df <- datos2015Target_train %>% select(target, swimtimeP)

modelo1knn = knn3(target ~.,data = df, k=3, prob=TRUE)



# Obtener las predicciones de clase y la matriz de confusión
new_datos = data.frame(df[,2])
colnames(new_datos) = 'swimtimeP'
predicciones <- predict(modelo1knn, newdata = new_datos, type = "class")
matrizconfusion1 <- confusionMatrix(predicciones, as.factor(df$target), positive = "1")
print(matrizconfusion1)

# Veamos con test
df_test <-  datos2015Target_test %>% select(target, swimtimeP )
new_datos_test = data.frame(df_test[,2])
colnames(new_datos_test) = 'swimtimeP'

# Realizar predicciones en el conjunto de test
predicciones_test <- predict(modelo1knn, newdata = new_datos_test, type = "class")
matrizconfusion2 <- confusionMatrix(predicciones_test, as.factor(df_test$target), positive = "1")
print(matrizconfusion2)



arbol1 <- rpart(target~., data = df_arbol, method = 'class')
rpart.plot(arbol1, extra = 1)

# Tratar correctamente la variable hora y agrupar los países


