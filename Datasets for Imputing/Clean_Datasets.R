#Clean second dataset to use in models
library(dplyr)
library(VIM)

data <- read.csv("exercise_dataset.csv")
cal <- read.csv("calories.csv")

#Turn gender into binary
data$Gender <- ifelse(data$Gender == "Female", 1, 0)
data$Gender

#Calculate Height
data$Actual.Weight
data$Height <- 100*sqrt(data$Actual.Weight / data$BMI)
data$Height

data_clean <- data %>%
  select(Calories.Burn, Age, Gender, Duration, Heart.Rate, Actual.Weight, Height)

summary(data_clean)
names(data_clean) <- c("Calories", "Age", "Gender", "Duration", "Heart_Rate", "Weight", "Height")

write.csv(data_clean, "calories2.csv", row.names=FALSE)
summary(cal)

#Impute Body Temp
#Rename variables to match
df <- data_clean
names(df) <- c("Calories", "Age", "Gender", "Duration", "Heart_Rate", "Weight", "Height")

#Add column for Body_Temp
df$Body_Temp <- as.numeric(NA)

#Drop User_ID
cal <- cal[, !(names(cal) == "User_ID")]

#Make Gender a dummy variable
cal$Gender <- ifelse(cal$Gender == "female", 1, 0)

#Combine datasets
combined_df <- rbind(cal, df)
summary(combined_df)
nrow(combined_df)

# Impute missing values using kNN method
imputed <- kNN(combined_df, k=20)
summary(imputed$Body_Temp)

combined_df[15000, ]
combined_df[15001, ]

imputed <- imputed[-(1:15000), ]
imputed[1, ]

imputed_drop <- imputed %>%
  select(Gender, Age, Height, Weight, Duration, Heart_Rate, Body_Temp, Calories)

write.csv(imputed_drop, "imputed.csv", row.names=FALSE)

summary(imputed_drop)

#Clean gym dataset
gym<- read.csv("gym_members_exercise_tracking.csv")

summary(gym)
gym <- gym %>%
  select(Age, Gender, Weight..kg., Height..m., Avg_BPM, Session_Duration..hours., Calories_Burned)
summary(gym)

names(gym) <- c("Age", "Gender", "Weight", "Height", "Heart_Rate", "Duration", "Calories")

#Gender to binary
gym$Gender <- ifelse(gym$Gender == "Female", 1, 0)
gym$Gender

#Height units
gym$Height <- gym$Height *100
gym$Height

#Duration in minutes
gym$Duration <- gym$Duration*60

#write.csv(gym, "gym_nonimputed.csv", row.names=FALSE)

gym$Body_Temp <- NA

#impute body temp
#Combine datasets
combined <- rbind(cal, gym)
summary(combined)
nrow(combined)

# Impute missing values using kNN method
imputed1 <- kNN(combined, k=20)
summary(imputed$Body_Temp)

combined[15000, ]
combined[15001, ]

imputed1 <- imputed1[-(1:15000), ]
imputed1[1, ]

imputed1_drop <- imputed1 %>%
  select(Gender, Age, Height, Weight, Duration, Heart_Rate, Body_Temp, Calories)

write.csv(imputed1_drop, "gym_imputed.csv", row.names=FALSE)
