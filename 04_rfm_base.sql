-- =========================================
-- File: 04_rfm_base.sql
-- Purpose: Create RFM base metrics per customer
-- =========================================

USE ecommerce_capstone;

-- Snapshot date = last transaction date + 1 day
SET @snapshot_date = (
    SELECT DATE_ADD(MAX(InvoiceDate), INTERVAL 1 DAY)
    FROM online_retail_sales
);

DROP TABLE IF EXISTS rfm_base;

CREATE TABLE rfm_base AS
SELECT
    CustomerID,

    -- Recency: days since last purchase (lower is better)
    DATEDIFF(@snapshot_date, MAX(InvoiceDate)) AS Recency,

    -- Frequency: number of distinct purchases
    COUNT(DISTINCT InvoiceNo) AS Frequency,

    -- Monetary: total customer revenue
    ROUND(SUM(Quantity * UnitPrice), 2) AS Monetary,

    MIN(InvoiceDate) AS FirstPurchaseDate,
    MAX(InvoiceDate) AS LastPurchaseDate

FROM online_retail_sales
WHERE
    CustomerID IS NOT NULL
    AND Quantity > 0
    AND UnitPrice > 0
    AND InvoiceNo NOT LIKE 'C%'   -- remove returns
GROUP BY CustomerID;

