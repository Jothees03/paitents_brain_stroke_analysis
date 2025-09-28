use health_care;

select * from stroke_analysis;

##"COUNT OF STROKE,HEART_DISEASE,HYPERTENSION WITH THEIR GENDER"##
select gender,count(*),sum(hypertension),sum(heart_disease),sum(stroke) from stroke_analysis group by gender;

##"COUNT OF PATIENTS,STROKE WITH RESPECT TO THEIR RESIDENCE TYPE"##
select Residence_type,count(*),sum(stroke) from stroke_analysis group by Residence_type;

##"COUNT OF STROKE WITH RESPECT TO THEIR WORK_TYPE"##
select work_type,sum(stroke) from stroke_analysis group by work_type;

##"PATIENTS COUNT WITH RESPECT TO STROKE ALONG WITH STROKE_RATE""##
select
  COUNT(*) AS total_patients,
  SUM(stroke) AS stroke_cases,
  ROUND(100 * SUM(stroke) / COUNT(*), 2) AS stroke_rate_pct
from stroke_analysis;

##"STROKE WITH AVERAGE BMI"##
select stroke,avg(bmi) as average_bmi from stroke_analysis group by stroke;

##"COMPARSION OF GENDER WITH HYPERTENSION AND HEART_DISEASE,THEIR COUNT"##
SELECT gender, hypertension, heart_disease, COUNT(*) AS total
FROM stroke_analysis
GROUP BY gender, hypertension,heart_disease;

##"COUNT,RATIOS OF HYEPERTENSION WITH STROKE"##
WITH grp AS (
  SELECT
    SUM(hypertension = 1)              AS hyp_total,
    SUM(hypertension = 1 AND stroke=1) AS hyp_strokes,
    SUM(hypertension = 0)              AS nohyp_total,
    SUM(hypertension = 0 AND stroke=1) AS nohyp_strokes
  FROM stroke_analysis
)
SELECT
  hyp_total,
  hyp_strokes,
  nohyp_total,
  nohyp_strokes,
  ROUND(100 * hyp_strokes / NULLIF(hyp_total,0), 2)     AS rate_hyp_pct,
  ROUND(100 * nohyp_strokes / NULLIF(nohyp_total,0), 2) AS rate_nohyp_pct
FROM grp;

##"COUNT AND RATIOS OF STROKE WITH RESPECT TO AGE GROUP"##
SELECT age_category,
       COUNT(*) as total,
       SUM(stroke) as strokes,
       ROUND(100 * SUM(stroke)/COUNT(*), 2) as stroke_rate_pct
FROM stroke_analysis
GROUP BY age_category
ORDER BY FIELD(age_category, '0–17','18–30','31–45','46–60','61+');

##"RATIOS AND COUNT INORDER WITH SMOKING STATUS"##
SELECT smoking_status, 
COUNT(*) AS total_count,
SUM(stroke) AS total_stroke, 
ROUND(100 * SUM(stroke)/COUNT(*), 2) as stroke_rate_pct 
FROM stroke_analysis GROUP BY smoking_status;

##"GENDER WITH GLUCOSE LEVEL"##
SELECT gender,COUNT(*) AS high_glucose_stroke,SUM(stroke) AS stroke_count,
ROUND(100 * SUM(stroke)/COUNT(*), 2) as stroke_rate_pct
FROM stroke_analysis
WHERE avg_glucose_level > 125 AND stroke = 1
Group by gender;

##"GENDER WITH RISK FACTOR"##
SELECT gender,risk_factor1,SUM(stroke) AS stroke_count 
FROM stroke_analysis 
GROUP BY gender,risk_factor1 ORDER BY stroke_count DESC;
