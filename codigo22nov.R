set.seed(1)
runif(1)
library(dplyr)
library(rpart)
library(rpart.plot)

df = datos2015Target_train %>% select(target,distance, gender, stroke,reactiontimeP, edad,
                                      medianaParcialesF)
df$target = as.factor(df$target)
df$distance = as.factor(df$distance)
str(df)
df = as.data.frame(df)

arbol = rpart(target~.,data = df, method='class')
rpart.plot(arbol)

