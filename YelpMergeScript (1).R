load(url("http://eeyore.ucdavis.edu/sts198/Data/Yelp/yelpColleges.rda"))
#This is the yelp data in list format. Each DF is an element.

#How long does a moment last?
#The infinity of now
#Subsumed in the finitude of yesterday
#Somewhere in between, we lie

#There's issue of extracting the correct element from the DF
rev = dfs$review
bus = dfs$business
use = dfs$user

summary(merge(bus, rev, by = "business_id"))
#Merge business, reviews, by Business id
brm = merge(bus, rev, by = "business_id")
#Merge new var with user by user id
brum = merge(brm, use, by = "user_id")

#Trying to export as CSV, kinda not working though
write.csv(brum, file = "MergedTable.csv")
#That works, but not entirely informative

#####
#looking at number of reviews vs stars
#maybe there's a correlation between how popular a restaurant is vs how many stars it gets
#perhaps more reviews pull the average
table(bus$stars, bus$review_count)
hist(bus$stars, bus$review_count)
library(lattice)
smoothScatter(bus$stars, bus$review_count)
