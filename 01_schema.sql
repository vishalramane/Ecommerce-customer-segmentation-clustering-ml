-- =========================================
-- File: 01_schema.sql
-- Purpose: Create database and raw table
-- =========================================

CREATE DATABASE IF NOT EXISTS ecommerce_capstone;
USE ecommerce_capstone;

CREATE TABLE IF NOT EXISTS online_retail_cleaned (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10,2),
    CustomerID VARCHAR(20),
    Country VARCHAR(50)
);
