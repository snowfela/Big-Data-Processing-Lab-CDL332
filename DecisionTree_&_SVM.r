#AIM: to implemnent decision tree & SVM classifiers in R.

library(rpart)   
library(rpart.plot)  
library(e1071)
data(iris)
cat("Head of the dataset:")
head(iris)
set.seed(123) 
trainIndex <- createDataPartition(iris$Species, p = 0.7, list = FALSE, times = 1)
trainData <- iris[trainIndex, ]
testData <- iris[-trainIndex, ]
new_data <- data.frame(Sepal.Length = 5.1, Sepal.Width = 3.5, Petal.Length = 1.4, Petal.Width = 0.2) #of class setosa

# decision tree classifier
tree_model <- rpart(Species ~ ., data = trainData, method = "class")
rpart.plot(tree_model, box.palette = "GnBu",shadow.col = "gray",nn = TRUE,branch.lty = 2,branch.lwd = 2,uniform = TRUE,fallen.leaves = TRUE,extra = 100)
predictions <- predict(tree_model, newdata = testData, type = "class")
accuracy <- mean(predictions == testData$Species)
mse <- mean(predictions != testData$Species)
cat("Accuracy (D-Tree):", round(accuracy, 2),"\nMean Squared Error (MSE) (D-Tree):", round(mse, 2))
predict_species <- function(model, new_data) {
  predict(model, newdata = new_data, type = "class")
}
predicted_species <- predict_species(tree_model, new_data)
cat("Predicted species (D-Tree):", predicted_species)

# SVM classifier
svm_model <- svm(Species ~ ., data = trainData, kernel = "radial")
predictions <- predict(svm_model, newdata = testData)
accuracy <- mean(predictions == testData$Species)
mse <- mean(predictions != testData$Species)
cat("Accuracy (SVM):", round(accuracy, 2),"\nMean Squared Error (MSE) (SVM):", round(mse, 2))
predict_species <- function(model, new_data) {
  predict(model, newdata = new_data)
}
predicted_species <- predict_species(svm_model, new_data)
cat("Predicted species (SVM):", predicted_species)

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
Accuracy (D-Tree): 0.93 
Mean Squared Error (MSE) (D-Tree): 0.07
Predicted species (D-Tree): 1
Accuracy (SVM): 0.93 
Mean Squared Error (MSE) (SVM): 0.07
Predicted species (SVM): 1
                  [+ decision tree also]
'''
