
# QTM 347 Final Project: Predicting Calories Burnt

**Team Members**: Keely Grice, Safia Read, Aanya Vusirikala, Vicki Wang  
**Course**: QTM 347  
**Dataset Source**: [Kaggle – Calories Burnt Prediction](https://www.kaggle.com/datasets/ruchikakumbhar/calories-burnt-prediction)



## 📊 Project Overview

This project involved:
- **Data Cleaning & Imputation**: Addressing missing values using both R and Python-based techniques.
- **Modeling**: Comparing several models including:
  - Ordinary Least Squares (OLS)
  - Ridge, Lasso, and Elastic Net Regression
  - k-Nearest Neighbors (kNN)
  - Principal Component Regression (PCR)
  - Boosted Trees (XGBoost)

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

- **Boosted RF XGBoost.ipynb**: Basic gradient boosting implementation.
- **BoostedRFXGBoostWithAppleWatch.ipynb**: Enhanced XGBoost model incorporating Apple Watch features.
- **Lasso-Ridge-ElasticNet-OLS.ipynb**: Penalized regression models with baseline OLS for comparison.
- **PCR.ipynb**: Principal Component Regression to reduce dimensionality before prediction.
- **QTM347-kNN.ipynb**: Implementation of k-Nearest Neighbors.
- **QTM347-OLS.ipynb**: Simple linear regression model.

---

## 🗃️ Datasets

Found in the `Datasets for Imputing/` folder. These include:
- Raw and imputed versions of exercise tracking and gym data
- R script used to process and clean data

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
