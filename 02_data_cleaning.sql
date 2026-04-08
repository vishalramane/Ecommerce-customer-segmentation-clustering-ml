-- =========================================
-- File: 02_data_cleaning.sql
-- Purpose: Load data, clean transactions, create sales table
-- =========================================

USE ecommerce_capstone;

-- Load CSV (run once)
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/retail.csv'
INTO TABLE online_retail_cleaned
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- Create staging table
CREATE TABLE IF NOT EXISTS online_retail_staging LIKE online_retail_cleaned;

INSERT INTO online_retail_staging
SELECT * FROM online_retail_cleaned;

-- Store returns separately
DROP TABLE IF EXISTS returns;
CREATE TABLE returns AS
SELECT *
FROM online_retail_staging
WHERE Quantity < 0;

-- Create cleaned sales table
DROP TABLE IF EXISTS online_retail_sales;
CREATE TABLE online_retail_sales AS
SELECT *
FROM online_retail_staging
WHERE Quantity > 0
  AND UnitPrice > 0
  AND CustomerID IS NOT NULL
  AND TRIM(CustomerID) <> '';
