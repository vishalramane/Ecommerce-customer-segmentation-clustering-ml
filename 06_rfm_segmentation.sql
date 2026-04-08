-- =========================================
-- File: 06_segmentation.sql
-- Purpose: Create business-friendly customer segments
-- =========================================

USE ecommerce_capstone;

DROP TABLE IF EXISTS rfm_segments;

CREATE TABLE rfm_segments AS
SELECT
    CustomerID,
    Recency,
    Frequency,
    Monetary,
    RecencyScore,
    FrequencyScore,
    MonetaryScore,

    -- Combined RFM score
    (RecencyScore + FrequencyScore + MonetaryScore) AS RFM_Total,

    CASE
        WHEN (RecencyScore + FrequencyScore + MonetaryScore) >= 13
            THEN 'High Value'

        WHEN (RecencyScore + FrequencyScore + MonetaryScore) BETWEEN 10 AND 12
            THEN 'Loyal'

        WHEN (RecencyScore + FrequencyScore + MonetaryScore) BETWEEN 7 AND 9
            THEN 'Potential'

        WHEN (RecencyScore + FrequencyScore + MonetaryScore) BETWEEN 5 AND 6
            THEN 'At Risk'

        ELSE 'Low Value'
    END AS Segment

FROM rfm_scored;
