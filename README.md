# Zepto Business Insights

> A comprehensive inventory and business analytics project analyzing Zepto's product catalog, pricing strategies, and revenue patterns.

## 📋 Overview

This project provides deep analytical insights into Zepto's inventory management and business operations through SQL-based data exploration and analysis. It examines product categories, pricing strategies, discount patterns, inventory levels, and revenue generation across 3,700+ SKUs.

## 🎯 Objectives

- **Inventory Analysis**: Understand stock levels, out-of-stock patterns, and product availability
- **Pricing Intelligence**: Analyze MRP, discounts, and pricing strategies across categories
- **Revenue Insights**: Calculate and forecast revenue by category and product
- **Value Assessment**: Identify best-value products and pricing inefficiencies
- **Inventory Optimization**: Evaluate inventory weight distribution and management

## 📊 Dataset

### Source
- **File**: `Dataset/zepto_utf-8.csv`
- **Records**: 3,732 products
- **Categories**: 14 distinct product categories

### Data Structure

| Column | Type | Description |
|--------|------|-------------|
| `sku_id` | Integer (PK) | Unique product identifier |
| `category` | VARCHAR(120) | Product category (e.g., Fruits & Vegetables) |
| `name` | VARCHAR(150) | Product name |
| `mrp` | Numeric(8,2) | Maximum Retail Price |
| `discountPercent` | Numeric(5,2) | Discount percentage applied |
| `availableQuantity` | Integer | Current stock quantity |
| `discountedSellingPrice` | Numeric(8,2) | Final selling price after discount |
| `weightInGms` | Integer | Product weight in grams |
| `outOfStock` | Boolean | Stock availability status |
| `quantity` | Integer | Product quantity per unit |

## 🔍 Key Analyses

The project includes 8 comprehensive business questions answered through SQL queries:

1. **Top Value Products** - Best-value products ranked by discount percentage
2. **Premium Out-of-Stock Items** - High-value products currently unavailable (MRP > ₹300)
3. **Revenue by Category** - Estimated revenue calculation per product category
4. **Premium Products Analysis** - High-value items (MRP > ₹500) with minimal discounts
5. **Discount Leaders** - Top 5 categories offering highest average discounts
6. **Price Per Gram Analysis** - Value assessment for products ≥100g
7. **Weight Categorization** - Product classification (Low/Medium/Bulk) based on weight
8. **Inventory Weight Distribution** - Total inventory weight per category

## 🗂️ Project Structure

```
zepto_inventory_analysis/
├── README.md                          # Project documentation
├── Dataset/
│   └── zepto_utf-8.csv               # Product inventory data
├── zepto_business_insights.sql       # SQL analysis queries
└── .gitignore                        # Git ignore rules
```

## 🛠️ Technology Stack

- **SQL**: Data exploration and analysis
- **Python**: Data processing (Jupyter Notebook)
- **CSV**: Data storage format
- **Git**: Version control

## 📈 Key Findings Preview

### Data Quality
- **Total Products**: 3,732 after cleaning
- **Products Removed**: 454 (zero pricing)
- **In Stock**: 3,279 | **Out of Stock**: 453

### Categories
- **14 unique product categories** covering diverse offerings
- Ranging from Fruits & Vegetables to specialty items

## 🚀 Getting Started

### Prerequisites
- SQL database (PostgreSQL, MySQL, or SQLite)
- Python 3.7+ (for notebook analysis)
- PowerBi

## 📋 Data Cleaning Process

The analysis includes comprehensive data cleaning:

- ✅ Null value detection and validation
- ✅ Price normalization (conversion from paise to rupees)
- ✅ Removal of invalid products (zero pricing)
- ✅ Duplicate product handling

## 💡 Business Insights

### Discount Strategy
- Products with discounts exceed 15% in premium categories
- Out-of-stock items often have high MRP (premium products)

### Pricing Tiers
- Products range from budget to premium segments
- Weight-based pricing shows clear value patterns

### Inventory Management
- Bulk categories dominate inventory weight
- Selective discounting on high-value items

## 📁 File Descriptions

### `zepto_business_insights.sql`
- Table schema creation
- Data exploration queries
- Data cleaning operations
- 8 business analysis queries
- 133 lines of well-documented SQL

### `Dataset/zepto_utf-8.csv`
- Raw inventory data
- UTF-8 encoded for international characters
- 3,733 lines (including header)

## 🔗 Key Metrics

| Metric | Value |
|--------|-------|
| Total SKUs | 3,732 |
| Product Categories | 14 |
| Stock Status | 3,279 Available / 453 Out-of-Stock |
| Data Quality | 99.7% (after cleaning) |

## 🎓 Learning Outcomes

This project demonstrates:
- Advanced SQL query writing and data aggregation
- Data cleaning and validation best practices
- Business intelligence and analytics techniques
- Revenue and inventory analysis methodologies
- Data-driven decision making

## 📝 Notes

- All monetary values converted from paise to Indian Rupees (₹) during data cleaning.
- Weight measured in grams (gms)
- Discount percentages are applied uniformly across variants
- Analysis based on snapshot data (point-in-time inventory)

## 👤 Author

- **Deepak Kumar**
- **GitHub**: [@abacuscells](https://github.com/abacuscells)


