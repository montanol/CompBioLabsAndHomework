#Assignment 9 - Independent project
#read in data
wolf_pair <- read.csv("data_pair_finalR.csv")

#look at data
str(wolf_pair)
class(wolf_pair)

#Finding correlations between duration of pair bond and cause of death
wolf_pair$Death_Causes

#create a new data frame that includes only the info I need
library("dplyr")
summarizedData <- summarise(group_by(wolf_pair, ID), 
                            finalEntry = max(Death_Causes), 
                            Duration = max(time), 
                            event = max(event))

#get rid of the entries that are marked as "censored"
censored <- which(summarizedData$event == 0 & summarizedData$finalEntry == 0)
all_complete_data <- summarizedData[-censored, ]

#trying with ggplot to create all five plots together
library("ggplot2")

#to rename facet labels
death_causes <- c('0' = "No Dissolution",
                  '1' = "Poaching",
                  '2' = "Culling",
                  '3' = "Natural",
                  '4' = "Traffic")

ggplot(all_complete_data, aes(x = Duration)) +
  geom_histogram(bins = 22) +
  facet_wrap(facets = ~finalEntry, scale = "free", 
             labeller = as_labeller(death_causes)) +
  scale_x_continuous(name = "# of Winters", breaks = seq(0, 12, 1)) +
  scale_y_continuous(name = "# of Wolf Pairs") 



#getting the average duration of each of the five categories on 1 graph
#no dissolution
no_dissolution <- which(summarizedData$event == 1 & summarizedData$finalEntry == 0)
no_dissolution_duration <- summarizedData$Duration[no_dissolution]
no_dissolution_mean <- mean(no_dissolution_duration)

#poaching (1)
poaching <- which(summarizedData$finalEntry == 1)
poaching_duration <- summarizedData$Duration[poaching]
poaching_mean <- mean(poaching_duration)

#culling (2)
culling <- which(summarizedData$finalEntry == 2)
culling_duration <- summarizedData$Duration[culling]
culling_mean <- mean(culling_duration)

#natural (3)
natural <- which(summarizedData$finalEntry == 3)
natural_duration <- summarizedData$Duration[natural]
natural_mean <- mean(natural_duration)

#traffic (4)
traffic <- which(summarizedData$finalEntry == 4)
traffic_duration <- summarizedData$Duration[traffic]
traffic_mean <- mean(traffic_duration)

#plot all five averages on one graph
averages <- c(no_dissolution_mean, poaching_mean, culling_mean, natural_mean, traffic_mean)
plot(averages, main = "Average duration of Pair Bond", xlab = "Lack of Dissolution or Cause of Dissolution",
     ylab = "Average # of Winters", col = c('1' = "red", '2' = "blue", '3' = "black", '4' = "green", '5' = "purple"),
     pch = 15, cex = 1.3, xaxt = "none") 
     
axis(1, at = c(1, 2, 3, 4, 5), labels = c("No Dissolution", "Poaching", "Culling",
                                 "Natural", "Traffic"), cex.axis = .7)
     
    

#Finding correlations between cause of death and the country tracked in
countryData <- summarise(group_by(wolf_pair, ID), 
                            finalEntry = max(Death_Causes), 
                            event = max(event),
                            country = max(Country))

#get rid of the "censored" entries
censored2 <- which(countryData$event == 0 & countryData$finalEntry == 0)
newCountryData <- countryData[-censored2, ]

#create 3 plots
#rename facet labels
country_names <- c('1' = "Norway",
                   '2' = "Crossborder",
                   '3' = "Sweden")

ggplot(newCountryData, aes(x = finalEntry)) +
  geom_bar() +
  facet_wrap(facets = ~country, 
             labeller = as_labeller(country_names)) +
  scale_x_continuous(name = "No Dissolution or Cause of Dissolution", 
                     breaks = c(0, 1, 2, 3, 4),
                     labels = c("No Dissolution", "Poaching", "Culling", "Natural", "Traffic")) +
  scale_y_continuous(name = "# of Wolf Pairs") +
  labs(title = "Pair Bond Dissolution or Lack of by Country") +
  theme(axis.text.x = element_text(angle = 50, size = 6.5))
        


