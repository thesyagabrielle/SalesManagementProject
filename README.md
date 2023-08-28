# Sales Management Project (SQL & Power BI)

## Business Request 
The business request for this project is an executive sales report for the sales manager.
Based on the request that was made, user stories were defined to fulfil delivery and ensure that the acceptance criteria were maintained throughout the project.
| User Stories | Acceptance Criteria |
| --- | --- |
| As a sales manager, I want to get a dashboard overview of internet sales so that I can follow better which customers and products sell the best | A Power Bi dashboard that updates data once a day |
| As a sales representative, I want a detailed overview of Internet sales so that I can follow up with my customers who buy the most and who can sell more to | A Power BI dashboard that allows me to filter data for each customer |
| As a sales representative, I want an overview of Internet Sales per product so that I can see the products that have the most sales | A Power BI dashboard that allows me to filter data for each Product |
| As a sales manager, I want a dashboard overview of internet sales so that I can track the sales and budget | Power BI dashboard with graphs comparing sales against budget|
<br />

## Dataset
AdventureWorks database is chosen as the dataset. It is a sample database developed by Microsoft.
<br />

## Data Cleansing & Transformation (SQL)
Structured Query Language (SQL) to create a table used for the data model for data analysis to fulfil the business needs defined in the user stories.

Below are the SQL statements for cleansing and transforming the data
**DIM_Calendar** (to extract the date)
```
SELECT [DateKey]
      ,[FullDateAlternateKey] AS Date
      ,[EnglishDayNameOfWeek] as Day
      ,[WeekNumberOfYear] as WeekNum
      ,[EnglishMonthName] as Month
      ,[MonthNumberOfYear] as MonthNum
      ,[CalendarQuarter] as Quarter
      ,[CalendarYear] as Year
  FROM [AdventureWorksDW2022].[dbo].[DimDate]
  WHERE CalendarYear >= 2020
```
**DIM_Customer** (Customer details)
```
SELECT 
  c.CustomerKey, 
  c.FirstName as [First Name], 
  c.LastName as [Last Name], 
  c.FirstName + ' ' + c.LastName AS [Full Name], 
  CASE c.gender WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS Gender, 
  c.DateFirstPurchase as [Date First Purchase], 
  g.city AS [Customer City] 
FROM 
  dbo.DimCustomer AS c 
  LEFT JOIN dbo.DimGeography AS g ON g.GeographyKey = c.GeographyKey 
ORDER BY 
  1 ASC
```
**DIM_Product** (Product details)
```
SELECT 
  p.ProductKey AS [Product Key], 
  p.ProductAlternateKey AS [Product Item Code], 
  p.EnglishProductName AS [Product Name], 
  ps.EnglishProductSubcategoryName AS [ProductSub Category], 
  pc.EnglishProductCategoryName AS [Product Category], 
  p.Color AS [Product Color], 
  p.Size AS [Product Size], 
  p.ProductLine [Product Line], 
  p.ModelName [Product Model Name], 
  p.EnglishDescription [Product Description], 
  ISNULL (p.Status, 'Outdated') AS [Product Status] 
FROM 
  dbo.DimProduct as p 
  LEFT JOIN dbo.DimProductSubcategory AS ps ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey 
  LEFT JOIN dbo.DimProductCategory AS pc ON pc.ProductCategoryKey = ps.ProductCategoryKey 
ORDER BY 
  1 ASC
```
**FACT_InternetSales** (Cleansed up the internet sales table)
```
SELECT  [ProductKey] as [Product Key]
      ,[OrderDateKey] as [Order Date] 
      ,[DueDateKey] as [Due Date]
      ,[ShipDateKey] as [Ship Date]
      ,[CustomerKey] as [Customer Key]
      ,[SalesAmount] as [Sales Amount]
  FROM [AdventureWorksDW2022].[dbo].[FactInternetSales]
  WHERE LEFT (OrderDateKey, 4) BETWEEN 2019 AND 2021
  ORDER BY 1 ASC
```
<br />

## Data Model
Below is the screenshot of data model after being cleaned and prepared tables were read in Power BI.
![The screenshot of the data model](/assets/images/Relation%20Management.png)
<br />

## Sales Management Dashboard
This is a one page dashboard, combining visuaklisations that shows sales over time, per customers, and products
![Dash board images](/assets/images/Tableau%20dashbord.png)

[See this link for the dashboard](/Sales.pbix)

