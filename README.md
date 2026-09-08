# 🛒 RETAIL SALES ANALYTICS

<p align="center">

  <strong>📊 Retail Sales Analytics Dashboard</strong>

  <br>

  <em>Turning Retail Transactions into Actionable Business Intelligence</em>

</p>

<p align="center">

  <img src="https://github.com/TusharBagle/PR.-Retail-Sales-Power-BI-/blob/main/Retail%20Sales%20Dashboard.png">
</p>

---

## 🚀 PROJECT SNAPSHOT

> **Retail Sales Analytics** is an end-to-end Business Intelligence project
> designed to transform raw retail transaction data into meaningful,
> interactive and decision-ready insights.

The project combines:

**SQL → Data Analysis → DAX → Power BI → Business Intelligence**

It analyzes sales performance across **regions, products, categories,
sales channels, months and customers**.

---

# 🎯 BUSINESS OBJECTIVE

The primary objective is to answer critical business questions such as:

- 💰 How much revenue is being generated?
- 🌍 Which region performs best?
- 🏆 Which products generate the most revenue?
- 📅 How does sales performance change month by month?
- 💻 Is Online or Offline performing better?
- 📦 Which categories are growing or declining?
- 👥 Which customers purchase most frequently?
- 📈 Where are the biggest opportunities for growth?

---

# 🧩 PROJECT HIGHLIGHTS

| Area | Analysis |
|------|----------|
| 💰 Revenue | Total Sales & AOV |
| 🌍 Geography | Regional Sales |
| 🏆 Products | Top 5 Revenue Products |
| 📅 Time | Monthly Sales Trend |
| 📦 Categories | Category Growth |
| 💻 Channels | Online vs Offline |
| 👥 Customers | Purchase Frequency |
| 📊 BI | Interactive Power BI Dashboard |

---

# 🛠️ TECHNOLOGY STACK

### 📊 Business Intelligence
- Microsoft Power BI
- DAX
- Data Visualization

### 🗄️ Database & Querying
- MySQL
- SQL
- Window Functions
- CTEs
- Aggregations

### 📁 Data
- Retail Transaction Dataset
- CSV / Structured Data

---

# 📈 DASHBOARD KPIs

The dashboard provides an executive-level overview through:

### 💰 TOTAL SALES
Measures the overall revenue generated from retail transactions.

### 🧾 TOTAL TRANSACTIONS
Measures the total number of unique transactions.

### 👥 TOTAL CUSTOMERS
Measures the unique customer base.

### 🛍️ AVERAGE ORDER VALUE
Measures the average revenue generated per transaction.

### 📅 LAST QUARTER SALES
Measures sales generated during the latest quarter available in the dataset.

---

# 📊 DASHBOARD ANALYSIS

## 01 — 🌍 REGIONAL SALES PERFORMANCE

The dashboard compares sales performance across:

- North
- South
- East
- West

### Key Finding

**South** generated the highest overall sales at approximately:

> 💰 **₹157.16M**

West followed closely with:

> 💰 **₹156.96M**

North recorded the lowest regional sales:

> 💰 **₹145.27M**

### 💡 Business Insight

Regional performance is relatively balanced, but South and West represent the strongest markets and can be prioritized for expansion and retention strategies.

---

# 02 — 📅 MONTHLY SALES TREND

Monthly revenue was analyzed across the complete year.

### 🏆 Highest Month

**May**

> 💰 **₹53.66M**

### 📉 Lowest Month

**February**

> 💰 **₹45.77M**

### 💡 Business Insight

Sales remained relatively consistent throughout the year, with moderate fluctuations rather than extreme seasonal variation.

---

# 03 — 🏆 TOP 5 PRODUCTS BY REVENUE

| Rank | Product | Revenue |
|------|---------|---------:|
| 🥇 | Laptop | ₹154.47M |
| 🥈 | Camera | ₹111.11M |
| 🥉 | Smartphone | ₹82.24M |
| 4️⃣ | Tablet | ₹59.39M |
| 5️⃣ | Monitor | ₹41.99M |

### 💡 Key Finding

**Laptop** is the dominant revenue-generating product.

Its revenue of approximately:

> **₹154.47M**

is significantly higher than the other top-performing products.

### 🎯 Recommendation

Maintain strong inventory availability for high-performing products while identifying opportunities to increase sales of lower-performing products.

---

# 04 — 💻 ONLINE vs OFFLINE

One of the strongest findings from the analysis:

> **Online sales were higher than Offline sales in every month.**

### 🏆 Highest Online Sales

**September**

> 💰 **₹31.77M**

### 🏆 Highest Offline Sales

**May**

> 💰 **₹23.88M**

### 💡 Business Insight

The business demonstrates strong customer adoption of the Online sales channel.

### 🎯 Recommendation

Increase investment in:

- Digital marketing
- E-commerce experience
- Online promotions
- Personalized recommendations
- Customer retention campaigns

---

# 05 — 📦 CATEGORY SALES TREND

The analysis covers:

- 🔌 Electronics
- 🎧 Accessories
- 🪑 Furniture
- 🌐 Networking

### 🥇 Strongest Category

**Electronics**

Electronics remained the strongest-performing category throughout the year.

### 📌 Accessories

Accessories remained relatively stable, generally staying around:

> **₹6M – ₹7M per month**

### 📈 Networking

Networking recorded its strongest monthly growth in December:

> 🚀 **+39.05%**

### 📉 Furniture

Furniture experienced a significant decline in September:

> 📉 **-21.82%**

However, it recovered strongly in October:

> 📈 **+21.43%**

---

# 06 — 👥 CUSTOMER PURCHASE FREQUENCY

The analysis identifies customers who made more than 10 purchases.

| Customer | Purchases |
|----------|----------:|
| C00765 | 11 |
| C02233 | 11 |
| C01825 | 11 |
| C01062 | 11 |
| C02274 | 11 |

### 💡 Key Finding

**5 customers** made more than 10 purchases.

Each customer completed:

> 🛍️ **11 purchases**

### 🎯 Recommendation

These customers represent valuable repeat customers and can be targeted through:

- Loyalty programs
- Personalized offers
- Exclusive discounts
- Repeat-purchase incentives
- Customer retention campaigns

---

# 🧮 DAX ANALYTICS

## Total Sales

```DAX
Total Sales =
SUM(retail_transactions_db[TotalAmount])
