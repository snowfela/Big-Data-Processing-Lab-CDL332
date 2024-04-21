#AIM: to implemnent simple & multinomial logistic regression in R.

library(ggplot2)   
library(dplyr)    
library(caret) 
library(nnet)     
data(iris)
cat("Head of the dataset:")
head(iris)
set.seed(123) 
trainIndex <- createDataPartition(iris$Species, p = 0.7, list = FALSE, times = 1)
trainData <- iris[trainIndex, ]
testData <- iris[-trainIndex, ]
new_data <- data.frame(Sepal.Length = 5.1, Sepal.Width = 3.5, Petal.Length = 1.4, Petal.Width = 0.2) #of class setosa

# simple logistic regression
simple_log_model <- glm(Species ~ ., data = trainData, family = "binomial")
predictions <- predict(simple_log_model, newdata = testData, type = "response")
predicted_classes <- ifelse(predictions > 0.5, "virginica", "non-virginica")
mse <- mean((as.numeric(testData$Species == "virginica") - as.numeric(predicted_classes == "virginica"))^2)
cat("Mean Squared Error (MSE):", round(mse, 2))
predict_species <- function(model, new_data) {
  prediction <- predict(model, newdata = new_data, type = "response")
  ifelse(prediction > 0.5, "virginica", "non-virginica")
}
predicted_species <- predict_species(simple_log_model, new_data)
cat("Predicted species (Simple Logistic Regression):", predicted_species)

# multiple logistic regression
multi_log_model <- multinom(Species ~ ., data = trainData)
predictions <- predict(multi_log_model, newdata = testData, type = "class")
mse <- mean(predictions != testData$Species)
cat("Mean Squared Error (MSE):", round(mse, 2))
predict_species <- function(model, new_data) {
  predict(model, newdata = new_data, type = "class")
}
predicted_species <- predict_species(multi_log_model, new_data)
cat("Predicted species (Multinomial Logistic Regression):", predicted_species)

'''
_____________________________________________________
output:
Head of the dataset:
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa

#simple logistic regression
Mean Squared Error (MSE): 0.33
Predicted species(Simple Logistic Regression): non-virginica

#multiple logistic regression
Mean Squared Error (MSE): 0.04
Predicted species (Multinomial Logistic Regression): setosa
'''
