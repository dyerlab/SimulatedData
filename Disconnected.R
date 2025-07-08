#' This code creates a default set of populations and show the impact of gentic drift.
#' 25 Populations
#' 20 Co dominant Loci
#' 100 individuals per population
#' 1000 Generations
#' 2-allele loci
#' Random starting frequencies (p <- rnorm(L, mean=0.5, sd = 0.1); q <- 1-p).
#' Genotypes Every 100 saved as text.
#' 

library( tidyverse )
library( gstudio )


K <- 25
L <- 20 
N <- 100 
Tmax <- 1000
folder_base <- "Disconnected/m0/"
reps <- 2:9


cat("Simulating: ", folder, "\n")


for( rep in reps ) { 
  
  folder <- paste( folder_base, "rep", rep, "/", 
                   sep="" )
  
  # make the replicate folder
  system(paste("mkdir -p",folder))
  
  # make the random data
  data <- data.frame()
  for( i in 1:K) { 
    p <- rnorm(L, mean=0.5, sd = 0.1)
    q <- 1-p
    locusNames <- paste( "loc", 
                         stringr::str_pad( 1:L, 
                                           side="left", 
                                           pad="0", 
                                           width=2) ,
                         sep="")
    
    data.frame( Locus = c( locusNames, locusNames ), 
                Allele = c( rep( "A", L ), 
                            rep( "B", L) ),
                Frequency = c( p, q) ) |>
      arrange( Locus, Allele ) -> freqs
    
    make_population( freqs, N )  |> 
      select( -ID ) |> 
      mutate( Population = i ) |>
      select( Population, everything() ) -> pop
    data <- rbind( data, pop )
  }
  
  
  cat("\n", rep, "\n")
  
  # Iterate Through Generations
  for( gen in 0:Tmax ) { 
      
    ## Save Population every T %% 5
    if( gen %% 5 == 0 ) { 
      
      if( gen %% 50 == 0 ) { 
        cat(" ", gen)
      }
      
      paste(folder,"/data",sep = "") -> newName
      paste(newName,str_pad(gen,4,pad="0"),"rda",sep=".") -> fname 
      write_csv( data, file = fname )
    }
    
    ## Mate to make new population
    newData <- data.frame() 
    for( i in 1:K ) { 
      
      data |>
        filter( Population == i ) -> pop 
      
      newPop <- data.frame() 
      
      ## Fill up the rest with resident
      while( nrow(newPop) < N ) { 
        idx <- sample( 1:N, size=2, replace=FALSE)
        newPop <- rbind( newPop, 
                         mate( pop[idx[1],], pop[idx[2],] ) ) 
      }
      newData <- rbind( newData, 
                        newPop )
    }
    data <- newData
    
    
  } # gen
  
  
} #rep 
