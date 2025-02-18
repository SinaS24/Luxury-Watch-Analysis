-- INSPECTING AND CLEANING THE DATASET

-- Retrieve the first 10 records from the table
SELECT * FROM Luxury_watch_dataset LIMIT 10;

-- Get the total number of records in the table
SELECT COUNT(*) FROM Luxury_watch_dataset;

-- Check the table structure 
PRAGMA table_info(Luxury_watch_dataset);
  
-- Identify missing values in each column
SELECT 'Brand' AS column_name, COUNT(*) AS missing_count FROM Luxury_watch_dataset WHERE Brand IS NULL
UNION
SELECT 'Model', COUNT(*) FROM Luxury_watch_dataset WHERE Model IS NULL
UNION
SELECT 'Reference', COUNT(*) FROM Luxury_watch_dataset WHERE Reference IS NULL
UNION
SELECT 'Complication', COUNT(*) FROM Luxury_watch_dataset WHERE Complication IS NULL
UNION
SELECT 'Case Material', COUNT(*) FROM Luxury_watch_dataset WHERE "Case Material" IS NULL
UNION
SELECT 'Bracelet Material', COUNT(*) FROM Luxury_watch_dataset WHERE "Bracelet Material" IS NULL
UNION
SELECT 'Dial', COUNT(*) FROM Luxury_watch_dataset WHERE Dial IS NULL
UNION
SELECT 'Hour Markings', COUNT(*) FROM Luxury_watch_dataset WHERE "Hour Markings" IS NULL
UNION
SELECT 'Lunette Material', COUNT(*) FROM Luxury_watch_dataset WHERE "Lunette Material" IS NULL
UNION
SELECT 'Price', COUNT(*) FROM Luxury_watch_dataset WHERE Price IS NULL;

-- Remove the only row with missing data from the table
DELETE FROM Luxury_watch_dataset WHERE Reference IS NULL;

-- Identify any non-numeric values in the Price column
SELECT Price FROM Luxury_watch_dataset WHERE Price NOT GLOB '[0-9]*';



-- STANDARDISING CATEGORICAL DATA

-- Retrieve unique values for each categorical column to ensure consistency
SELECT 'Complication' AS Column_Name, Complication AS Unique_Value FROM Luxury_watch_dataset GROUP BY Complication ORDER BY Unique_Value;

-- Standardise Case Material
SELECT 'Case Material' AS Column_Name, "Case Material" AS Unique_Value FROM Luxury_watch_dataset GROUP BY "Case Material" ORDER BY Unique_Value;
UPDATE Luxury_watch_dataset
SET "Case Material" = 'Yellow Gold'
WHERE "Case Material" = 'Gold';

-- Standardise Bracelet Material
SELECT 'Bracelet Material' AS Column_Name, "Bracelet Material" AS Unique_Value FROM Luxury_watch_dataset GROUP BY "Bracelet Material" ORDER BY Unique_Value;

-- Merge Crocodile-Leather and Snake-Leather into Reptile-Leather
UPDATE Luxury_watch_dataset
SET "Bracelet Material" = 'Reptile-Leather'
WHERE "Bracelet Material" IN ('Crocodile-Leather', 'Snake-Leather', 'Reptile-leather');

-- Merge Cow-Leather, Shark-Leather, and Ostrich-Leather into Leather
UPDATE Luxury_watch_dataset
SET "Bracelet Material" = 'Leather'
WHERE "Bracelet Material" IN ('Cow-Leather', 'Shark-Leather', 'Ostrich Leather');

-- Convert Gold/Steel to Yellow Gold
UPDATE Luxury_watch_dataset
SET "Bracelet Material" = 'Yellow Gold'
WHERE "Bracelet Material" = 'Gold';

-- Convert Gold/Steel to Yellow Gold
UPDATE Luxury_watch_dataset
SET "Bracelet Material" = 'Yellow Gold'
WHERE LOWER("Bracelet Material") LIKE '%gold%steel%';

-- Standardise Hour Markings
SELECT 'Hour Markings' AS Column_Name, "Hour Markings" AS Unique_Value FROM Luxury_watch_dataset GROUP BY "Hour Markings" ORDER BY Unique_Value;

-- Standardise Lunette Material
SELECT 'Lunette Material' AS Column_Name, "Lunette Material" AS Unique_Value FROM Luxury_watch_dataset GROUP BY "Lunette Material" ORDER BY Unique_Value;

-- Convert Gold to Yellow Gold
UPDATE Luxury_watch_dataset
SET "Lunette Material" = 'Yellow Gold'
WHERE "Lunette Material" = 'Gold';

-- Convert Gold to Yellow Gold
UPDATE Luxury_watch_dataset
SET "Lunette Material" = 'Rose Gold'
WHERE "Lunette Material" = 'Rose gold';



-- DUPLICATE CHECKING & UNIQUE IDENTIFIERS

-- Identify duplicate records using the Reference column
SELECT Reference, COUNT(*) AS count
FROM Luxury_watch_dataset
GROUP BY Reference
HAVING count > 1;

-- Added Transaction_ID column and Assign a unique Transaction ID to each record
UPDATE Luxury_watch_dataset
SET Transaction_ID = rowid;
