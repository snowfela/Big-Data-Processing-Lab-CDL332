# AIM: to implement K-Means clustering algorithm in R

k_means <- function(data, k, max_iters=100) {
  centroids <- data[sample(nrow(data), k), ]
  for (i in 1:max_iters) {
    assignments <- apply(data, 1, function(point) {
      distances <- sqrt(rowSums((t(t(centroids) - point))^2))
      return(which.min(distances))
    })
    new_centroids <- sapply(1:k, function(j) colMeans(data[assignments == j, ]))
    cat("Iteration:", i, "Class labels:", assignments, "\n")
    if (all(new_centroids == centroids)) {
      break
    }
    centroids <- new_centroids
  }
  cat("Final Centroids:\n")
  print(centroids)
  cat("Final Clusters:\n")
  for (j in 1:k) {
    cat("Cluster", j, ":\n")
    print(data[assignments == j, ])
  }
  return(list(centroids = centroids, assignments = assignments))
}
data <- read.csv('data.csv')
k <- 2
result <- k_means(data, k)

'''
_____________________________________________________
input: [data.csv]
x,y
5.1,3.5
4.9,3
4.7,3.2
4.6,3.1
5,3.6
5.4,3.9
4.6,3.4
5,3.4
4.4,2.9
4.9,3.1
_____________________________________________________
output:
Iteration: 1 Class labels: 1 2 1 1 1 1 1 1 2 1 
Iteration: 2 Class labels: 1 2 2 2 1 1 2 1 2 2 
Iteration: 3 Class labels: 1 2 2 2 1 1 2 1 2 2 
Final Centroids:
   [,1]     [,2]
x 5.125 4.683333
y 3.600 3.116667
Final Clusters:
Cluster 1 :
    x   y
1 5.1 3.5
5 5.0 3.6
6 5.4 3.9
8 5.0 3.4
Cluster 2 :
     x   y
2  4.9 3.0
3  4.7 3.2
4  4.6 3.1
7  4.6 3.4
9  4.4 2.9
10 4.9 3.1
'''
