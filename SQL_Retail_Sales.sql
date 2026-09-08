SHOW DATABASES ;

CREATE DATABASE Retail_Sales ;

USE Retail_Sales ;


-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- 1. Total sales amount per region for the last quarter. 

SELECT
    Region ,
    SUM(TotalAmount) AS Total_Sales
FROM retail_transactions_db
WHERE YEAR(Date) = YEAR((SELECT MAX(Date) FROM retail_transactions_db))
  AND QUARTER(Date) = QUARTER((SELECT MAX(Date) FROM retail_transactions_db))
GROUP BY Region
ORDER BY Total_Sales DESC ;


-- OUTPUT 

-- ┌────────┬──────────────┐
-- │ Region │ Total Sales  │
-- ├────────┼──────────────┤
-- │ East   │ ₹43,511,403  │
-- │ South  │ ₹39,301,648  │
-- │ North  │ ₹35,550,032  │
-- │ West   │ ₹34,753,094  │
-- └────────┴──────────────┘


-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- 2. Top 5 best-selling products (by revenue).

SELECT
    ProductName,
    SUM(TotalAmount) AS Revenue
FROM retail_transactions_db
GROUP BY ProductName
ORDER BY Revenue DESC
LIMIT 5 ;


-- OUTPUT 

-- ┌──────┬─────────────┬───────────────┐
-- │ Rank │ Product     │ Revenue       │
-- ├──────┼─────────────┼───────────────┤
-- │ 1    │ Laptop      │ ₹154,466,439  │
-- │ 2    │ Camera      │ ₹111,110,388  │
-- │ 3    │ Smartphone  │ ₹82,237,300   │
-- │ 4    │ Tablet      │ ₹59,389,860   │
-- │ 5    │ Monitor     │ ₹41,989,142   │
-- └──────┴─────────────┴───────────────┘


-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- 3. Monthly sales trend across all regions.

SELECT
    YEAR(Date) AS Sales_Year ,
    MONTH(Date) AS Sales_Month_Number ,
    DATE_FORMAT(Date, '%Y-%m') AS Sales_Month ,
    SUM(TotalAmount) AS Total_Sales
FROM retail_transactions_db
GROUP BY
    YEAR(Date),
    MONTH(Date),
    DATE_FORMAT(Date, '%Y-%m')
ORDER BY
    Sales_Year ,
    Sales_Month_Number ;


-- OUTPUT 

-- ┌──────┬──────┬─────────┬─────────────┐
-- │ Year │ Month│ Month   │ Total Sales │
-- ├──────┼──────┼─────────┼─────────────┤
-- │ 2025 │ 1    │ 2025-01 │ ₹53,217,621 │
-- │ 2025 │ 2    │ 2025-02 │ ₹45,770,847 │
-- │ 2025 │ 3    │ 2025-03 │ ₹52,517,461 │
-- │ 2025 │ 4    │ 2025-04 │ ₹49,905,954 │
-- │ 2025 │ 5    │ 2025-05 │ ₹53,662,691 │
-- │ 2025 │ 6    │ 2025-06 │ ₹51,983,917 │
-- │ 2025 │ 7    │ 2025-07 │ ₹48,231,893 │
-- │ 2025 │ 8    │ 2025-08 │ ₹51,126,057 │
-- │ 2025 │ 9    │ 2025-09 │ ₹48,838,398 │
-- │ 2025 │ 10   │ 2025-10 │ ₹49,912,897 │
-- │ 2025 │ 11   │ 2025-11 │ ₹52,192,856 │
-- │ 2025 │ 12   │ 2025-12 │ ₹51,010,424 │
-- └──────┴──────┴─────────┴─────────────┘


-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- 4. Region-wise contribution to total sales (as a %).

SELECT
    Region,
    SUM(TotalAmount) AS Region_Sales,
    ROUND(
        SUM(TotalAmount) * 100.0 /
        (SELECT SUM(TotalAmount)
         FROM retail_transactions_db),
        2
    ) AS Contribution_Percentage
FROM retail_transactions_db
GROUP BY Region
ORDER BY Contribution_Percentage DESC ;


-- OUTPUT 

-- ┌────────┬─────────────┬──────────────────┐
-- │ Region │ Region Sales│ Contribution (%) │
-- ├────────┼─────────────┼──────────────────┤
-- │ South  │ ₹157,164,405│ 25.83%           │
-- │ West   │ ₹156,959,817│ 25.80%           │
-- │ East   │ ₹148,974,841│ 24.49%           │
-- │ North  │ ₹145,271,953│ 23.88%           │
-- └────────┴─────────────┴──────────────────┘


-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- 5. Compare Online vs Offline sales across all months.

SELECT
    YEAR(Date) AS Sales_Year,
    MONTH(Date) AS Sales_Month_Number,
    DATE_FORMAT(Date, '%Y-%m') AS Sales_Month,
    SalesChannel,
    SUM(TotalAmount) AS Total_Sales
FROM retail_transactions_db
GROUP BY
    YEAR(Date),
    MONTH(Date),
    DATE_FORMAT(Date, '%Y-%m'),
    SalesChannel
ORDER BY
    Sales_Year,
    Sales_Month_Number,
    SalesChannel ;


-- OUTPUT 

-- ┌────────────┬────────────────────┬─────────────┬──────────────┬──────────────┐
-- │ Sales_Year │ Sales_Month_Number │ Sales_Month │ SalesChannel │ Total_Sales  │
-- ├────────────┼────────────────────┼─────────────┼──────────────┼──────────────┤
-- │ 2025       │ 1                  │ 2025-01     │ Offline      │ 18,721,697   │
-- │ 2025       │ 1                  │ 2025-01     │ Online       │ 34,495,924   │
-- │ 2025       │ 2                  │ 2025-02     │ Offline      │ 19,286,802   │
-- │ 2025       │ 2                  │ 2025-02     │ Online       │ 26,484,045   │
-- │ 2025       │ 3                  │ 2025-03     │ Offline      │ 20,526,016   │
-- │ 2025       │ 3                  │ 2025-03     │ Online       │ 31,991,445   │
-- │ 2025       │ 4                  │ 2025-04     │ Offline      │ 22,431,516   │
-- │ 2025       │ 4                  │ 2025-04     │ Online       │ 27,474,438   │
-- │ 2025       │ 5                  │ 2025-05     │ Offline      │ 23,878,272   │
-- │ 2025       │ 5                  │ 2025-05     │ Online       │ 29,784,419   │
-- │ 2025       │ 6                  │ 2025-06     │ Offline      │ 21,156,209   │
-- │ 2025       │ 6                  │ 2025-06     │ Online       │ 30,827,708   │
-- │ 2025       │ 7                  │ 2025-07     │ Offline      │ 20,658,079   │
-- │ 2025       │ 7                  │ 2025-07     │ Online       │ 27,573,814   │
-- │ 2025       │ 8                  │ 2025-08     │ Offline      │ 19,805,919   │
-- │ 2025       │ 8                  │ 2025-08     │ Online       │ 31,320,138   │
-- │ 2025       │ 9                  │ 2025-09     │ Offline      │ 17,071,065   │
-- │ 2025       │ 9                  │ 2025-09     │ Online       │ 31,767,333   │
-- │ 2025       │ 10                 │ 2025-10     │ Offline      │ 21,527,467   │
-- │ 2025       │ 10                 │ 2025-10     │ Online       │ 28,385,430   │
-- │ 2025       │ 11                 │ 2025-11     │ Offline      │ 21,048,345   │
-- │ 2025       │ 11                 │ 2025-11     │ Online       │ 31,144,511   │
-- │ 2025       │ 12                 │ 2025-12     │ Offline      │ 21,081,201   │
-- │ 2025       │ 12                 │ 2025-12     │ Online       │ 29,929,223   │
-- └────────────┴────────────────────┴─────────────┴──────────────┴──────────────┘


-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- 6. Sales trend by Category – Which categories are rising/falling ?

WITH CategoryMonthlySales AS (
    SELECT
        YEAR(Date) AS Sales_Year,
        MONTH(Date) AS Sales_Month_Number,
        DATE_FORMAT(Date, '%Y-%m') AS Sales_Month,
        Category,
        SUM(TotalAmount) AS Monthly_Sales
    FROM retail_transactions_db
    GROUP BY
        YEAR(Date),
        MONTH(Date),
        DATE_FORMAT(Date, '%Y-%m'),
        Category
),

CategoryTrend AS (
    SELECT
        Sales_Year,
        Sales_Month_Number,
        Sales_Month,
        Category,
        Monthly_Sales,
        LAG(Monthly_Sales) OVER (
            PARTITION BY Category
            ORDER BY Sales_Year, Sales_Month_Number
        ) AS Previous_Month_Sales
    FROM CategoryMonthlySales
)

SELECT
    Sales_Month ,
    Category ,
    Monthly_Sales ,
    Previous_Month_Sales ,

    ROUND(
        (Monthly_Sales - Previous_Month_Sales)
        * 100.0 /
        NULLIF(Previous_Month_Sales, 0) ,
        2
    ) AS MoM_Change_Percentage ,

    CASE
        WHEN Previous_Month_Sales IS NULL
            THEN 'No Previous Month'
        WHEN Monthly_Sales > Previous_Month_Sales
            THEN 'Rising'
        WHEN Monthly_Sales < Previous_Month_Sales
            THEN 'Falling'
        ELSE 'Stable'
    END AS Trend

FROM CategoryTrend
ORDER BY
    Sales_Year,
    Sales_Month_Number,
    Category ;


-- OUTPUT 

-- ┌─────────────┬─────────────┬───────────────┬──────────────────────┬────────────────────────┬───────────────────┐
-- │ Sales_Month │ Category    │ Monthly_Sales │ Previous_Month_Sales │ MoM_Change_Percentage  │ Trend             │
-- ├─────────────┼─────────────┼───────────────┼──────────────────────┼────────────────────────┼───────────────────┤
-- │ 2025-01     │ Accessories │ 6,144,441     │ Null                 │ Null                   │ No Previous Month │
-- │ 2025-01     │ Electronics │ 42,823,773    │ Null                 │ Null                   │ No Previous Month │
-- │ 2025-01     │ Furniture   │ 3,365,611     │ Null                 │ Null                   │ No Previous Month │
-- │ 2025-01     │ Networking  │ 883,796       │ Null                 │ Null                   │ No Previous Month │
-- │ 2025-02     │ Accessories │ 6,613,371     │ 6,144,441            │ 7.63                   │ Rising            │
-- │ 2025-02     │ Electronics │ 35,445,233    │ 42,823,773           │ -17.23                 │ Falling           │
-- │ 2025-02     │ Furniture   │ 2,885,914     │ 3,365,611            │ -14.25                 │ Falling           │
-- │ 2025-02     │ Networking  │ 826,329       │ 883,796              │ -6.50                  │ Falling           │
-- │ 2025-03     │ Accessories │ 6,443,706     │ 6,613,371            │ -2.57                  │ Falling           │
-- │ 2025-03     │ Electronics │ 42,060,685    │ 35,445,233           │ 18.66                  │ Rising            │
-- │ 2025-03     │ Furniture   │ 3,289,862     │ 2,885,914            │ 14.00                  │ Rising            │
-- │ 2025-03     │ Networking  │ 723,208       │ 826,329              │ -12.48                 │ Falling           │
-- │ 2025-04     │ Accessories │ 6,602,270     │ 6,443,706            │ 2.46                   │ Rising            │
-- │ 2025-04     │ Electronics │ 39,126,521    │ 42,060,685           │ -6.98                  │ Falling           │
-- │ 2025-04     │ Furniture   │ 3,404,615     │ 3,289,862            │ 3.49                   │ Rising            │
-- │ 2025-04     │ Networking  │ 772,548       │ 723,208              │ 6.82                   │ Rising            │
-- │ 2025-05     │ Accessories │ 6,767,489     │ 6,602,270            │ 2.50                   │ Rising            │
-- │ 2025-05     │ Electronics │ 43,182,551    │ 39,126,521           │ 10.37                  │ Rising            │
-- │ 2025-05     │ Furniture   │ 2,852,265     │ 3,404,615            │ -16.22                 │ Falling           │
-- │ 2025-05     │ Networking  │ 860,386       │ 772,548              │ 11.37                  │ Rising            │
-- │ 2025-06     │ Accessories │ 6,534,127     │ 6,767,489            │ -3.45                  │ Falling           │
-- │ 2025-06     │ Electronics │ 41,744,099    │ 43,182,551           │ -3.33                  │ Falling           │
-- │ 2025-06     │ Furniture   │ 3,042,986     │ 2,852,265            │ 6.69                   │ Rising            │
-- │ 2025-06     │ Networking  │ 662,705       │ 860,386              │ -22.98                 │ Falling           │
-- │ 2025-07     │ Accessories │ 6,827,593     │ 6,534,127            │ 4.49                   │ Rising            │
-- │ 2025-07     │ Electronics │ 37,557,712    │ 41,744,099           │ -10.03                 │ Falling           │
-- │ 2025-07     │ Furniture   │ 3,097,380     │ 3,042,986            │ 1.79                   │ Rising            │
-- │ 2025-07     │ Networking  │ 749,208       │ 662,705              │ 13.05                  │ Rising            │
-- │ 2025-08     │ Accessories │ 6,074,431     │ 6,827,593            │ -11.03                 │ Falling           │
-- │ 2025-08     │ Electronics │ 41,402,640    │ 37,557,712           │ 10.24                  │ Rising            │
-- │ 2025-08     │ Furniture   │ 2,845,484     │ 3,097,380            │ -8.13                  │ Falling           │
-- │ 2025-08     │ Networking  │ 803,502       │ 749,208              │ 7.25                   │ Rising            │
-- │ 2025-09     │ Accessories │ 6,704,918     │ 6,074,431            │ 10.38                  │ Rising            │
-- │ 2025-09     │ Electronics │ 39,159,209    │ 41,402,640           │ -5.42                  │ Falling           │
-- │ 2025-09     │ Furniture   │ 2,224,496     │ 2,845,484            │ -21.82                 │ Falling           │
-- │ 2025-09     │ Networking  │ 749,775       │ 803,502              │ -6.69                  │ Falling           │
-- │ 2025-10     │ Accessories │ 6,588,191     │ 6,704,918            │ -1.74                  │ Falling           │
-- │ 2025-10     │ Electronics │ 39,845,507    │ 39,159,209           │ 1.75                   │ Rising            │
-- │ 2025-10     │ Furniture   │ 2,701,149     │ 2,224,496            │ 21.43                  │ Rising            │
-- │ 2025-10     │ Networking  │ 778,050       │ 749,775              │ 3.77                   │ Rising            │
-- │ 2025-11     │ Accessories │ 6,615,493     │ 6,588,191            │ 0.41                   │ Rising            │
-- │ 2025-11     │ Electronics │ 41,987,155    │ 39,845,507           │ 5.37                   │ Rising            │
-- │ 2025-11     │ Furniture   │ 2,839,027     │ 2,701,149            │ 5.10                   │ Rising            │
-- │ 2025-11     │ Networking  │ 751,181       │ 778,050              │ -3.45                  │ Falling           │
-- │ 2025-12     │ Accessories │ 6,536,537     │ 6,615,493            │ -1.19                  │ Falling           │
-- │ 2025-12     │ Electronics │ 40,359,337    │ 41,987,155           │ -3.88                  │ Falling           │
-- │ 2025-12     │ Furniture   │ 3,070,068     │ 2,839,027            │ 8.14                   │ Rising            │
-- │ 2025-12     │ Networking  │ 1,044,482     │ 751,181              │ 39.05                  │ Rising            │
-- └─────────────┴─────────────┴───────────────┴──────────────────────┴────────────────────────┴───────────────────┘


-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- 7. List customers who purchased more than 10 times.

SELECT
    CustomerID,
    COUNT(TransactionID) AS Purchase_Count
FROM retail_transactions_db
GROUP BY CustomerID
HAVING COUNT(TransactionID) > 10
ORDER BY Purchase_Count DESC ;


-- OUTPUT 

-- ┌────────────┬───────────────┐
-- │ CustomerID │ Purchase_Count│
-- ├────────────┼───────────────┤
-- │ C00765     │ 11            │
-- │ C02233     │ 11            │
-- │ C01825     │ 11            │
-- │ C01062     │ 11            │
-- │ C02274     │ 11            │
-- └────────────┴───────────────┘


-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------