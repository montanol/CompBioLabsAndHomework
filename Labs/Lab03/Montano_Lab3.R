#Lab Step #3: created variables for the # of chips bags and the # of guests
chipBags <- 5
guests <- 8


#Lab step #5: created variable for expected avg consumption of chips per person
avg_consump <- 0.4


#Lab step #7: find the expected amount of leftover chips
could_feed <- chipBags/avg_consump

#5 bags would feed 12.5 people if 0.4 bags is avg consumption
reman_ppl <- could_feed - (guests + 1)

#3.5 is the remainder people that could be feed so multiply that by avg consumption
leftover_bags <- reman_ppl*avg_consump


#Lab step#8 : make 5 vectors for the five different people and their rankings
self <- c(7, 6, 5, 1, 2, 3, 4)
Penny <- c(5, 7, 6, 3, 1, 2, 4)
Jenny <- c(4, 3, 2, 7, 6, 5, 1)
Lenny <- c(1, 7, 3, 4, 6, 5, 2)
Stewie <- c(6, 7, 5, 4, 3, 1, 2)

#Lab step #9
PennyIV <- Penny[4] #index Penny's ranking for episode IV
LennyIV <- Lenny[4] #index Lenny's ranking for episode IV

#Lab step #10: combine all 5 data sets into a single data object using cbind()
all_rankings <- cbind(self, Penny, Jenny, Lenny, Stewie)

#Lab step #11
str(PennyIV)
str(Penny)
str(all_rankings) 
#Str tells you what type of information is in each object and what's in it or the beginning of what's in it.
#The first two only contain numbers while the 3rd has numbers and characters

#Lab step #12: create a data frame of the 5 vectors
Df1 <- as.data.frame(all_rankings)
Df2 <- data.frame(self, Penny, Jenny, Lenny, Stewie)

dim(Df1)
dim(Df2) # same results for both
str(Df1)
str(Df2) # same results for both
typeof(Df1)
typeof(Df2) # same results for both

#Lab step #14 :create a vector of the episode names w/ roman numerals
episodes <- c("I", "II", "III", "IV", "V", "VI", "VII")

#Lab step #15: chnage row names
row.names(Df1) <- episodes
row.names(all_rankings) <- episodes


all_rankings[3,] #Lab step #16: access third row

Df1[,4] #Lab step #17: acces fourth column

Df1[5,1] #Lab step #18: access my own ranking of episode V

Df1[2,2] #Lab step #19: access Penny's ranking for episode II

Df1[4:6,] #Lab step #20: access everyone's ranking for episodes IV-VI

Df1[c(2,5,7),] #Lab step #21 access everyone's ranking for episodes II,V,VI

Df1[c(4,6), c(2,3,5)] #Lab step #22: access only specific rows and columns

#Lab step #23: switch Lenny's rankings for episodes II and V
newIIranking <- Df1[5,4]
Df1[5,4] <- Df1[2,4]
Df1[2,4] <- newIIranking

#Lab step #24:
(all_rankings["III", "Penny"])
(Df1["III", "Penny"])

#Lab step #25
swap <- (Df1["II", "Lenny"])
Df1["II", "Lenny"] <- Df1["V", "Lenny"]
Df1["V", "Lenny"] <- swap

#Lab step #26
last_swap <- Df1$Lenny[2]
Df1$Lenny[2] <- Df1$Lenny[5]
Df1$Lenny[5] <- last_swap
