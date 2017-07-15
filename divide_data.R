data<-read.csv("~/catFiles.csv")
set.seed(123)
dt = sort(sample(nrow(data), nrow(data)*.7))
train<-data[dt,]
test<-data[-dt,]
library(caret)
library(lattice) 
library(ggplot2)
set.seed(12463)

training <- read.csv("catFiles.csv", stringsAsFactors=FALSE)
training$classe <- as.factor(training$classe)
training <- training[,-nearZeroVar(training)]
training <- training[,-c(1,2,3,4,5,6,7)]
inTrain <- createDataPartition(y=training$classe, p=0.75, list=FALSE)
training <- training[inTrain,]
testing <- training[-inTrain,]

preObj <- preProcess(training[,length(training)],method=c("center", "scale", "knnImpute", "pca"), thresh=0.9)
clean_data <- predict(preObj,training[,length(training)])
modelFit <- train(training$classe ~.,data=clean_data, method="knn")
test <- predict(preObj, testing[,length(testing)])
confusionMatrix(testing$classe, predict(modelFit,test))
