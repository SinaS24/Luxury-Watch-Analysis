# Project Background
Luxury watches represent a unique segment of the global luxury goods industry, characterised by high-end craftsmanship, brand heritage, and exclusivity. The industry is dominated by Swiss watchmakers such as Rolex, Patek Philippe, Audemars Piguet, and Omega, along with high-end fashion brands like Cartier. The data set supplies sales for over 160,000 watches. This analysis was done in order to uncover insights that will guide decision makers at an organisation looking to get into the market, particularly in the areas of product development, marketing, and pricing strategy. 

Insights and recommendations are provided on the following key areas:

- **Market Trends & Brand Insights** 
- **Pricing Strategy & Premium Models** 
- **Material & Design Preferences** 
- **Brand Positioning & Competitive Differentiation** 

The SQL queries used to inspect and clean the data for this analysis can be found [here](https://raw.githubusercontent.com/SinaS24/Luxury-Watch-Analysis/main/LW_Data_Cleaning.sql).
).

Targeted SQL queries regarding various business questions can be found [here](https://raw.githubusercontent.com/SinaS24/Luxury-Watch-Analysis/main/LW_Business_Insights_Queries.sql).

An interactive Tableau dashboard used to report and explore sales trends can be found [here](https://public.tableau.com/app/profile/sina.sangsari/viz/Luxurywatchanalysis/LuxuryWatchMarketDashboard).



# Data Structure & Initial Checks

The database consists of a single table, luxury_watch_dataset_cleaned, which contains structured data about luxury watch transactions. Each row represents an individual sale, including details such as brand, model, material composition, pricing, and purchase information.
Below is the finalised table after structuring and cleaning the data.

## Dataset Schema

| Column Name       | Data Type | Description |
|------------------|----------|-------------|
| **Brand**        | TEXT     | The luxury watch manufacturer (e.g., Rolex, Patek Philippe). |
| **Model**        | TEXT     | The specific model of the watch (e.g., Submariner, Daytona). |
| **Reference**    | TEXT     | Unique reference number for the watch model. |
| **Complication** | TEXT     | Type of watch mechanism or special features (e.g., automatic, chronograph). |
| **Case Material** | TEXT     | The material used for the watch case (e.g., steel, platinum, gold). |
| **Bracelet Material** | TEXT | The material of the bracelet (e.g., leather, rubber, steel). |
| **Dial**         | TEXT     | The watch face colour (e.g., black, blue, silver). |
| **Hour Markings** | TEXT     | Type of markings on the dial (e.g., Roman numerals, Arabic numerals). |
| **Lunette Material** | TEXT | Material used for the bezel (e.g., ceramic, steel). |
| **Price**        | INTEGER  | The price of the watch in USD. |

## Initial Data Quality Checks

Below are the key findings and improvements made:
-	Added Transaction_ID – Assigned a unique ID to every sale. (The dataset originally lacked a unique transaction identifier. Since the same reference number appeared in multiple rows, it was determined that for this analysis it would be best if each row represented an individual sale rather than just a unique watch model.)
-	Checked for Missing Values – Identified 1 missing Reference value and removed it.
-	Ensured Price Is Numeric – Verified no non-numeric values exist.
-	Standardised Categorical Values – Fixed inconsistencies in materials and complications.
-	Simulated Purchase Dates & Locations – Added realistic timestamps and regional purchase data.



# Executive Summary

## Overview of Findings

This analysis explores key trends in luxury watch sales, focusing on seasonality, regional demand, and pricing strategies. Sales peak between August and December, driven by holiday shopping patterns, while February consistently records the lowest sales volume. A decline in sales in 2024 suggests potential economic shifts or changes in consumer behaviour.  

Regionally, the USA and Australia lead in total sales, while China and Japan show strong growth potential for luxury watch brands. Rolex dominates the global market, followed by Omega and Audemars Piguet, with premium brands like Patek Philippe commanding the highest prices.  

Material and design choices significantly influence pricing, with Platinum, Rose Gold, and White Gold watches ranking among the most expensive. Black, Blue, and Silver dials are the most popular, reflecting classic consumer preferences. Automatic watches consistently sell at a premium, reinforcing their perception as high-end craftsmanship pieces.  



# Insights Deep Dive

## Sales Trends & Patterns

### Yearly Sales Performance
We analysed the total number of luxury watches sold per year from 2018 to 2024. The results indicate stable sales, peaking in 2020 before a decline in 2024.

* **2020 saw the highest sales (27,012 units).**
* **A slight decline from 2021 to 2023, stabilising around ~26,900.**
* **A sharper drop in 2024 suggests external influences (economic factors, demand shifts).** 

| Year | Total Sales (units) |
|------|------------|
| 2018 | 26,717     |
| 2019 | 26,893     |
| 2020 | 27,012     |
| 2021 | 26,859     |
| 2022 | 26,909     |
| 2023 | 26,944     |
| 2024 | 22,863     |

![Yearly Sales trends](https://github.com/SinaS24/Luxury-Watch-Analysis/blob/main/Yearly%20Sales%20Trend.png)

### Monthly Sales Trends
We analysed the total number of luxury watches sold each month from **January 2018 to January 2024**.

* **Seasonal trends observed** with higher sales in **August-December**
* **February consistently shows the lowest sales**, likely due to fewer days.
* **Strongest months:** August & December (potentially due to holiday shopping, or EOFY).

| Year-Month | Total Sales (units) |
|------------|------------|
| 2023-02    | 2035       |
| 2023-03    | 2327       |
| 2023-04    | 2206       |
| 2023-05    | 2315       |
| 2023-06    | 2232       |
| 2023-07    | 2270       |
| 2023-08    | 2274       |
| 2023-09    | 2194       |
| 2023-10    | 2283       |
| 2023-11    | 2220       |
| 2023-12    | 2292       |
| 2024-01    | 2263       |

![Monthly Seasonality Trend](https://github.com/SinaS24/Luxury-Watch-Analysis/blob/main/Monthly%20Seasonality%20Trend.png)

## Regional Sales Trends & Patterns

### Total Sales by Country 
We analysed total sales by country to identify key luxury watch markets.

* **USA & Australia dominate sales**, accounting for 50%+ of the dataset.
* **China ranks 3rd**, but with significantly fewer sales than the top two.
* **Europe has multiple mid-tier markets** (Italy, Germany, UK, France, Switzerland).
* **Top 3 countries** make up ~70% of total sales.

| Country       | Total Sales (units) |
|--------------|------------|
| USA          | 40,952     |
| Australia    | 40,890     |
| China        | 16,333     |
| Italy        | 8,305      |
| Germany      | 8,264      |
| UK           | 8,261      |
| Japan        | 8,212      |
| France       | 8,189      |
| Switzerland  | 8,147      |
| UAE          | 8,080      |
| Singapore    | 7,974      |


### Regional Sales Performance by City
We analysed total sales by city to understand which global locations drive the most luxury watch sales.

* **Australia has two cities in the top 10 (Brisbane & Sydney)**, reinforcing its position as a major market.
* **San Francisco & New York dominate the USA market**, reflecting strong demand in key metropolitan areas.
* **European capitals (Milan, Berlin, London, Paris) are major players**, likely due to luxury brand influence.
* **Hong Kong & Tokyo lead in Asia**, highlighting strong luxury watch demand in the region.

| Country     | City            | Total Sales (units) |
|------------|----------------|------------|
| Australia  | Brisbane        | 8,317      |
| Italy      | Milan           | 8,305      |
| USA        | San Francisco   | 8,278      |
| Germany    | Berlin          | 8,264      |
| USA        | New York        | 8,262      |
| UK         | London          | 8,261      |
| Australia  | Sydney          | 8,240      |
| China      | Hong Kong       | 8,230      |
| Japan      | Tokyo           | 8,212      |
| France     | Paris           | 8,189      |


### Top Luxury Watch Brands in Australia
We analysed total sales by brand in Australia to understand consumer demand for different watchmakers.

**Key Insights:**
* **Rolex is the dominant brand**, accounting for **over 60% of total sales**.
* **Omega ranks second**, but with significantly fewer sales than Rolex.
* **Audemars Piguet & Patek Philippe cater to the high-end segment**, showing demand for ultra-luxury.
* **TAG Heuer, Cartier, and Seiko hold a solid mid-range presence**, indicating Australia’s watch buyers have a diverse range of preferences.

| Brand              | Total Sales (units) |
|--------------------|------------|
| Rolex             | 18,618     |
| Omega             | 3,085      |
| Audemars Piguet   | 2,026      |
| Patek Philippe    | 1,689      |
| Breitling         | 1,506      |
| Tudor             | 1,098      |
| Hublot            | 995        |
| TAG Heuer         | 957        |
| Cartier           | 956        |
| Seiko             | 901        |

![Top Selling Brands in Australia](https://github.com/SinaS24/Luxury-Watch-Analysis/blob/main/Top%2010%20Selling%20brands%20in%20Aus.png)

### Top 3 Selling Brands by Country
We analysed the top-selling luxury watch brands per country to understand global brand dominance.

**Key Insights:**
* **Rolex is the #1 brand in every country**, reinforcing its market leadership.
* **Omega consistently ranks #2**, showing strong demand across all regions.
* **Audemars Piguet is the 3rd best-selling brand**, representing the high-end segment.
* **USA & Australia have the highest total sales across all three brands**.

| Country       | #1 Brand  | Sales (units)  | #2 Brand  | Sales (units)  | #3 Brand         | Sales (units) |
|--------------|----------|--------|----------|--------|----------------|--------|
| Australia    | Rolex    | 18,618 | Omega    | 3,085  | Audemars Piguet | 2,026  |
| USA          | Rolex    | 18,577 | Omega    | 3,095  | Audemars Piguet | 1,992  |
| China        | Rolex    | 7,352  | Omega    | 1,187  | Audemars Piguet | 810    |
| Italy        | Rolex    | 3,845  | Omega    | 624    | Audemars Piguet | 421    |
| Japan        | Rolex    | 3,805  | Omega    | 641    | Audemars Piguet | 384    |
| Germany      | Rolex    | 3,763  | Omega    | 601    | Audemars Piguet | 410    |
| Switzerland  | Rolex    | 3,762  | Omega    | 617    | Audemars Piguet | 342    |
| UK           | Rolex    | 3,708  | Omega    | 609    | Audemars Piguet | 395    |
| UAE          | Rolex    | 3,687  | Omega    | 568    | Audemars Piguet | 353    |
| France       | Rolex    | 3,668  | Omega    | 636    | Audemars Piguet | 371    |


## Brand & Price Analysis

### Price Segmentation by Brand
We analysed how pricing varies across the top luxury watch brands.

**Key Insights:**
* **Rolex leads in both total sales & premium pricing**, with a average price of $14,344.
* **Omega is the 2nd best-selling brand but has a lower average price ($4,979.50).**
* **Patek Philippe & Audemars Piguet dominate the ultra-luxury segment**, with average prices above $70,000.
* **Breitling, Tudor, TAG Heuer offer more affordable luxury options**, priced between $3,000-$5,000.
* **Seiko is the most affordable brand in the dataset**, with an average price of $882.

| Brand            | Total Sales (units) | Avg Price (USD) | Min Price (USD) | Max Price (USD)  |
|------------------|------------|------------|------------|------------|
| Rolex           | 74,442      | $14,344.00 | $990       | $946,795   |
| Omega           | 12,260      | $4,979.50  | $250       | $1,760,000 |
| Audemars Piguet | 7,882       | $46,870.50 | $3,690     | $1,238,437 |
| Patek Philippe  | 6,866       | $71,010.00 | $4,950     | $4,118,557 |
| Breitling       | 6,017       | $4,329.00  | $650       | $47,500    |
| Tudor           | 4,326       | $4,233.40  | $885       | $69,990    |
| Cartier         | 3,979       | $7,975.33  | $800       | $138,268   |
| TAG Heuer       | 3,952       | $3,334.71  | $271       | $979,081   |
| Hublot          | 3,845       | $16,021.89 | $973       | $274,138   |
| Seiko           | 3,704       | $882.11    | $53        | $43,114    |


### Price Segmentation by Case Material
We analysed how the choice of case material influences pricing.

**Key Insights:**
* **Platinum is the most expensive case material**, with an average price of $117,271.
* **Gold remains the dominant luxury material**, with rose gold commanding the highest price ($58,066 average).
* **Carbon, Tantalum, and Palladium offer high-end alternatives**, often used in specialty timepieces.
* **Ceramic, Aluminium, and Titanium provide more affordable luxury options**, balancing durability and cost.

| Case Material | Avg Price (USD)  | Min Price (USD) | Max Price (USD)  |
|--------------|------------|------------|------------|
| Platinum     | $117,271.07 | $4,959     | $4,118,557 |
| Rose Gold    | $58,066.57  | $385       | $3,357,325 |
| White Gold   | $50,914.01  | $1,431     | $1,505,497 |
| Carbon       | $50,738.34  | $84        | $850,000   |
| Yellow Gold  | $34,419.75  | $132       | $946,795   |
| Tantalum     | $27,617.68  | $497       | $114,846   |
| Palladium    | $24,799.00  | $7,456     | $62,106    |
| Ceramic      | $17,483.72  | $213       | $1,238,437 |
| Aluminium     | $17,197.17  | $73        | $530,206   |
| Titanium     | $16,290.38  | $110       | $719,365   |


### Price Segmentation by Bracelet Material
We analysed how the choice of bracelet material influences pricing.

**Key Insights:**
* **Platinum bracelets are the most expensive**, with an average price of $123,335.
* **Gold bracelets remain highly valued**, with rose gold leading at $85,001.
* **Ceramic, Reptile-Leather, and Rubber bracelets command high premiums**, used in exclusive designs.
* **Steel offers a more affordable luxury options**, appealing to broader markets.

| Bracelet Material  | Avg Price (USD) | Min Price (USD) | Max Price (USD)  |
|-------------------|------------|------------|------------|
| Platinum         | $123,335.92 | $6,835     | $890,000   |
| Rose Gold        | $85,001.08  | $1,836     | $1,168,091 |
| White Gold       | $65,597.96  | $1,590     | $1,505,497 |
| Ceramic          | $54,333.87  | $449       | $695,000   |
| Yellow Gold      | $41,445.78  | $441       | $946,795   |
| Rubber           | $28,652.11  | $68        | $1,238,437 |
| Reptile-Leather  | $28,624.16  | $104       | $4,118,557 |
| Satin            | $15,703.17  | $340       | $54,913    |
| Steel            | $14,500.90  | $53        | $312,423   |


### Price Segmentation by Watch Complication
We analysed how different movement types (complications) affect watch pricing.

**Key Insights:**
* **Hand-wound watches have the highest average price**, at $22,641.
* **Automatic watches closely follow**, averaging $21,165.
* **Quartz watches are the most affordable**, with an average price of $3,146.
* **The most expensive watches tend to be automatic, with a max price of $4.1M.**
* **Luxury brands favour automatic movements**, whereas quartz is common in entry-level luxury models.

| Complication  | Avg Price (USD) | Min Price (USD) | Max Price (USD)  |
|--------------|------------|------------|------------|
| Hand-Wound   | $22,641.09 | $75        | $1,870,006 |
| Automatic    | $21,165.10 | $53        | $4,118,557 |
| Quartz       | $3,146.84  | $54        | $400,382   |


## Most Popular Watch Features

### The Most Common Case Materials in Luxury Watches
We analysed the most frequently used case materials in luxury watches.

**Key Insights:**
* **Steel is by far the most common material**, with over 105,000 watches.
* **Yellow Gold remain popular**, appearing in nearly 16,000 watches.
* **Titanium & Ceramic are the most common high-tech materials**, offering durability & scratch resistance.
* **Platinum & Carbon are rare but found in ultra-high-end timepieces**.

| Case Material | Total Watches |
|--------------|--------------|
| Steel        | 105,363      |
| Yellow Gold  | 15,911       |
| Rose Gold    | 11,085       |
| White Gold   | 6,984        |
| Titanium     | 5,852        |
| Ceramic      | 4,589        |
| Platinum     | 1,459        |
| Plastic      | 734          |
| Carbon       | 689          |


## The Most Common Bracelet Materials in Luxury Watches
We analysed the most frequently used bracelet materials in luxury watches.

**Key Insights:**
* **Steel is the dominant bracelet material**, used in over 78,000 watches.
* **Yellow Gold is the most common precious metal bracelet**, appearing in 21,790 watches.
* **Leather & Rubber are major alternatives to metal bracelets**, popular in dress & sports watches.
* **Reptile-Leather remains a niche luxury material**, often used in ultra-premium watches.
* **Titanium & Platinum bracelets are rare**, primarily found in high-end & special edition watches.

| Bracelet Material | Total Watches |
|------------------|--------------|
| Steel           | 78,178       |
| Yellow Gold     | 21,790       |
| Leather         | 21,111       |
| Rubber          | 18,409       |
| Reptile-Leather | 11,605       |
| Textile         | 4,219        |
| Rose Gold       | 4,066        |
| White Gold      | 2,868        |
| Titanium        | 1,884        |
| Platinum        | 790          |


### The Most Common Dial Colours in Luxury Watches
We analysed the most frequently used dial colours in luxury watches.

**Key Insights:**
* **Black is the dominant dial colour**, appearing in over 61,000 watches.
* **Blue is the second most common dial choice**, seen in 26,960 watches.
* **Silver, white, and grey dials remain popular for classic luxury watches**.
* **Green dials are growing in popularity**, especially in recent luxury trends.
* **Transparent dials are a niche choice**, often seen in skeleton watches.

| Dial Colour    | Total Watches |
|--------------|--------------|
| Black        | 61,948       |
| Blue         | 26,960       |
| Silver       | 18,685       |
| White        | 17,733       |
| Grey         | 10,218       |
| Green        | 7,066        |
| Brown        | 4,523        |
| Champagne    | 3,978        |
| Gold         | 3,778        |
| Transparent  | 2,736        |


### The Most Common Hour Marking Styles in Luxury Watches
We analysed the most frequently used hour marking styles in luxury watches.

**Key Insights:**
* **"No Markings" is the dominant design choice**, appearing in 115,809 watches.
* **Arabic numerals are the second most common**, used in 32,159 watches.
* **Roman numerals remain a niche choice**, often seen in vintage or heritage-style luxury watches.

| Hour Markings  | Total Watches |
|---------------|--------------|
| No Markings   | 115,809      |
| Arabic        | 32,159       |
| Roman         | 15,629       |

![Watch feature analysis](https://github.com/SinaS24/Luxury-Watch-Analysis/blob/main/Brand%20and%20price%20analysis.png)

# Recommendations
Based on the insights and findings above, recommendations below:

### 1. Leverage Seasonal Sales Trends
- Sales peak between **August and December**. It's recommended to ensure the company **increases marketing efforts and inventory** leading up to these peak months.
- Consider **limited-edition and products releases** during high-sales periods.

### 2. Regional Market Expansion
- The **USA and Australia** have the highest luxury watch sales, however, **China and Japan** represent strong emerging markets with high demand for premium brands like Rolex and Omega.
- This represents a potential opportunity in the market and it might be worth **tailoring marketing, and distribution strategies** for these key regions.

### 3. Focus on High-Margin Materials
- **Platinum, Rose Gold, and White Gold watches** have the highest average prices.
- There is opportunity to **increase profit margins** by emphasising these materials in high-end collections.
- **Carbon and Ceramic** watches also show strong pricing potential and should be marketed for **modern, innovative buyers**.

### 5. Strategic Product Development
- **Black, Blue, and Silver dials** are the most popular and should be prioritized in mainstream collections.
- **Minimalist watch designs (No Hour Markings) dominate the market**, indicating a strong preference for clean aesthetics.
- **Automatic watches sell at a premium compared to Quartz watches**, reinforcing the importance of **high-quality craftsmanship**.



# Assumptions & Caveats
Throughout the analysis, there were several assumptions made along with some data limitations. These should be considered when interpreting the insights:

### Each row represents an individual sale.
### Purchase Dates Are Simulated.
- The dataset **did not include actual purchase dates**, so we generated **realistic timestamps** based on market trends.

### Locations Were Generated.
- The dataset **did not include real-world purchase locations**, so we added **realistic country and city assignments**.

### Price Data Variability.
- Price values were analysed as provided in the dataset, but we assume **pricing reflects actual market conditions**.

### Brand Representation in Dataset.
- The dataset is not **fully representative** of the entire luxury watch industry.
