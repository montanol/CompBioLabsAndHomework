#2/15/19 Lab 5
#Part I: Practice some conditionals
#Step 1: create a variable with any value 
#then write an if else statment that checks if value is larger than 5
x <- 10
if(x > 5){
  print("result is larger")
} else {
  print("result is smaller")
}

#Step 2: obtain file vector1.csv
vectorfile <- read.csv("Vector1.csv")

#Step 2a: write a loop that checks each value and replaces negative values w/ NA
vectordata <- nrow(vectorfile)
for (i in 1:vectordata) {
  if(vectorfile$x[i] < 0)
  vectorfile$x[i] <- NA
}

#step 2b: use vectorized code to replace all NA values with NaN
replacementvector <- (is.na(vectorfile$x))
vectorfile$x[replacementvector] <- NaN

#Step 2c: using which replace all NaN values with zero
replacement2 <- which(is.nan(vectorfile$x))
vectorfile$x[replacement2] <- 0

#Step 2d: determine how many values fall inbetween 50 and 100, 50 < & < 100
range <- vectorfile$x >= 50 & vectorfile$x <= 100
rangevector <- length(vectorfile$x[range]) # the number of vaules

#Step 2e: create a new vector with all the values between 50 and 100
FiftyToOneHundred <- vectorfile$x[range]

#Step 2f: save vector into csv
write.csv(x = FiftyToOneHundred, file = "FiftyToOneHundred.csv")

#Step 3: import CO2 csv
co2 <- read.csv("CO2_data_cut_paste.csv")

#Step 3a: first year gas has non zero value
gas <- which(co2$Gas > 0)
firstgas <- co2$Year[gas[1]] 

#Step 3b: years when total emissions were between 200 and 300
totalemissions <- which(co2$Total >= 200 & co2$Total <= 300)
emissions_years <- co2$Year[totalemissions] 

#Part II:Loops, conditionals and biology
# 1st set up parameters
totalGenerations <- 1000
initPrey <- 100    #Initial prey abundance at time t = 1
initPred <- 10     #Initial predator abundance at time t = 1
a <- 0.01          #attack rate
r <- 0.2           #growth rate of prey
m <- 0.05          #mortality rate of predators
k <- 0.1           #conversion constant of prey into predators

#2nd: Create a time vector
timevec <- rep(1, totalGenerations)

#vector to store values of n (prey) over time
prey.over.time <- rep(1, totalGenerations)
prey.over.time[1] <- initPrey

#vector to store values of p (predators) over time
pred.over.time <- rep(1, totalGenerations)
pred.over.time[1] <- initPred

#3rd: write a loop that for the caluclations of the Lotka-Volterra equations
for (i in 2:totalGenerations) {
  prey.over.time[i] <- prey.over.time[i-1] + (r * prey.over.time[i-1]) - (a * prey.over.time[i-1] * pred.over.time[i-1])
  pred.over.time[i] <- pred.over.time[i-1] + (k * a * prey.over.time[i-1] * pred.over.time[i-1]) - (m * pred.over.time[i-1])
  if(pred.over.time[i] < 0)
    pred.over.time[i] <- 0
  if(prey.over.time[i] < 0)
    prey.over.time[i] <- 0
}

#5th: make a plot of the abundances of prey and predators over time
time <- seq(1, totalGenerations)
plot(time, prey.over.time, type = "l", col = "red")
lines(time, pred.over.time)      

#6th: create a matrix of the prey-predator results w/ appropriate column names
myResults <- matrix(cbind(time, prey.over.time, pred.over.time), nrow = 1000, ncol = 3)
colnames(myResults) <- c("TimeStep", "PreyAbundance", "PredatorAbundance")

#write matrix into a csv
write.csv(x = myResults, file = "PredPreyResults.csv")

