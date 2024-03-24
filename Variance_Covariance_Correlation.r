# AIM: to find variance, covariance and correlation between different types of attributes with a scatter plot in R

df <- data.frame(a = rnorm(100), b = rnorm(100), c = rnorm(100))
variance <- apply(df, 2, var)
covariance <- cov(df)
correlation <- cor(df)
pairs(df)  #to plot the scatterplot
cat("Variance: ", variance, "\nCovariance: ", covariance, "\nCorrelation:", correlation)

'''
_____________________________________________________
output:
Pearson moment coefficient for numeric attributes:
Variance:  0.9903822 1.039124 0.8704857 
Covariance:  0.9903822 -0.2156262 -0.01918399 -0.2156262 1.039124 -0.02671097 -0.01918399 -0.02671097 0.8704857 
Correlation: 1 -0.2125526 -0.02066126 -0.2125526 1 -0.02808505 -0.02066126 -0.02808505 1
                    [scatterplot also]
'''
