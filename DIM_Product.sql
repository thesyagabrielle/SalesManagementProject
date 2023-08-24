-- Cleansed DimProduct Table
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
