data  <- read.delim("~/GitHub/Data-science-projects/Data_GaussianInference", header=FALSE)

head(data)

summary(data)


## use mvtnorm to find the density for values in our data set when comparing it to the multivairate Gaussian distribution
library(mvtnorm)

## normal distribution nr 1
means1 <- c(0,0)
covMatrix1 <- cbind(c(0.8745607, 0.4857800), c(0.4857800, 0.4666372))

Gauss1 <- data.frame(Gauss1 = dmvnorm(x=data, mean = means1, covMatrix1))

means2 <- c(0.5,0.5)
covMatrix2 <- cbind(c(0.865517, 1.006448), c(1.006448, 1.699515))

Gauss2 <- data.frame(Gauss2 = dmvnorm(x=data, mean = means2, covMatrix2))

labels <- data.frame(label = c(ifelse(Gauss1 > Gauss2, 1, 2)))

cbind(data, labels)




## Example of MLE on whole data set (no hidden classes) --> parameter estimation!
# https://www.r-bloggers.com/fitting-a-model-by-maximum-likelihood/

library(stats4)

?mle

set.seed(1001)
N <- 100

x <- rnorm(N, mean = 3, sd = 2)

mean(x)

sd(x)


#Then we formulate the log-likelihood function.
LL <- function(mu, sigma) {
  R = suppressWarnings(dnorm(x, mu, sigma))
  -sum(log(R))
  }

# And apply MLE to estimate the two parameters (mean and standard deviation) for which the normal distribution best describes the data.
mle(LL, start = list(mu = 1, sigma=1))

