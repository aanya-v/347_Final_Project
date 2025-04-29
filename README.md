
# QTM 347 Final Project: Predicting Calories Burnt

**Team Members**: Keely Grice, Safia Read, Aanya Vusirikala, Vicki Wang  
**Course**: QTM 347  
**Dataset Source**: [Kaggle – Calories Burnt Prediction](https://www.kaggle.com/datasets/ruchikakumbhar/calories-burnt-prediction)



## 📊 Project Overview

This project involved:
- **Modeling**: Comparing several models including:
  - Ordinary Least Squares (OLS)
  - Ridge, Lasso, and Elastic Net Regression
  - k-Nearest Neighbors (kNN)
  - Principal Component Regression (PCR)
  - Boosted Trees (XGBoost)
 
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

- **Boosted RF XGBoost.ipynb**: Gradient boosting, Random Forest, and Bagging models
- **Lasso-Ridge-ElasticNet-OLS.ipynb**: Penalized regression models on original dataset (calories.csv)
- **PCR.ipynb**: Used Principal Component Regression to implement PCA dimensionality then run a regression on the PCs
- **QTM347-kNN.ipynb**:  Implementation of k-Nearest Neighbors to original dataset (calories.csv)
- **QTM347-OLS.ipynb**:  Simple linear regression model with best subset and manually assigned covariates with calories.csv

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

## 🛠️ Key Requirements

- Python 3.x
- Jupyter Notebook
- pandas, numpy, matplotlib, seaborn
- scikit-learn, sci-py, xgboost, keras

To import dataset:
```bash
import pandas as pd
pd.read_csv('calories.csv')
