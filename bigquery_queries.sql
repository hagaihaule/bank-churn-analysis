-- =====================================================
-- Bank Customer Churn Analysis
-- Dataset: 10,000 bank customers
-- Tool: Google BigQuery
-- =====================================================

-- 1. Overall churn rate across all customers
SELECT
  COUNT(*) AS total_customers,
  SUM(Exited) AS churned_customers,
  ROUND(SUM(Exited) / COUNT(*) * 100, 2) AS churn_rate_pct
FROM `data-alaysis.bank_churn.customers`;


-- 2. Churn rate by country
SELECT
  Geography,
  COUNT(*) AS total_customers,
  SUM(Exited) AS churned,
  ROUND(SUM(Exited) / COUNT(*) * 100, 2) AS churn_rate_pct
FROM `data-alaysis.bank_churn.customers`
GROUP BY Geography
ORDER BY churn_rate_pct DESC;


-- 3. Churn rate by number of products held
SELECT
  NumOfProducts,
  COUNT(*) AS total_customers,
  SUM(Exited) AS churned,
  ROUND(SUM(Exited) / COUNT(*) * 100, 2) AS churn_rate_pct
FROM `data-alaysis.bank_churn.customers`
GROUP BY NumOfProducts
ORDER BY NumOfProducts;


-- 4. Churn rate: active vs inactive members
SELECT
  IsActiveMember,
  COUNT(*) AS total_customers,
  SUM(Exited) AS churned,
  ROUND(SUM(Exited) / COUNT(*) * 100, 2) AS churn_rate_pct
FROM `data-alaysis.bank_churn.customers`
GROUP BY IsActiveMember;


-- 5. Combined view: churn by country AND number of products
-- (used to check whether the high-churn product segments
--  are concentrated in one country or spread across all three)
SELECT
  Geography,
  NumOfProducts,
  COUNT(*) AS total_customers,
  SUM(Exited) AS churned,
  ROUND(SUM(Exited) / COUNT(*) * 100, 2) AS churn_rate_pct
FROM `data-alaysis.bank_churn.customers`
GROUP BY Geography, NumOfProducts
ORDER BY Geography, NumOfProducts;


-- 6. Churn rate by age group
SELECT
  CASE
    WHEN Age < 30 THEN 'Under 30'
    WHEN Age BETWEEN 30 AND 39 THEN '30-39'
    WHEN Age BETWEEN 40 AND 49 THEN '40-49'
    WHEN Age BETWEEN 50 AND 59 THEN '50-59'
    ELSE '60+'
  END AS age_group,
  COUNT(*) AS total_customers,
  SUM(Exited) AS churned,
  ROUND(SUM(Exited) / COUNT(*) * 100, 2) AS churn_rate_pct
FROM `data-alaysis.bank_churn.customers`
GROUP BY age_group
ORDER BY age_group;


-- 7. Churn rate by credit score band
SELECT
  CASE
    WHEN CreditScore < 580 THEN 'Poor (<580)'
    WHEN CreditScore BETWEEN 580 AND 669 THEN 'Fair (580-669)'
    WHEN CreditScore BETWEEN 670 AND 739 THEN 'Good (670-739)'
    WHEN CreditScore BETWEEN 740 AND 799 THEN 'Very Good (740-799)'
    ELSE 'Excellent (800+)'
  END AS credit_band,
  COUNT(*) AS total_customers,
  SUM(Exited) AS churned,
  ROUND(SUM(Exited) / COUNT(*) * 100, 2) AS churn_rate_pct
FROM `data-alaysis.bank_churn.customers`
GROUP BY credit_band
ORDER BY credit_band;


-- 8. Germany-specific: does age explain the 1-product churn gap?
-- Compares age group churn rates within Germany's 1-product customers only
SELECT
  CASE
    WHEN Age < 30 THEN 'Under 30'
    WHEN Age BETWEEN 30 AND 39 THEN '30-39'
    WHEN Age BETWEEN 40 AND 49 THEN '40-49'
    WHEN Age BETWEEN 50 AND 59 THEN '50-59'
    ELSE '60+'
  END AS age_group,
  COUNT(*) AS total_customers,
  SUM(Exited) AS churned,
  ROUND(SUM(Exited) / COUNT(*) * 100, 2) AS churn_rate_pct
FROM `data-alaysis.bank_churn.customers`
WHERE Geography = 'Germany' AND NumOfProducts = 1
GROUP BY age_group
ORDER BY age_group;
