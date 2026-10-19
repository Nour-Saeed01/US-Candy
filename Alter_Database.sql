
-- Change Data Types to Accept Primary Key and Foreign Key
ALTER TABLE Products 
ALTER COLUMN Product_ID VARCHAR(255) NOT NULL

ALTER TABLE Factories 
ALTER COLUMN Factory VARCHAR(255) NOT NULL

ALTER TABLE Targets 
ALTER COLUMN Division VARCHAR(255) NOT NULL

ALTER TABLE Products 
ALTER COLUMN Factory VARCHAR(255) NOT NULL

ALTER TABLE Products 
ALTER  COLUMN Division VARCHAR(255) NOT NULL

ALTER TABLE Sales 
ALTER COLUMN Product_ID VARCHAR(255) NOT NULL

ALTER TABLE Sales 
ALTER COLUMN Postal_Code VARCHAR(255) NULL

ALTER TABLE Sales 
ALTER  COLUMN Division VARCHAR(255) NOT NULL


-- Delete Unrelated Data
UPDATE Sales
SET Postal_Code = NULL 
WHERE Postal_Code like '%[^0-9]%'

ALTER TABLE Sales 
ALTER COLUMN Postal_Code INT 


-- Drop Null Column
ALTER TABLE uszips 
DROP COLUMN parent_zcta 



-- Add Primary Kies
ALTER TABLE Targets 
ADD PRIMARY KEY(Division)

ALTER TABLE Factories 
ADD PRIMARY KEY(Factory)

ALTER TABLE Products 
ADD PRIMARY KEY(Product_ID)

ALTER TABLE uszips 
ADD PRIMARY KEY(zip)

ALTER TABLE Sales 
ADD PRIMARY KEY(Row_ID)


-- Add Foreign Kies
ALTER TABLE Products 
ADD FOREIGN KEY(Factory) REFERENCES Factories(Factory),
	FOREIGN KEY(Division) REFERENCES Targets(Division)

ALTER TABLE Sales 
ADD FOREIGN KEY(Product_ID) REFERENCES Products(Product_ID),
	FOREIGN KEY(Postal_Code) REFERENCES uszips(zip)

ALTER TABLE Sales 
ADD FOREIGN KEY(Division) REFERENCES Targets(Division)






