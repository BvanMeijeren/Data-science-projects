# dnorm, pnorm and qnorm

# Source: http://seankross.com/notes/dpqr/

z_scores <- seq(-3,3,by = 0.1)

dvalues <- dnorm(z_scores) # dnorm gives you the probability of a single Z score occurring

dvalues

plot(dvalues, # Plot where y = values and x = index of the value in the vector
     xaxt = "n", # Don't label the x-axis
     type = "l", # Make it a line plot
     main = "pdf of the Standard Normal",
     xlab= "Z-score") 


# pnorm gives you the integral of a Z-score --> the area under the curve up to the Z-score 
pnorm(0.5)

# qnorm --> reverse of pnorm!
quantiles <- seq(0,1, by = 0.05)

qvalues <- qnorm(quantiles)

qvalues # qnorm gives you Z-scores for a quantile, pnorm gives you probabilities for Z-scores

