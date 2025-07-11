# Simulated Data

Data associated with simulations under various demographic models.  The base setup is defined as:

  - 25 Populations
  - 20 Co dominant Loci
  - 100 individuals per population
  - 1000 Generations
  - random starting populations (`p <- rnorm(L, mean=0.5, sd = 0.1); q <- 1-p`).


## Disconnected Populations

The null case of no connectivity and only genetic drift working.  

  - N 100
  - N 50 ==dlab1==
  - N 20 


## 1-Dimensional Stepping Stone Models

The simplest case builds on the previous with the following changes:  

### Isotorpic

Movement of gametes in all directions 

  - A <-m-> B <-m-> C <-m-> D; m = 0.05
  - A <-m-> B <-m-> C <-m-> D; m = 0.01


### Anisotropic

Movement of gametes at differential rates

#### Unidirectional

Migration in only one direction

  - $A \to B$ @ m = 0.05
  - $A \to B$ @ m = 0.01 ==main==

#### Asymmetric

Migration in both directions but with bias in one direction

  - $A \to B$ @ m = 0.05 & $B \to A$ @ m = 0.01
  

