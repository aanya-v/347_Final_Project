
# QTM 347 Final Project: Predicting Calories Burnt 🔥🔥🔥

**Team Members**: Keely Grice, Safia Read, Aanya Vusirikala, Vicki Wang  
**Course**: QTM 347  
**Dataset Source**: [Kaggle – Calories Burnt Prediction](https://www.kaggle.com/datasets/ruchikakumbhar/calories-burnt-prediction)
**Slides**: [slides](https://docs.google.com/presentation/d/1Y_7LITVHI6QToPZrPtNO5PAJ5rgaScBfKeuBDorOh14/edit#slide=id.g34a8136d183_0_10)



## 📊 Project Overview

This project involved:
- **Modeling**: Comparing eleven models including:
  - Ordinary Least Squares (OLS)
  - Ridge, Lasso, and Elastic Net Regression
  - k-Nearest Neighbors (kNN)
  - Principal Component Regression (PCR)
  - Boosted Trees (XGBoost)
  - Artificial Neural Net (ANN)
  - Support Vector Regression (SVR)
 
- **Expanding to additional datasets**: via imputation and apple watch comparison analysis!

---


## 🔍 Project Motivation

The motivation behind our project is to improve predictions of calorie expenditure. This is beneifical for helpingindividuals tailor workouts and manage health goals more effectively! Our project explores the predictive modeling of calories burnt using physiological (i.e. gender, age, body weight) and activity-related (i.e. duration, avg heart rate, body temp) covariates, applying a range of linear and nonlinear machine learning methods.

---

## 📊 Dataset Summary

The core dataset contains the following features:
- **Covariates**: `Gender`, `Age`, `Height`, `Weight`, `Duration`, `Heart Rate`, `Body Temperature`
- **Target**: `Calories`

**Preprocessing**:
- Encoded `Gender` as a binary dummy variable.
- Removed unnecessary identifiers (e.g., ID column).
- No missing values in the original dataset.
- Additional synthetic/imputed datasets were generated for model testing using VIM's kNN in R.

---

## 📂 Notebooks Description

- **Tree_Methods.ipynb**: Gradient boosting, Random Forest, and Bagging models with original dataset and imputed dataset
- **Lasso-Ridge-ElasticNet-OLS.ipynb**: Penalized regression models on original dataset (calories.csv)
- **PCR.ipynb**: Used Principal Component Regression to implement PCA dimensionality then run a regression on the PCs
- **QTM347-kNN.ipynb**:  Implementation of k-Nearest Neighbors to original dataset (calories.csv)
- **QTM347-OLS.ipynb**:  Simple linear regression model with best subset and manually assigned covariates with calories.csv
- **kNN_imputed_non_imputed:** Tested kNN model on additional dataset (imputed version and nonimputed version) for generalizability
- **Bagging_Imputed_NonImputed:** Tested bagging model on additional dataset (imputed version and nonimputed version) for generalizability
- **CaloriesANN_SVR.ipynb**: Used a regression ANN and Support Vector Regression (adapted version of Support Vector Machine for regression purposes

---
### Results

**Table of error metrics for all models, ordered from least to most error.**


<img width="650" alt="Screenshot 2025-04-29 at 2 58 51 PM" src="https://github.com/user-attachments/assets/3ef6af59-29cf-422a-a458-d578b71da86d" />

**Chart of Test MSE and Test MAE results**


<img width="464" alt="Screenshot 2025-04-29 at 3 06 18 PM" src="https://github.com/user-attachments/assets/f26fd32c-d675-4d78-bd09-fe63ff02b91a" />

**Chart of R^2**


<img width="421" alt="Screenshot 2025-04-29 at 3 07 21 PM" src="https://github.com/user-attachments/assets/5d2bf928-17fe-4c4f-8e70-abb91031f1dd" />

- The top four performing models were Boosting, Random Forests, Bagging, and kNN.
- Boosting performed the best.
- The four features with the most importance according to the boosted model are Duration (0.891), Heart Rate (0.048), Gender (0.037), and Age (0.019).
---

## 🗃️ Additional Datasets

Found in the `Datasets for Imputing/` folder. These include:
- Raw and imputed versions of exercise tracking and gym data
- R script used to process and clean data

### Imputing: 
- The second dataset used to test the generalizability of the models lacked the variable “Body_Temp”
- Using the original (calories.csv) and the new (gym_members_exercise_tracking.csv) datasets, kNN was utilized (through R’s VIM package) to fill in the missing values
- This process enables the datasets to keep a similar variance for the variables with imputation
- The new version of gym_members_exercise_tracking.csv with imputed values for “Body_Temp” was uploaded as gym_imputed.csv

---
### Imputing Results

Chart of Test MSE and MAE for Imputed and Non Imputed datasets.

<img width="383" alt="Screenshot 2025-04-29 at 3 17 24 PM" src="https://github.com/user-attachments/assets/706836c8-a421-41fe-88ab-c79b48e658b5" />

- Imputed data MSE and MAE error is extremely large.
  - This error is potentially due to the difference in the range of duration between the original and imputed data.   Duration is much larger in the imputed data than the original data, so the model may not be extrapolating well.
  - In addition, the method of imputing body temperature may not have been accurate and thrown the model off.
- When training the non-imputed data with the top four model methods, the boosted tree still performed the best. This shows that the boosted method seems to work the best for a calorie prediction problem.


---
## ⌚ Real-World Application: Apple Watch vs XGBoost Model

To evaluate our model in a real-world setting, we collected data from three 35-minute workouts of varying intensity:

- **Upper Body** (Low Intensity)
- **Leg Day** (Medium Intensity)
- **Cardio** (High Intensity)

For each workout, average heart rate (HR) was recorded, and we compared the **Boosted Tree (XGBoost)** model's predicted calories burnt to the **Apple Watch** calorie estimate.

### 🔎 Observations

- The model's predictions were **closer to the Apple Watch estimate for lower-intensity workouts**.
- At **higher intensities (e.g., Cardio)**, the model **underpredicted calories burnt** compared to the Apple Watch.

### 🧠 Interpretation

Upon examining the training dataset (`calories.csv`), we found that:
- The **average heart rates in the training data were lower** than the real-world intense workouts.
- While **heart rate and calorie expenditure typically exhibit a linear relationship** 
- Our feature importance analysis revealed that the XGBoost model **heavily weighted `Duration` over `Heart Rate`**:
  - `Duration` accounted for ~89% of total feature importance.
  - `Heart Rate` contributed only ~5%.

Thus, even though a higher heart rate should predict greater calorie burn, the model relied **primarily on duration**, causing inconsistencies when extrapolating to higher heart rate ranges not well represented in the training data.

---

> **Reference**:  
> *Heart rate is linearly correlated with oxygen consumption and energy expenditure during dynamic exercise.*  
> [Relationship Between Heart Rate and Energy Expenditure During Exercise (NCBI)](https://pubmed.ncbi.nlm.nih.gov/10551338/)


---

## ➡️Future Directions & Limitations

### 🚧 Limitations
- The calorie prediction model may underperform on high-intensity workouts due to lack of high heart rate observations in the original training data
- Model feature importance is skewed toward `Duration`, which may limit generalizability to workouts with varying intensity but fixed time.
- Extrapolation is a key limitation as the model performs best within the range of the training data(up to 314 calories burnt) and struggles when applied to real-world observations beyond that scope.

###  🏋️Future Work
- Incorporate datasets with longer workout durations and explicitly measured intensity levels 
- Include additional covariates like workout type, motion data, and fitness experience for improved prediction.
- Compare predictions to wearable-calculated calorie estimate (e.g., Apple Watch) using measured ground truth via calorimeter measurement 



---

## 🛠️ Key Requirements

- Python 3.x
- Jupyter Notebook
- pandas, numpy, matplotlib, seaborn
- scikit-learn, sci-py, xgboost, keras

To import dataset:
```bash
import pandas as pd
pd.read_csv('calories.csv')
