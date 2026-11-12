
import pandas as pd
import matplotlib.pyplot as plt
from pathlib import Path

file_path = Path(__file__).with_name("retail_sales.csv")
df = pd.read_csv(file_path)

print("First 5 rows:")
print(df.head())
print("\nDataset shape (rows, columns):", df.shape)
print("\nMissing values per column:")
print(df.isna().sum())

# Clean the data: remove exact duplicate rows and convert dates
df = df.drop_duplicates()
df["OrderDate"] = pd.to_datetime(df["OrderDate"], errors="coerce")
df["Revenue"] = pd.to_numeric(df["Revenue"], errors="coerce")
df["Profit"] = pd.to_numeric(df["Profit"], errors="coerce")
df = df.dropna(subset=["OrderDate", "Revenue", "Profit"])

# Create a month column for monthly analysis
df["Month"] = df["OrderDate"].dt.to_period("M").astype(str)

print("\nKey business metrics:")
print("Total revenue:", round(df["Revenue"].sum(), 2))
print("Total profit:", round(df["Profit"].sum(), 2))
print("Total orders:", df["OrderID"].nunique())
print("Total units sold:", int(df["Quantity"].sum()))

category_sales = df.groupby("Category", as_index=False)["Revenue"].sum()
category_sales = category_sales.sort_values("Revenue", ascending=False)
print("\nRevenue by category:")
print(category_sales.to_string(index=False))

monthly_sales = df.groupby("Month", as_index=False)["Revenue"].sum()
print("\nMonthly revenue:")
print(monthly_sales.to_string(index=False))

# Save cleaned data for Power BI
clean_path = Path(__file__).with_name("cleaned_retail_sales.csv")
df.to_csv(clean_path, index=False)
print(f"\nCleaned data saved to: {clean_path.name}")

# Save a simple chart
plt.figure(figsize=(10, 5))
plt.bar(category_sales["Category"], category_sales["Revenue"])
plt.title("Revenue by Product Category")
plt.xlabel("Category")
plt.ylabel("Revenue")
plt.xticks(rotation=25, ha="right")
plt.tight_layout()
chart_path = Path(__file__).with_name("revenue_by_category.png")
plt.savefig(chart_path, dpi=150)
print(f"Chart saved to: {chart_path.name}")
