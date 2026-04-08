-- =========================================
-- File: 03_feature_engineering.sql
-- Purpose: Add derived columns to sales table
-- =========================================

USE ecommerce_capstone;

ALTER TABLE online_retail_sales
ADD COLUMN TotalAmount DECIMAL(12,2),
ADD COLUMN InvoiceDateDate DATE,
ADD COLUMN Year INT,
ADD COLUMN Month INT,
ADD COLUMN Day INT,
ADD COLUMN Hour INT;

SET SQL_SAFE_UPDATES = 0;

UPDATE online_retail_sales
SET 
  TotalAmount = Quantity * UnitPrice,
  InvoiceDateDate = DATE(InvoiceDate),
  Year = YEAR(InvoiceDate),
  Month = MONTH(InvoiceDate),
  Day = DAY(InvoiceDate),
  Hour = HOUR(InvoiceDate);

SET SQL_SAFE_UPDATES = 1;
