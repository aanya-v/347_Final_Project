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

#write.csv(data_clean, "calories2.csv", row.names=FALSE)
summary(cal)

#Impute Body Temp
#Rename variables to match
df <- data_clean
#names(df) <- c("Calories", "Age", "Gender", "Duration", "Heart_Rate", "Weight", "Height")

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

#write.csv(imputed, "imputed.csv", row.names=FALSE)
