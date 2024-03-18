CREATE DATABASE durgabhavani;
USE durgabhavani;
CREATE TABLE  Farmers (
    FarmerID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    ContactNumber VARCHAR(20),
    Address VARCHAR(255)
);
INSERT INTO Farmers (FarmerID, FirstName, LastName, ContactNumber, Address) 
VALUES
    (1, 'John', 'Doe', '123-456-7890', '123 Main St'),
    (2, 'Jane', 'Smith', '456-789-0123', '456 Elm St'),
    (3, 'Michael', 'Johnson', '789-012-3456', '789 Oak St');
CREATE TABLE  Farms (
    FarmID INT PRIMARY KEY,
    FarmerID INT,
    FarmName VARCHAR(255),
    Location VARCHAR(255),
    Size DECIMAL(10, 2),
    SoilType VARCHAR(50),
    FOREIGN KEY (FarmerID) REFERENCES Farmers(FarmerID)
);
INSERT INTO Farms (FarmID, FarmerID, FarmName, Location, Size, SoilType) 
VALUES
    (1, 1, 'Doe Farm', 'AUSTRALIA', 100.00, 'Loamy'),
    (2, 2, 'Smith Farm', 'INDIA', 75.50, 'Sandy'),
    (3, 1, 'Doe Ranch', 'INDIA', 150.25, 'Clayey');
CREATE TABLE Fertilizers (
    FertilizerID INT PRIMARY KEY,
    FertilizerName VARCHAR(255),
    Manufacturer VARCHAR(255),
    NutrientContent VARCHAR(255),
    Type VARCHAR(50),
    UsageInstructions TEXT
);
INSERT INTO Fertilizers (FertilizerID, FertilizerName, Manufacturer, NutrientContent, Type, UsageInstructions)
VALUES
    (1, 'Nitrogen-based Fertilizer', 'UREA', 'NPK 10-5-5', 'Nitrogen', 'Apply evenly across the field.'),
    (2, 'Phosphorus-based Fertilizer', 'DAP', 'NPK 5-10-5', 'Phosphorus', 'Dig into soil before planting'),
    (3, 'Potassium-based Fertilizer', 'POTASH', 'NPK 0-0-60', 'Potassium', 'Apply during flowering stage.');

-- Create the Inventory table
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    FertilizerID INT,
    Quantity INT,
    PurchaseDate DATE,
    ExpiryDate DATE,
    Supplier VARCHAR(255),
    Cost DECIMAL(10, 2),
    FOREIGN KEY (FertilizerID) REFERENCES Fertilizers(FertilizerID)
);
INSERT INTO Inventory (InventoryID, FertilizerID, Quantity, PurchaseDate, ExpiryDate, Supplier, Cost)
VALUES
    (1, 1, 100, '2023-01-15', '2024-01-15', 'Agro Supplies Inc.', 500.00),
    (2, 2, 50, '2023-02-20', '2024-02-20', 'Farmers Co-op', 250.00),
    (3, 3, 75, '2023-03-10', '2024-03-10', 'Greenfields Agro', 400.00);
CREATE TABLE ApplicationRecords (
    RecordID INT PRIMARY KEY,
    FarmID INT,
    FertilizerID INT,
    ApplicationDate DATE,
    ApplicationQuantity INT,
    ApplicationMethod VARCHAR(255),
    WeatherConditions VARCHAR(255),
    FOREIGN KEY (FarmID) REFERENCES Farms(FarmID),
    FOREIGN KEY (FertilizerID) REFERENCES Fertilizers(FertilizerID)
);
INSERT INTO ApplicationRecords (RecordID, FarmID, FertilizerID, ApplicationDate, ApplicationQuantity, ApplicationMethod, WeatherConditions)
VALUES
    (1, 1, 1, '2023-03-01', 50, 'Spraying', 'Sunny'),
    (2, 2, 2, '2023-03-05', 30, 'Broadcasting', 'Rainy'),
    (3, 1, 3, '2023-03-10', 40, 'Drip Irrigation', 'Cloudy');

#1. Retrieve all farmers and their farms:
SELECT Farmers.FirstName, Farmers.LastName, Farms.FarmName, Farms.Location
FROM Farmers
INNER JOIN Farms ON Farmers.FarmerID = Farms.FarmerID;

#2. List all fertilizers in the inventory:
SELECT Fertilizers.FertilizerName, Inventory.Quantity, Inventory.ExpiryDate
FROM Fertilizers
INNER JOIN Inventory ON Fertilizers.FertilizerID = Inventory.FertilizerID;

#3. Calculate the total quantity of each fertilizer in the inventory:
SELECT Fertilizers.FertilizerName, SUM(Inventory.Quantity) AS TotalQuantity
FROM Fertilizers
INNER JOIN Inventory ON Fertilizers.FertilizerID = Inventory.FertilizerID
GROUP BY Fertilizers.FertilizerName;

#4. Display farmers and their application records:
SELECT Farmers.FirstName, Farmers.LastName, ApplicationRecords.ApplicationDate, Fertilizers.FertilizerName
FROM Farmers
INNER JOIN Farms ON Farmers.FarmerID = Farms.FarmerID
INNER JOIN ApplicationRecords ON Farms.FarmID = ApplicationRecords.FarmID
INNER JOIN Fertilizers ON ApplicationRecords.FertilizerID = Fertilizers.FertilizerID;

#5. Find farms using organic fertilizers:
SELECT Farms.FarmName, Fertilizers.FertilizerName
FROM Farms
INNER JOIN ApplicationRecords ON Farms.FarmID = ApplicationRecords.FarmID
INNER JOIN Fertilizers ON ApplicationRecords.FertilizerID = Fertilizers.FertilizerID
WHERE Fertilizers.Type = 'Nitrogen';

#6. Retrieve farms and their total application cost:
SELECT Farms.FarmName, SUM(Inventory.Cost) AS TotalCost
FROM Farms
INNER JOIN ApplicationRecords ON Farms.FarmID = ApplicationRecords.FarmID
INNER JOIN Fertilizers ON ApplicationRecords.FertilizerID = Fertilizers.FertilizerID
INNER JOIN Inventory ON Fertilizers.FertilizerID = Inventory.FertilizerID
GROUP BY Farms.FarmName;

#7. Find farmers with multiple farms:
SELECT Farmers.FirstName, Farmers.LastName, COUNT(Farms.FarmID) AS FarmCount
FROM Farmers
INNER JOIN Farms ON Farmers.FarmerID = Farms.FarmerID
GROUP BY Farmers.FirstName, Farmers.LastName
HAVING COUNT(Farms.FarmID) > 1;

#8. Identify farms with low fertilizer quantities:
SELECT Farms.FarmName, Fertilizers.FertilizerName, Inventory.Quantity
FROM Farms
INNER JOIN ApplicationRecords ON Farms.FarmID = ApplicationRecords.FarmID
INNER JOIN Fertilizers ON ApplicationRecords.FertilizerID = Fertilizers.FertilizerID
INNER JOIN Inventory ON Fertilizers.FertilizerID = Inventory.FertilizerID
WHERE Inventory.Quantity > 10;

#9. List farms in a specific location:
SELECT * FROM Farms WHERE Location = 'INDIA';

#10. Show application records with specific weather conditions:
SELECT Farms.FarmName, ApplicationRecords.ApplicationDate, ApplicationRecords.WeatherConditions
FROM Farms
INNER JOIN ApplicationRecords ON Farms.FarmID = ApplicationRecords.FarmID
WHERE ApplicationRecords.WeatherConditions = 'SUNNY';

#11. Retrieve farms with a certain soil type:
SELECT * FROM Farms WHERE SoilType = 'SANDY';

#12. Display the oldest and newest farms:
SELECT FarmName, MIN(ApplicationDate) AS OldestApplication, MAX(ApplicationDate) AS NewestApplication
FROM ApplicationRecords
INNER JOIN Farms ON ApplicationRecords.FarmID = Farms.FarmID
GROUP BY FarmName;

#13. Calculate the average farm size:
SELECT AVG(Size) AS AverageSize FROM Farms;

#14. Show the top 5 farmers with the highest total application quantity:
SELECT Farmers.FirstName, Farmers.LastName, SUM(ApplicationRecords.ApplicationQuantity) AS TotalQuantity
FROM Farmers
INNER JOIN Farms ON Farmers.FarmerID = Farms.FarmerID
INNER JOIN ApplicationRecords ON Farms.FarmID = ApplicationRecords.FarmID
GROUP BY Farmers.FirstName, Farmers.LastName
ORDER BY TotalQuantity DESC
LIMIT 5;

#15. Retrieve details of expired fertilizers in the inventory:
SELECT FertilizerName, Quantity, ExpiryDate
FROM Fertilizers
INNER JOIN Inventory ON Fertilizers.FertilizerID = Inventory.FertilizerID
WHERE ExpiryDate < CURDATE();




