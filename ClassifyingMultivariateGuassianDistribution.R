Haotian_Dataset1 <- read.delim("~/R/Haotian_Dataset1", header=FALSE)

head(Haotian_Dataset1)

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

