Create view V1
AS
SELECT Row_ID, Order_ID, Customer_ID,
	Order_Date, Ship_Date, Ship_Mode, 
	S.Sales, Units, Gross_Profit, Cost,

	P.Product_Name, P.Product_ID, Unit_Price, Unit_Cost,
	T.Division, T.[Target],
	F.Factory, F.Latitude, F.Longitude,

	U.lat, U.lng, [population], density, county_fips, county_name,
	Country_Region, Region, State_Province, state_id, U.City, Postal_Code,
	county_weights, county_names_all, county_fips_all, timezone

FROM Sales S
JOIN Products P
ON S.Product_ID = P.Product_ID
JOIN Targets T
ON S.Division = T.Division
JOIN Factories F
ON F.Factory = P.Factory
JOIN uszips U
ON U.zip = S.Postal_Code

SELECT * FROM V1