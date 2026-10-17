-- SWYNEX Task 2: Exploratory Data Analysis (Crime Data)
-- Tool: MySQL Workbench | Database: crime_analysis | Table: crime (5,050 rows)

USE crime_analysis;

-- 1. Row count check
SELECT COUNT(*) AS total_rows FROM crime;

-- 2. Overall statistics
SELECT COUNT(*) AS total_incidents,
       COUNT(property_loss_usd) AS records_with_loss,
       ROUND(MIN(property_loss_usd), 2) AS min_loss,
       ROUND(AVG(property_loss_usd), 2) AS avg_loss,
       ROUND(MAX(property_loss_usd), 2) AS max_loss,
       ROUND(AVG(num_arrests), 2) AS avg_arrests
FROM crime;

-- 3. Trend: crimes per year
SELECT YEAR(incident_datetime) AS year,
       COUNT(*) AS total_crimes
FROM crime
WHERE incident_datetime IS NOT NULL
GROUP BY year
ORDER BY year;

-- 4. Pattern: crimes by type (with average property loss)
SELECT crime_type,
       COUNT(*) AS total_crimes,
       ROUND(AVG(property_loss_usd), 0) AS avg_loss
FROM crime
GROUP BY crime_type
ORDER BY total_crimes DESC;

-- 5. Pattern: crimes by district
SELECT district,
       COUNT(*) AS total_crimes
FROM crime
GROUP BY district
ORDER BY total_crimes DESC;
