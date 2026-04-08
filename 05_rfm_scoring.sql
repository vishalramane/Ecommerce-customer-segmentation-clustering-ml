-- =========================================
-- File: 05_rfm_scoring.sql
-- Purpose: Score customers using RFM (1–5 scale)
-- =========================================

USE ecommerce_capstone;

DROP TABLE IF EXISTS rfm_scored;

CREATE TABLE rfm_scored AS
SELECT
    CustomerID,
    Recency,
    Frequency,
    Monetary,
    FirstPurchaseDate,
    LastPurchaseDate,

    -- Scoring (5 = best)
    NTILE(5) OVER (ORDER BY Recency DESC)   AS RecencyScore,
    NTILE(5) OVER (ORDER BY Frequency ASC) AS FrequencyScore,
    NTILE(5) OVER (ORDER BY Monetary ASC)  AS MonetaryScore

FROM rfm_base;
