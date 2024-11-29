set.seed(1)
runif(1)
library(dplyr)
library(rpart)
library(rpart.plot)
library(ipred)
library(randomForest)
library(caret)

df = datos2015Target_train %>% select(target,distance, gender, stroke,reactiontimeP, edad,
                                      medianaParcialesF)
df$target = as.factor(df$target)
df$distance = as.factor(df$distance)
str(df)
df = as.data.frame(df)

arbol = rpart(target~.,data = df, method='class')
rpart.plot(arbol)

## Dia 29 noviembre

#Bagging
bag<-bagging(target~., data= df, coob=TRUE, nbagg=50, 
             rpart= rpart.control(minsplit = 4, minbucket =2, mmaxdepth =1, cp=0))

print(bag)

# Predicciones en el árbol y bagging
pred_arbol<- predict(arbol, df, type="prob")[,2]
pred_bag <- predict(bag, df, type="prob")[,2]

clase.pred.bag<- ifelse(pred_bag<0.5, "0", "1")
cf_bag_train<- confusionMatrix(as.factor(clase.pred.bag), as.factor(df$target), positive="1")

clase.pred.arbol<-ifelse(pred_arbol<0.5, "0", "1")
cf_arbol_train<-  confusionMatrix(as.factor(clase.pred.arbol), as.factor(df$target), positive="1")

# Random Forest

rf<- randomForest(as.factor(target)~., data=df, importance=TRUE, proximity=TRUE,
                  ntree=150, mtry=6, rpart=rpart.control(minsplit=4, minbucket=2, maxdepth=4, cp=0))

print(rf)
plot(rf)
legent("right", colnames(rf$err.rate), lty=1:5, col=1:6)

rf$proximity
# Importancia de las variables 
importance(rf)
varImpPlot(rf)

# Predicciones

pred_rf <- predict(rf, df, type="prob")[,2]

clase.pred.bag<- ifelse(pred_rf<0.5, "0", "1")
cf_bag_train<- confusionMatrix(as.factor(clase.pred.bag), as.factor(df$target), positive="1")
