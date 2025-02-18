-- BUSINESS INSIGHTS EXTRACTION



-- Sales Trends & Patterns 

-- Analyse yearly sales trends
SELECT strftime('%Y', "Purchase Date") AS Year, COUNT(*) AS Total_Sales
FROM Luxury_watch_dataset
GROUP BY Year
ORDER BY Year ASC;

-- Analyse monthly sales trends
SELECT strftime('%Y-%m', "Purchase Date") AS YearMonth, COUNT(*) AS Total_Sales
FROM Luxury_watch_dataset
GROUP BY YearMonth
ORDER BY YearMonth ASC;



-- Regional Sales Performance and Trends  

-- Total Sales Per Country
SELECT Country, COUNT(*) AS Total_Sales
FROM Luxury_watch_dataset
GROUP BY Country;

-- Top Cities by Sales
SELECT Country, City, COUNT(*) AS Total_Sales
FROM Luxury_watch_dataset
GROUP BY Country, City
ORDER BY Total_Sales DESC
LIMIT 10;

-- Brand sales by Country
SELECT Country, Brand, COUNT(*) AS Total_Sales
FROM Luxury_watch_dataset
GROUP BY Country, Brand
ORDER BY Country ASC, Total_Sales DESC
LIMIT 10;

-- Top selling btands by Country 
SELECT Country, Brand, COUNT(*) AS Total_Sales
FROM Luxury_watch_dataset
GROUP BY Country, Brand
ORDER BY Total_Sales DESC
LIMIT 10;

-- Top-Selling Brands (Not Just Rolex) by Country
WITH RankedBrands AS (
    SELECT Country, Brand, COUNT(*) AS Total_Sales,
           RANK() OVER (PARTITION BY Country ORDER BY COUNT(*) DESC) AS BrandRank
    FROM Luxury_watch_dataset
    GROUP BY Country, Brand
)
SELECT Country, Brand, Total_Sales
FROM RankedBrands
WHERE BrandRank <= 3
ORDER BY Country ASC, BrandRank ASC;



-- Brand & Price Analysis

-- Price Segmentation Per Brand
SELECT Brand, 
       COUNT(*) AS Total_Sales,
       ROUND(AVG(Price), 2) AS Avg_Price,
       MIN(Price) AS Min_Price,
       MAX(Price) AS Max_Price
FROM Luxury_watch_dataset
GROUP BY Brand
ORDER BY Total_Sales DESC
LIMIT 10;

-- Price Segmentation by Case Material
SELECT "Case Material", 
       ROUND(AVG(Price), 2) AS Avg_Price,
       MIN(Price) AS Min_Price,
       MAX(Price) AS Max_Price
FROM Luxury_watch_dataset
GROUP BY "Case Material"
ORDER BY Avg_Price DESC
LIMIT 10;

-- Price Segmentation by Bracelet Material
SELECT "Bracelet Material", 
       ROUND(AVG(Price), 2) AS Avg_Price,
       MIN(Price) AS Min_Price,
       MAX(Price) AS Max_Price
FROM Luxury_watch_dataset
GROUP BY "Bracelet Material"
ORDER BY Avg_Price DESC
LIMIT 10;

-- Complication & Feature Pricing Analysis
SELECT Complication, 
       ROUND(AVG(Price), 2) AS Avg_Price,
       MIN(Price) AS Min_Price,
       MAX(Price) AS Max_Price
FROM Luxury_watch_dataset
GROUP BY Complication
ORDER BY Avg_Price DESC
LIMIT 10;



--  Most Popular Watch Features

-- Distribution of Watch Features
SELECT "Case Material", COUNT(*) AS Total_Watches
FROM Luxury_watch_dataset
GROUP BY "Case Material"
ORDER BY Total_Watches DESC
LIMIT 10;

-- Most Common Bracelet Materials
SELECT "Bracelet Material", COUNT(*) AS Total_Watches
FROM Luxury_watch_dataset
GROUP BY "Bracelet Material"
ORDER BY Total_Watches DESC
LIMIT 10;

-- Most Common Dial Colours 
SELECT Dial, COUNT(*) AS Total_Watches
FROM Luxury_watch_dataset
GROUP BY Dial
ORDER BY Total_Watches DESC
LIMIT 10;

-- Most Common Hour Marking Styles
SELECT "Hour Markings", COUNT(*) AS Total_Watches
FROM Luxury_watch_dataset
GROUP BY "Hour Markings"
ORDER BY Total_Watches DESC
LIMIT 10;
