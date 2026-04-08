-- =========================================
-- File: 08_exports.sql
-- Purpose: Export tables to CSV for BI & ML
-- =========================================

USE ecommerce_capstone;

-- Export sales
SELECT *
FROM online_retail_sales
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/online_retail_sales.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- Export RFM segments
SELECT *
FROM rfm_segments
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/rfm_segments.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- Export ML features
SELECT *
FROM ml_features
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ml_features.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
