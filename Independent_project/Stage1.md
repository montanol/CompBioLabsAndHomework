
## Mate for life
Assignment 8: Independent Project Stage 1

### Introduction
Wolves are my favorite animals and they are fascinating creatures. I went into this project expecting to use data relating to the controversy around the reintroduction of wolves such as the benefits and drawbacks of it, but then I came across this set of data about pair bond dissolution in wolves. I've always wondered if wolves truly bond with a single other wolf or at least tend to and this data set delves into that. It would be interesting to see this study replicated in other parts of the world where social attitudes are different and human related mortality factors  vary from the ones in this study. I've always found pack behavior to be really interesting, but the dynamic of a pair bond relationship isn't something you hear about very often in the animal kingdom. My driving questions for this project are if there are any correlations between the cause of dissolution or lack of dissolution and the duration of the pair bond and/or the country the wolves were being tracked in. 

[Source of original data](https://datadryad.org/handle/10255/dryad.124021)
#### Goals of the original study:
The original study sought to investigate the main causes of wolf pair bond dissolutions. Through this main goal, the researchers were also able to calculate the median time of pair bond duration.  All observed dissolutions with identified causes were due to the death or one or both wolves. They then broke down the percentage of deaths due to human caused factors compared to natural causes such as disease and age. They were not able to determine cause for all the deaths accounted but they provide their hypothesis on those deaths and give other possible factors that they observed that could increase the risk of pair bond dissolution (Milleret, 2016).
#### Methodology used:
The researchers tracked 153 wolf pairs in a reintroduced population in Scandinavia. These wolf pairs were tracked for 14 winters using snow tracking and DNA monitoring (Milleret, 2016).
#### Type of data:
- Format: data frame
- Size: 64195 Mb,  369 lines, 18 columns 
- Any inconsistencies/problems?: It doesn't look like it
- What the data represents about the biology?: It provides insight into these type of intimate relationships between carnivores and how important they are if most become dissolved because of death. 


### Analysis to be done/ Challenges
I want to answer two questions. First, are there any correlations between the cause of dissolution or lack of dissolution and the duration of the pair bond. To do this, I will subset the data by the 4 death causes plus a no dissolution category. In each of these five categories I will make a graph of duration vs frequency of x related deaths and then find the average time of pair bond duration for each of the five and display that on a single graph. 

My second question is if there is a correlation between the cause of dissolution or lack of dissolution and the country the wolves were being tracked in. To do this, I again will subset by the same five categories as before but this time they will be in graphs comparing the frequency of x related deaths and the three spatial locations observed in the study: Norway, Sweden, and the crossborder between them. 


#### Citations
Original publication: 
Milleret C, Wabakken P, Liberg O, Åkesson M, Flagstad Ø, Andreassen HP, Sand H (2016) Let's stay together? Intrinsic and extrinsic factors involved in pair bond dissolution in a recolonizing wolf population. Journal of Animal Ecology 86(1): 43-54. [https://doi.org/10.1111/1365-2656.12587](https://doi.org/10.1111/1365-2656.12587)

Data archive: 
Milleret C, Wabakken P, Liberg O, Åkesson M, Flagstad Ø, Andreassen HP, Sand H (2016) Data from: Let’s stay together? Intrinsic and extrinsic factors involved in pair bond dissolution in a recolonizing wolf population. Dryad Digital Repository. [https://doi.org/10.5061/dryad.242t8](https://doi.org/10.5061/dryad.242t8)

