#Lab 12, 4/12/19
library("ggplot2")

#read in data 
cusackData <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv")
str(cusackData)
#Problem 1: create a bar plot of the data 
ggplot(cusackData, aes(x = Species)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 90))

#Problem 2: add code to above to rotate axis tick labels
#^^^

#Problem 3: with the barplot above, flip the axes, sort from least to 
#most abundant and change count axis to be logarithmic
require(forcats)
ggplot(cusackData, aes(fct_infreq(Species))) + #sort data
  geom_bar() +
  coord_flip() + #flip axes
  scale_x_continuous(trans = 'log10') #log?
