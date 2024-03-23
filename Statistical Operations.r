# AIM: to perform statistical operations mean, median, quartile, 5 number summary, boxplot, variance, covariance and correlation of the input taken as a dataframe 

df <- data.frame(a = rnorm(100), b = rnorm(100), c = rnorm(100)) #initializing the dataframe of 3 columns a, b, c filled with 100 random numbers drawn from a normal distribution with mean = 0 and std deviation = 1 for each
mean_df <- apply(df, 2, mean)
median_df <- apply(df, 2, median)
quartiles_df <- apply(df, 2, quantile)
summary_df <- apply(df, 2, summary)
variance <- apply(df, 2, var)
covariance <- cov(df)
correlation <- cor(df)
boxplot(df)
cat("Mean:", mean_df, "\nMedian:", median_df, "\nQuartiles:", quartiles_df, "\n5 Number Summary:", summary_df, "\nVariance:", variance, "\nCovariance:", covariance, "\nCorrelation:", correlation)

'''
_____________________________________________________
output:
Mean: -0.05374036 0.1255365 0.004810144 
Median: -0.1396462 0.0808347 0.1473527 
Quartiles: -2.458171 -0.6363954 -0.1396462 0.6438193 2.445868 -2.825306 -0.551907 0.0808347 0.8003156 2.494671 -2.18015 -0.6647766 0.1473527 0.6475869 2.30201 
5 Number Summary: -2.458171 -0.6363954 -0.1396462 -0.05374036 0.6438193 2.445868 -2.825306 -0.551907 0.0808347 0.1255365 0.8003156 2.494671 -2.18015 -0.6647766 0.1473527 0.004810144 0.6475869 2.30201 
Variance: 0.8675959 1.008591 0.9798361 
Covariance: 0.8675959 0.0294924 0.09041317 0.0294924 1.008591 0.1182256 0.09041317 0.1182256 0.9798361 
Correlation: 1 0.03152781 0.09806098 0.03152781 1 0.1189261 0.09806098 0.1189261 1
                            [boxplot also]
'''
