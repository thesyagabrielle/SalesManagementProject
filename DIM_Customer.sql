-- Cleansed DimCustomer Table --
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

