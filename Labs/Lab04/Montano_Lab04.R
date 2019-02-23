# Lab04
# Part I
# Step 1: write a for loop that prints the word "hi" ten times
for (i in 1:10) {
  print("hi")
}

#Step 2: Create a for loop for Tim's total amount of money for the next 8 weeks
# assign parameters
initial <- 10
change <- 5 - (2 * 1.34)
total <- rep(0,8)
for (i in 1:8) {
  total[i] <- initial + change
  initial <- total[i]
}


#Step 3: calculate population size for 7 years 
# assign parameters
initial_pop <- 2000
growth_rate <- .05
total_pop <- rep(0,7)
for (i in 1:7) {
  total_pop[i] <- initial_pop - (initial_pop * growth_rate)
  initial_pop <- total_pop[i]
}


#Step 4: predict the value of n[12] based on a logistic growth equation using a for loop
# when t = 1, 
k <- 10000
r <- 0.8
abundances <- rep(0,12)
abundances[1] <- 2500 #n[1]

for (i in 2:12) {
  abundances[i] <- abundances[i-1] + (r * abundances[i-1] * (k - abundances[i-1]) / k)
  
}

#the value of n[12]
abundances[12]


#Part II
#Step 5a: use rep command to make a vector of 18 zeros
rep(0, 18)

#Step 5b: create a for loop that will store 3 
#times the ith value of 'i' in the 'ith' spot of the vector above
vec <- rep(0, 18)
for (i in seq(1,18)) {
 vec[i] <- (3 * i) 
}

#Step 5c: make a new vector of zeros and make the first entry the value of 1
vec2 <- rep(0,18)
vec2[1] <- 1

#Step 5d: create a loop, starting at 2nd entry of vec2, position is = to 1+(2*previous entry)
for (i in 2:18) {
  vec2[i] <- 1 + (2 * vec2[i-1])
}

#Step 6: create a loop that makes vector of 1st 20 Fibonacci numbers
lengOfFibNum <- 20
fibnum <- numeric(lengOfFibNum)
fibnum[1] <- 0
fibnum[2] <- 1
for (i in 3:lengOfFibNum) { 
  fibnum[i] <- fibnum[i-1]+fibnum[i-2]
} 

#Step 7: Make a plot of the data from step 4
time <- seq(1,12)
#already stored the abundances in step 4
plot(time, abundances)
