-- CLeansed FactInternetSales Table --
SELECT  [ProductKey] as [Product Key]
      ,[OrderDateKey] as [Order Date] 
      ,[DueDateKey] as [Due Date]
      ,[ShipDateKey] as [Ship Date]
      ,[CustomerKey] as [Customer Key]
      ,[SalesAmount] as [Sales Amount]
  FROM [AdventureWorksDW2022].[dbo].[FactInternetSales]
  WHERE LEFT (OrderDateKey, 4) BETWEEN 2019 AND 2021
  ORDER BY 1 ASC
