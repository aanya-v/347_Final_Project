#Clean second dataset to check for generalizability
library(dplyr)
library(VIM)

#import datasets
cal <- read.csv("calories.csv")
gym<- read.csv("gym_members_exercise_tracking.csv")

#Drop extra covariates (not included in original models)
summary(gym)
gym <- gym %>%
  select(Age, Gender, Weight..kg., Height..m., Avg_BPM, Session_Duration..hours., Calories_Burned)
summary(gym)

#rename to match variable names from cal
names(gym) <- c("Age", "Gender", "Weight", "Height", "Heart_Rate", "Duration", "Calories")

#Gender to dummy variable
gym$Gender <- ifelse(gym$Gender == "Female", 1, 0)
gym$Gender

#Height units to match cal
gym$Height <- gym$Height *100
gym$Height

#Duration in minutes to match cal
gym$Duration <- gym$Duration*60

#Make csv
#write.csv(gym, "gym_nonimputed.csv", row.names=FALSE)

#Make dataset with imputes values for missing variable
#Make variable column
gym$Body_Temp <- NA

#Combine datasets
combined <- rbind(cal, gym)
summary(combined)
nrow(combined)

# Impute missing values using kNN method
imputed1 <- kNN(combined, k=20)
summary(imputed$Body_Temp)

#Drop rows with original dataset (leave new dataset only)
combined[15000, ]
combined[15001, ]

imputed1 <- imputed1[-(1:15000), ]
imputed1[1, ]

#Drop columns with boolean if imputed
imputed1_drop <- imputed1 %>%
  select(Gender, Age, Height, Weight, Duration, Heart_Rate, Body_Temp, Calories)

#Make csv
#write.csv(imputed1_drop, "gym_imputed.csv", row.names=FALSE)
