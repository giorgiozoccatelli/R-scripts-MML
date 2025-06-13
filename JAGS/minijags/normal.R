# normal.R - by MG June 2024
#            using JAGS to find the posterior on X when:
#            X ~ Normal(0,1)
#            X|Y ~ Normal(Y,1)
#            Z|X,Y ~ Normal(X+Y,1)
#            having observed Y=0.5 and Z=-0.1

setwd("~/teach/MML/minijags")
library(rjags)
library(R2jags)
d <- read.jagsdata("normal-data.R")
inits <- read.jagsdata("normal-init.R")
m <- jags.model("normal.bug", d, inits, n.chains=1)
update(m, 1000)
sim <- coda.samples(m, c("X","Y"), n.iter=1000000)
plot(sim)
summary(sim)
