install.packages("tidyverse")

#Lab 11, 4-5-19
#import the data 
woodData <- read.csv("GlobalWoodDensityDatabase.csv", stringsAsFactors = F)
str(woodData)

#change long density column name to something shorter
colnames(woodData)[colnames(woodData) == "Wood.density..g.cm.3...oven.dry.mass.fresh.volume"] <- "Density g/cm^3"
str(woodData)

#4: removing rows with missing data 
#4a which row is missing data?
missingRow <- which(is.na(woodData$`Density g/cm^3`))

#4b: remove the row of data with missing data
NewWoodData <- woodData[-missingRow, ]
str(NewWoodData)

#5: create a new data frame with species listed once w/ family 
#and binoomial info for ea species and mean density for ea species
#gonna try with dplyr package
library("dplyr")
woodDataFrame <- summarise(group_by(NewWoodData, Binomial, Family), 
                           MeanDensity = mean(`Density g/cm^3`))

#6: figure out families with greatest and least densities
#6a: make a new data frame with avg density for ea family w/o species name
familyDataFrame <- summarise(group_by(NewWoodData, Family),
                             MeanDensity = mean(`Density g/cm^3`))

#6b: sort result of 6a by MeanDensity and store in a data frame 
newFamilyDataFrame <- arrange(familyDataFrame, desc(MeanDensity))

#6c:
# 8 families with highest average densities
highAvgDen <- head(newFamilyDataFrame, n = 8L)

# 8 families with the lowest average densities
lowAvgDen <- tail(newFamilyDataFrame, n = 8L)

#Part III: Plotting
library("ggplot2")

#must subset the data to get two plots with the 8 most and least dense families
#for most dense
#make vector of family names - high density 
name <- table(highAvgDen$Family)
famNames <- names(name)
keepRows <- (woodDataFrame$Family %in% famNames)
str(keepRows)

familyAndSpeciesData <- as.data.frame(woodDataFrame[keepRows, ])

#plot it 
ggplot(familyAndSpeciesData, aes(x = Family, y = MeanDensity)) +
         geom_boxplot() +
         facet_wrap(facets = ~Family, scale = "free")

#repeat but with lowest density family data 
lowDenNames <- table(lowAvgDen$Family)
lowFamNames <- names(lowDenNames)
keepRows2 <- (woodDataFrame$Family %in% lowFamNames)
str(keepRows2)
lowDenFamAndSpecies <- as.data.frame(woodDataFrame[keepRows2, ])

#plot it 
ggplot(lowDenFamAndSpecies, aes(x = Family, y = MeanDensity)) +
         geom_boxplot() +
         facet_wrap(facets = ~Family, scales = "free")

#creating the same plots as above but in a way that makes them 
#easier to compare
#high density plot
ggplot(familyAndSpeciesData, aes(x = Family, y = MeanDensity)) +
         geom_boxplot() +
         coord_flip()

#low density plot
ggplot(lowDenFamAndSpecies, aes(x = Family, y = MeanDensity)) +
  geom_boxplot() +
  coord_flip()
