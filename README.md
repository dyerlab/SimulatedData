# Simulated Data

Data associated with simulations under various demographic models.  

## Disconnected Populations

The null case of no connectivity and only genetic drift working:  

  - 25 Populations
  - 20 Co dominant Loci
  - 100 individuals per population
  - 1000 Generations
  - random starting populations (`p <- rnorm(L, mean=0.5, sd = 0.1); q <- 1-p`).


### 1-Dimensional Stepping Stone Models

The simplest case builds on the previous with the following changes:  

  - Migration m = 0.05
  - asymmetry in connectivity

