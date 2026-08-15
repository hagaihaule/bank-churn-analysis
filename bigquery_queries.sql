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
