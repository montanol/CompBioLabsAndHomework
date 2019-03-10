# Lab 08
#Part 3a: use code from part 4 and 7 from lab 4
#Step 4 from Lab 4: predict the value of n[12] based on a logistic growth equation using a for loop
# when t = 1, 
k <- 10000
r <- 0.8
abundances <- rep(0,12)
abundances[1] <- 2500 #n[1]

for (i in 2:12) {
  abundances[i] <- abundances[i-1] + (r * abundances[i-1] * (k - abundances[i-1]) / k)
  
}

#Step 7 from lab 4: Make a plot of the data from step 4
time <- seq(1,12)
#already stored the abundances in step 4
plot(time, abundances)

#Part 3b: turn the logistic growth model into a function
logGrowthModel <- function(r, k, initalN, totGens){
  abundances <- rep(0,totGens)
  abundances[1] <- initalN
  for (i in 2:totGens) {
    abundances[i] <- abundances[i-1] + (r * abundances[i-1] * (k - abundances[i-1]) / k)
  }
  generations <- (1:totGens)         # add code that returns a plot of the data
  plot(generations, abundances)
  abundMatrix <- cbind(generations, abundances)
  return(abundMatrix)
}

#test logGrowthModel function
logGrowthModel(0.8, 10000, 2500, 12) #test with values that I know what the outcome is

#Part 3d: test functino with other parameters
logGrowthModel(0.5, 9000, 3000, 10)

#write code that writes the data set to a file with 2 columns: generations and abundace
results <- logGrowthModel(0.5, 9000, 3000, 10)
write.csv(x = results, file = "LogisticGrowthModelData", row.names = FALSE)
