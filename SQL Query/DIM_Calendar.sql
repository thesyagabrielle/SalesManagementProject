-- Cleansed DimDate Table --
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
