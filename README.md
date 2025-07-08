# Simulated Data

Data associated with simulations under various demographic models.



## Asymmetric Population Genetics

This project aims to develop methods for identifying asymmetry in population covariance in Population Graphs. The specifics of these data include:

### 1-Dimensional Stepping Stone Models

The simplest case has the following parameters:  

  - 25 Populations
  - 20 Codominant Loci
  - 100 individuals per population
  - 1000 Generations
  - m = 0.05
  - asymmetry in connectivity
  - random starting populations (`p <- rnorm(L, mean=0.5, sd = 0.1); q <- 1-p`).
