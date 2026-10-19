--1) Measures
SELECT COUNT(DISTINCT order_id) AS #Orders, ROUND(SUM(sales),1) AS Total_Sales,
	ROUND(SUM(Gross_Profit),1) AS Total_Profit, ROUND(SUM(cost),1) AS Total_Cost, SUM(units) AS Total_Units
FROM Sales
WHERE Country_Region = 'United States'



--2) Values per Year
SELECT YEAR(order_date) AS [Year] ,COUNT(DISTINCT order_id) AS #Orders, ROUND(SUM(sales),1) AS Total_Sales,
	ROUND(SUM(Gross_Profit),1) AS Total_Profit
FROM Sales
WHERE Country_Region = 'United States'
GROUP BY YEAR(order_date)
ORDER BY YEAR(order_date)



--3) Values per Month
SELECT MONTH(order_date) AS [Month] ,COUNT(DISTINCT order_id) AS #Orders, ROUND(SUM(sales),1) AS Total_Sales,
	ROUND(SUM(Gross_Profit),1) AS Total_Profit
FROM Sales
WHERE Country_Region = 'United States'
GROUP BY MONTH(order_date)
ORDER BY MONTH(order_date)



--4) Sales per Division and Target
SELECT S.Division , ROUND(SUM(sales),1) AS Total_Sales, [Target],
CASE
	WHEN SUM(sales) >= [Target] THEN 'Achieved'
	ELSE 'Not Achieved'
	END AS Target_Achieved

FROM Sales S
JOIN Targets T
ON S.Division = T.Division
WHERE Country_Region = 'United States'
GROUP BY S.Division, [Target]
ORDER BY 2 DESC


--5) Sales and Profit per Factory
SELECT Factory , ROUND(SUM(sales),1) AS Total_Sales, ROUND(SUM(Gross_Profit),1) AS Total_Profit
FROM Sales S
JOIN Products P
ON S.Product_ID = P.Product_ID
WHERE Country_Region = 'United States'
GROUP BY  Factory
ORDER BY 2 DESC




--6) Top 5 Products
SELECT TOP 5 P.Product_Name , ROUND(SUM(sales),1) AS Total_Sales, 
	ROUND(SUM(Gross_Profit),1) AS Total_Profit, 
	SUM(Units) AS Total_Quantity, ROUND(SUM(Unit_Price),2) AS Unit_Price
FROM Sales S
JOIN Products P
ON S.Product_ID = P.Product_ID
WHERE Country_Region = 'United States'
GROUP BY P.Product_Name, Unit_Price
ORDER BY 2 DESC



--7) Factory Divisions 
SELECT Factory ,P.Division, SUM(Units) AS Quantity
FROM Sales S
JOIN Products P
ON S.Product_ID = P.Product_ID
WHERE Country_Region = 'United States'
GROUP BY  Factory, P.Division 
ORDER BY 1 

--8) Order per Ship Mode
SELECT Ship_Mode, COUNT(DISTINCT order_id) AS #Orders
FROM Sales
WHERE Country_Region = 'United States'
GROUP BY  Ship_Mode
ORDER BY 2


--9) Region Info
SELECT DISTINCT Region, COUNT(U.City) AS #Cities, SUM([Population]) AS [Population], ROUND(SUM(Density),1) AS Density
FROM Sales S
JOIN uszips U
ON S.Postal_Code = U.zip
WHERE Country_Region = 'United States'
GROUP BY Region



--10) Sales and Profit per Region
SELECT DISTINCT Region,  ROUND(SUM(sales),1) AS Total_Sales, ROUND(SUM(Gross_Profit),1) AS Total_Profit
FROM Sales S
WHERE Country_Region = 'United States'
GROUP BY Region
ORDER BY 2 DESC