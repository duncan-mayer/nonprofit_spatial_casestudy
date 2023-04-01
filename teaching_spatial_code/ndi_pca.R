library('psych')
library('dplyr')

df <- read.csv("teaching_spatial_data/spatial_example_dat.csv")

# create a data frame with the variables we wish to include in the NDI
prcdf <- df |> select(perc_poverty, perc_male_occ, female_headed,
           crowded_housing, public_assistance, under_30k,
           less_hs, unemployment)

res1 <- psych::principal(prcdf, scores = TRUE) # captures 64 percent of the variation in of the correlation matrix 

# examine communalities and loadings, if you're interested 
# res1$communality
# res1$loadings

#compare with two or three factor solution 
#res2 <- psych::principal(prcdf, scores = TRUE, nfactors = 2) # second component explains an additional 14 percent 
#res3 <- psych::principal(prcdf, scores = TRUE, nfactors = 3) # third component explains an additional 13 percent 
#res2$loadings
#res3$loadings

# append the results to the dataframe
df$ndi <-  res1$scores
