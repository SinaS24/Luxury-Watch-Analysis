# Project Background
Luxury watches represent a unique segment of the global luxury goods industry, characterised by high-end craftsmanship, brand heritage, and exclusivity. The industry is dominated by Swiss watchmakers such as Rolex, Patek Philippe, Audemars Piguet, and Omega, along with high-fashion brands like Cartier. The data set supplies sales for over 160,000 watches. 
This project analyses the dataset in order to uncover insights that will guide decision makers in marketing, product development, and pricing strategy. 

Insights and recommendations are provided on the following key areas:

- **Market Trends & Brand Insights** 
- **Pricing Strategy & Premium Models** 
- **Material & Design Preferences** 
- **Brand Positioning & Competitive Differentiation** 

The SQL queries used to inspect and clean the data for this analysis can be found here [link].

Targed SQL queries regarding various business questions can be found here [link].

An interactive Tableau dashboard used to report and explore sales trends can be found here [link].



# Data Structure & Initial Checks

The database consists of a single table, luxury_watch, which contains structured data about luxury watch transactions. Each row represents an individual sale, including details such as brand, model, material composition, pricing, and purchase information.
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
| **Dial**         | TEXT     | The watch face color (e.g., black, blue, silver). |
| **Hour Markings** | TEXT     | Type of markings on the dial (e.g., Roman numerals, Arabic numerals). |
| **Lunette Material** | TEXT | Material used for the bezel (e.g., ceramic, steel). |
| **Price**        | INTEGER  | The price of the watch in USD. |


## Initial Data Quality Checks

Below are the key findings and improvements made:
•	Added Transaction_ID – Assigned a unique ID to every sale. (The dataset originally lacked a unique transaction identifier. Since the same Reference number appeared in multiple rows, it was determined that for this analysis it would be best if each row represented an individual sale rather than just a unique watch model.)
•	Checked for Missing Values – Identified 1 missing Reference value and removed it.
•	Ensured Price Is Numeric – Verified no non-numeric values exist.
•	Standardised Categorical Values – Fixed inconsistencies in materials and complications.
•	Simulated Purchase Dates & Locations – Added realistic timestamps and regional purchase data.




# Executive Summary

## Overview of Findings

Explain the overarching findings, trends, and themes in 2-3 sentences here. This section should address the question: "If a stakeholder were to take away 3 main insights from your project, what are the most important things they should know?" You can put yourself in the shoes of a specific stakeholder - for example, a marketing manager or finance director - to think creatively about this section.

[Visualization, including a graph of overall trends or snapshot of a dashboard]



# Insights Deep Dive

## Sales Trends & Patterns:

### Yearly Sales Performance
We analysed the total number of luxury watches sold per year from 2018 to 2024. The results indicate stable sales, peaking in 2020 before a decline in 2024.

* **2020 saw the highest sales (27,012 units).**
* **A slight decline from 2021 to 2023, stabilising around ~26,900.**
* **A sharper drop in 2024 suggests external influences (economic factors, demand shifts).** 

| Year | Total Sales |
|------|------------|
| 2018 | 26,717     |
| 2019 | 26,893     |
| 2020 | 27,012     |
| 2021 | 26,859     |
| 2022 | 26,909     |
| 2023 | 26,944     |
| 2024 | 22,863     |


### Monthly Sales Trends
We analysed the total number of luxury watches sold each month from **January 2018 to January 2024**.

* **Seasonal trends observed** with higher sales in **August-December**
* **February consistently shows the lowest sales**, likely due to fewer days.
* **Strongest months:** August & December (higher sales due to potential holiday shopping).
* **2024 data shows a decline in January sales** compared to previous years.

| Year-Month | Total Sales |
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

### Regional Sales Performance
We analysed total sales by country to identify key luxury watch markets.

* **USA & Australia dominate sales**, accounting for 50%+ of the dataset.
* **China ranks 3rd**, but with significantly fewer sales than the top two.
* **Europe has multiple mid-tier markets** (Italy, Germany, UK, France, Switzerland).
* **Top 5 countries** make up ~80% of total sales.

| Country       | Total Sales |
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

| Country     | City            | Total Sales |
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

| Brand              | Total Sales |
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




### Brand Dominance by Country: Rolex's Market Leadership
We analysed total sales by brand in different countries to determine the **top-performing luxury watch brands per region**.

**Key Insights:**
* **Rolex is the #1 brand in every major country**, showing an unmatched global presence.
* **Australia & USA lead Rolex sales**, with over **18,500 sales each**.
* **China ranks 3rd (7,352 sales),** indicating a growing luxury watch market.
* **Europe has steady Rolex demand**, with strong sales in Italy, Germany, Switzerland, UK, and France.
* **The UAE is a key luxury watch hub**, with high Rolex sales.

| Country       | Brand  | Total Sales |
|--------------|--------|------------|
| Australia    | Rolex  | 18,618     |
| USA          | Rolex  | 18,577     |
| China        | Rolex  | 7,352      |
| Italy        | Rolex  | 3,845      |
| Japan        | Rolex  | 3,805      |
| Germany      | Rolex  | 3,763      |
| Switzerland  | Rolex  | 3,762      |
| UK           | Rolex  | 3,708      |
| UAE          | Rolex  | 3,687      |
| France       | Rolex  | 3,668      |

### Top 3 Selling Brands by Country
We analysed the top-selling luxury watch brands per country to understand global brand dominance.

**Key Insights:**
* **Rolex is the #1 brand in every country**, reinforcing its market leadership.
* **Omega consistently ranks #2**, showing strong demand across all regions.
* **Audemars Piguet is the 3rd best-selling brand**, representing the high-end segment.
* **USA & Australia have the highest total sales across all three brands**.

| Country       | #1 Brand  | Sales  | #2 Brand  | Sales  | #3 Brand         | Sales  |
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



### Category 3:

* **Main insight 1.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 2.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.

[Visualization specific to category 3]


### Category 4:

* **Main insight 1.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 2.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.

[Visualization specific to category 4]



# Recommendations:

Based on the insights and findings above, we would recommend the [stakeholder team] to consider the following: 

* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  


# Assumptions and Caveats:

Throughout the analysis, multiple assumptions were made to manage challenges with the data. These assumptions and caveats are noted below:

* Assumption 1 (ex: missing country records were for customers based in the US, and were re-coded to be US citizens)
  
* Assumption 1 (ex: data for December 2021 was missing - this was imputed using a combination of historical trends and December 2020 data)
  
* Assumption 1 (ex: because 3% of the refund date column contained non-sensical dates, these were excluded from the analysis)
