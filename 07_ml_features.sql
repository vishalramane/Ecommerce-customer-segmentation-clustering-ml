-- =========================================
-- File: 07_ml_features.sql
-- Purpose: Create ML-ready customer feature table
-- =========================================

USE ecommerce_capstone;

DROP TABLE IF EXISTS ml_features;
CREATE TABLE ml_features AS
SELECT
  CustomerID,
  DATEDIFF(
    (SELECT DATE_ADD(MAX(InvoiceDate), INTERVAL 1 DAY)
     FROM online_retail_sales),
    MAX(InvoiceDate)
  ) AS Recency,
  COUNT(DISTINCT InvoiceNo) AS Frequency,
  ROUND(SUM(TotalAmount), 2) AS Monetary
FROM online_retail_sales
GROUP BY CustomerID;
