# 🧠 Patients Brain Stroke Prediction & Analysis

## 📌 Overview

This project focuses on analyzing stroke prevalence, identifying high-risk groups, and predicting the likelihood of a brain stroke using machine learning. It combines **data analysis**, **visualization**, and **model deployment** to provide a practical, data-driven solution for early risk assessment.

## 🎯 Objectives

* Measure stroke prevalence and identify high-risk groups.
* Perform **data cleaning** (Excel) and **SQL-based insights**.
* Conduct **Exploratory Data Analysis (EDA)** using Power BI.
* Build a **machine learning model** to predict stroke risk.
* Deploy the best-performing model using **Streamlit** for real-time prediction.

## 🗂️ Dataset & Methodology

* **Dataset:** `stroke_analysis.csv` & `stroke_analysis.xlsx` (5,110 records).
* **Target Variable:** `stroke` (0 = No Stroke, 1 = Stroke).
* **Data Sources:** Includes demographic + health indicators (age, gender, hypertension, BMI, glucose level, smoking status, etc.).
* **SQL:** Used `GROUP BY`, `AVG` queries for grouped insights.
* **EDA:** Visualized trends in age, gender, BMI, glucose, work type, etc.

## 📊 Key Insights

* **Overall Stroke Rate:** 4.87% (249 / 5110 patients).
* **Age Factor:** 61+ group shows the highest stroke prevalence (13.57%).
* **Hypertension:** Strong risk factor (13.25% vs 3.97% in non-hypertensives).
* **Lifestyle:** Self-employed and former smokers have higher crude rates.
* **Metabolic Health:** Higher BMI and glucose levels observed in stroke patients.

## 🤖 Machine Learning Model

* **Preprocessing:**

  * Missing value imputation
  * Scaling: `age`, `avg_glucose_level`, `BMI`
  * Encoding: `gender` (ordinal), `work_type` & `smoking_status` (one-hot)
* **Model:** XGBoost Classifier (selected via GridSearchCV).
* **Handling Imbalance:** SMOTE oversampling used.
* **Training:** 80% train / 20% validation split.
* **Evaluation Metrics:** Accuracy, Precision, Recall, F1-score (focused on minimizing false negatives).

## 🖥️ Deployment

The model is deployed with **Streamlit**:

* User inputs patient details (age, health conditions, lifestyle).
* System preprocesses input → feeds into trained model → returns risk prediction.
* Output:

  * ⚠️ **High Risk** (consult healthcare professional)
  * ✅ **Low Risk**

## 🚀 Installation & Usage

```bash
# Clone the repository
git clone https://github.com/your-username/patients-brain-stroke-analysis.git
cd patients-brain-stroke-analysis

# Install dependencies
pip install -r requirements.txt

# Run the Streamlit app
streamlit run streamlit_app.py
```

Then open the local URL shown in the terminal to access the app.

## 🛠 Tech Stack

* **Python** (Pandas, NumPy, Scikit-learn, XGBoost)
* **SQL** for data aggregation
* **Power BI** for EDA & dashboards
* **Streamlit** for deployment

## 📈 Feature Importance

* **Top Predictors:** Age, Avg. Glucose Level, BMI
* **Moderate Influence:** Hypertension, Heart Disease, Smoking Status
* **Minimal Contribution:** Gender

## 📌 Future Scope

* Host on AWS / Hugging Face Spaces for wider access.
* Integrate SHAP explainability for model interpretability.
* Add more health indicators to improve prediction accuracy.

## 👨‍💻 Contributors

* **Jotheeswaran S**
* **Pradeep Kumar S**
* **Sridhar P**

Would you like me to add **badges (Streamlit | Python | XGBoost)** and a **preview screenshot** of your deployed app (to make the README look visually appealing)?
