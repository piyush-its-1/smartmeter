library(caret)
library(kernlab)
data<-read.csv("~/catFiles.csv")
set.seed(123)
dt = sort(sample(nrow(data), nrow(data)*.7))
train<-data[dt,]
test<-data[-dt,]

inTrain <-createDataPartition(y=Meter_no$type, p=0.75, list = FALSE)
training <- spam[inTrain,]
testing <-spam[-inTrain,]
set.seed(32343)
modelFit <-train(type~.,data=training, method="glm")   as.matrix(train)    sparse.model.matrix(train)
modelFit$finalModel
predictions <-predict(modelFit,newdata=testing)
predictions
confusionMatrix(predictions,testing$type)








Elec <- read.csv("household_power_consumption.csv", header = TRUE)



Attrib <- Elec[(Elec$Date=="16-12-2006") | (Elec$Date=="13-12-2008"),]
Attrib$Global_active_power <- as.numeric(as.character(Attrib$Global_active_power))
Attrib$Global_reactive_power <- as.numeric(as.character(Attrib$Global_reactive_power))
Attrib$Voltage <- as.numeric(as.character(Attrib$Voltage))



library(xlsx)
library(downloader)
# load historical electric usage data from ComEd website
ComEd<-read.csv("~/catFiles.csv")
# edit row and column names
dimnames(ComEd)[2][[1]]<-{c('Date',1:24)}
dimnames(ComEd)[1][[1]]<-substr(ComEd[,1],5,15)
ComEd[,1]<-as.Date(substr(ComEd[,1],5,15),'%m /%d/%Y')









