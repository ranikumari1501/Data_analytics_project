# Power BI Dashboard Guide (beginner)

## 1. Load the data
1. Open Power BI Desktop.
2. Select **Get data > Text/CSV**.
3. Select `cleaned_retail_sales.csv` (or `retail_sales.csv` if you have not run Python yet).
4. Click **Load**. If prompted, choose **Transform Data** to check column types.

## 2. Check data types
- `OrderDate`: Date
- `Quantity`: Whole number
- `UnitPrice`, `Revenue`, `Cost`, `Profit`, `DiscountPct`: Decimal number
- Remaining columns: Text

## 3. Create measures
In Power BI, select **Modeling > New measure** and create these measures one by one:

Total Revenue = SUM(retail_sales[Revenue])

Total Profit = SUM(retail_sales[Profit])

Total Orders = DISTINCTCOUNT(retail_sales[OrderID])

Units Sold = SUM(retail_sales[Quantity])

Profit Margin % = DIVIDE([Total Profit], [Total Revenue], 0)

If you imported `cleaned_retail_sales.csv`, the table name may be `cleaned_retail_sales`; replace `retail_sales` in the measures with your actual table name.

## 4. Build the report page
- **Card visuals:** Total Revenue, Total Profit, Total Orders, Units Sold.
- **Line chart:** Axis = OrderDate (use Month if you prefer); Values = Total Revenue.
- **Bar chart:** Axis = Category; Values = Total Revenue.
- **Bar chart:** Axis = City; Values = Total Revenue.
- **Donut chart:** Legend = SalesChannel; Values = Total Revenue.
- **Table:** ProductName, Quantity, Revenue, Profit.
- **Slicers:** OrderDate, Category, City, SalesChannel.

## 5. Layout suggestion
Put four KPI cards across the top. Put monthly revenue on the left, category and city charts below, and channel comparison plus product table on the right. Add a clear title: **Retail Sales Performance Dashboard | 2025**.

## 6. Questions the dashboard should answer
- Which category generated the highest revenue?
- Which month had the highest revenue?
- Which city generated the most revenue?
- How do Online and Store sales compare?
- Which products have the highest total profit?

## 7. Before presenting
- Click every slicer and check that visuals change.
- Use a consistent number format for currency.
- Add a note that this is sample/synthetic data.
- Do not claim business results are real; explain this is a portfolio project using sample data.
