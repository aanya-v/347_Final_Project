
---

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

## 🛠️ Requirements

- Python 3.x
- Jupyter Notebook
- pandas, numpy, matplotlib, seaborn
- scikit-learn, xgboost

To install dependencies:
```bash
pip install -r requirements.txt
