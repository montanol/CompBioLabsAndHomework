#March 1: Lab 7

#Problem 1: write a function that calculates and returns the area of a triangle when given
#the base and height
triangleArea <- function(b, h){
  areaequation <- 0.5 * b * h
  return(areaequation)
}

#demonstrate the triangleArea function works with a triangle w/ b=10 & h=9
triangleArea(10, 9)


#Problem 2: write function that calculates and returns absolute values 
# as if it were the abs() function

abs(2)
abs(-2) #testing abs() function

myAbs <- function(x, threshold = 0){
  for (i in 1:length(x)) {
    if (x[i] < threshold){
      x[i] <- (x[i] * -1)
    } else {
      x[i] <- (x[i])
    }
  } 
  return(x) 
}

#demonstration of myAbs function
myAbs(5)
myAbs(-2.3)
vec <- c(1.1, 2, 0, -4.3, 9, -12)
myAbs(vec)


#Problem 3: write function that returns vector of first n Fibonacci #s
#where n is any integer >= 3
FibNumVec <- function(n, sn){
  numVec <- rep(0, n)
  numVec[1] <- sn
  numVec[2] <- 1
  for (i in 3:n) {
    numVec[i] <- numVec[i-1] + numVec[i-2]
  }
  return(numVec)
}

#demonstrate FibNumVec function works
FibNumVec(20, 0)
FibNumVec(20, 1)


#Problem 4: write function that returns square of the difference between 2 numbers
sqDiff <- function(x, y){
  sqDiffresult <- (x - y) ^ 2
  return(sqDiffresult)
}

#demonstrate sqDiff function
sqDiff(3, 5)

#demonstrate sqDiff function w/ a vector in the 1st argument and a single # in the 2nd
sqDiff(c(2, 4, 6), 4)

#Part 4b: write function that calculates the mean of a vector of number
averageVec <- function(v){
  vecAvg <- sum(v) / length(v)
  return(vecAvg)
}

#demonstrate the averageVec function 
averageVec(c(5, 15, 10))

#demonstrate averageVec function with csv file
lab7data <- read.csv("Documents/Spring2019/CompBio/compBioHWandLabs/Labs/Lab7/DataForLab07.csv")
averageVec(lab7data$x)


#Part 4c: create a sum of squares function using the previous written functions
sumOfSquares <- function(x){
  stepOne <- averageVec(x)
  for (i in 1:length(x)) {
    x[i] <- sqDiff(x[i], stepOne)
  }
  stepThree <- sum(x)
  return(stepThree)
}

#demonstrate sumOfSquares function with csv file
sumOfSquares(lab7data$x)


