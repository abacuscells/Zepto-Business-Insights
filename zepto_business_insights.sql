DROP TABLE IF EXISTS zepto;

CREATE TABLE zepto(
sku_id serial PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOL,
quantity INTEGER
)

--DATA EXPLORATION

SELECT * FROM zepto LIMIT 10;

SELECT COUNT(*) FROM zepto;

--CHECK NULL VALUES
SELECT * FROM zepto
WHERE 
name IS NULL
OR 
category IS NULL
OR 
mrp IS NULL
OR 
discountPercent IS NULL
OR
availableQuantity IS NULL
OR 
discountedSellingPrice IS NULL
OR 
weightInGms IS NULL
OR 
outOfStock IS NULL
OR 
quantity IS NULL;

--different product categories
SELECT DISTINCT category 
FROM zepto;
--14 unique categories found

--product out of stock and in stock
SELECT outofstock, count(*)
FROM zepto 
GROUP BY outofstock;
-- 3279 false and 453 true (bool output of the column outofstock)

--Number of SKU's of the each product
SELECT name, count(sku_id) AS "No. of SKUs"
FROM zepto
GROUP BY name
ORDER BY count(sku_id) DESC;

--DATA CLEANING 

--products with 0 price
SELECT * FROM zepto
WHERE mrp = 0 OR discountedsellingprice = 0;
--454 found

DELETE FROM zepto
WHERE mrp = 0 or discountedsellingprice = 0;

--convert price from paise to rupees
UPDATE zepto
set mrp = mrp/100.0,
discountedsellingprice = discountedsellingprice/100.0;

SELECT mrp, discountedsellingprice from zepto;

--Business Questions

-- Q1. Find the top 10 best-value products based on the discount percentage.
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;

--Q2.What are the Products with High MRP and are Out of Stock also.
SELECT DISTINCT name, mrp
FROM zepto
WHERE outOfStock = TRUE and mrp > 300
ORDER BY mrp DESC;

--Q3.Calculate Estimated Revenue for each category
SELECT category,
SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue DESC;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
SELECT name, category, discountpercent, mrp
FROM zepto
WHERE mrp > 500 AND discountpercent < 10
ORDER BY discountpercent DESC, mrp DESC;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
SELECT category, 
AVG(discountpercent) AS avg_discountpercent
FROM zepto
GROUP BY category
ORDER BY avg_discountpercent DESC
LIMIT 5;

-- Q6. Find the price per gram for products equal and above 100g and sort by best value.
SELECT DISTINCT name, weightingms, discountedsellingprice,
ROUND(discountedsellingprice/weightingms, 2) AS price_per_gram
from zepto
WHERE weightingms >= 100
ORDER BY price_per_gram DESC;

--Q7.Group the products into categories like Low, Medium, Bulk Based on their wights.
SELECT DISTINCT name, weightingms,
CASE 
	WHEN weightingms < 1000 THEN 'LOW'
	WHEN weightingms < 5000 THEN 'MEDIUM'
	ELSE 'BULK'
	END AS weight_category
FROM zepto;

--Q8.What is the Total Inventory Weight Per Category 
SELECT category,
SUM(weightingms * availablequantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight DESC;

-- Q9. Identify top 3 highest priced products within each category using Window Functions
WITH RankedProducts AS (
    SELECT 
        category,
        name,
        discountedSellingPrice,
        DENSE_RANK() OVER (PARTITION BY category ORDER BY discountedSellingPrice DESC) AS price_rank
    FROM zepto
)
SELECT category, name, discountedSellingPrice, price_rank
FROM RankedProducts
WHERE price_rank <= 3;

-- Q10. Estimated lost revenue value of currently out-of-stock items
SELECT 
    category,
    COUNT(sku_id) AS out_of_stock_skus,
    ROUND(SUM(discountedSellingPrice * quantity), 2) AS estimated_lost_stock_value
FROM zepto
WHERE outOfStock = TRUE
GROUP BY category
ORDER BY estimated_lost_stock_value DESC;
