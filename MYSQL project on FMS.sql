CREATE DATABASE durgabhavani;
USE durgabhavani;
-- Create the Farmers table
CREATE TABLE  Farmers (
    FarmerID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    ContactNumber VARCHAR(20),
    Address VARCHAR(255));
INSERT INTO Farmers (FarmerID, FirstName, LastName, ContactNumber, Address) 
VALUES
    (1, 'Rama', 'Krishna', '9449796389', 'SINDHANUR'),
    (2, 'Ram', 'Raj', '6361475719', 'MANVI'),
    (3, 'Akhil', 'U', '7760197764', 'SINDHANUR'),
    (4, 'Durga', 'Prasad', '9990001234', 'MASKI'),
    (5, 'Vinay', 'Kumar', '8217057277', 'MASKI'),
    (6, 'Sai', 'Krishna', '9916329632', 'SINDHANUR'),
    (7, 'Hari', 'Krishna', '6363123456', 'MANVI'),
    (8, 'Arjun', 'Kumar', '6360007891', 'MANVI'),
    (9, 'Balaji', 'M', '6360891791', 'SINDHANUR'),
    (10, 'Naveen', 'kumar', '7996156612', 'MASKI');
    -- Create the Farms table
CREATE TABLE  Farms (
    FarmID INT PRIMARY KEY,
    FarmerID INT,
    FarmName VARCHAR(255),
    Location VARCHAR(255),
    Size DECIMAL(10, 2),
    SoilType VARCHAR(50),
    FOREIGN KEY (FarmerID) REFERENCES Farmers(FarmerID));
INSERT INTO Farms (FarmID, FarmerID, FarmName, Location, Size, SoilType) 
VALUES
    (1, 1, 'Krishna Farm', 'INDIA', 100.00, 'Loamy'),
    (2, 2, 'Raj Farm', 'INDIA', 75.50, 'Sandy'),
    (3, 3, 'Akhil Ranch', 'INDIA', 150.25, 'Clayey'),
    (4, 4, 'Prasad Acres', 'INDIA', 200.75, 'Silty'),
    (5, 5, 'Vinay Farmstead', 'INDIA', 120.00, 'Sandy Loam'),
    (6, 6, 'Sai Fields', 'INDIA', 80.25, 'Loamy'),
    (7, 7, 'Bond Gardens', 'INDIA', 160.50, 'Clayey'),
    (8, 8, 'Arjun Plantation', 'INDIA', 180.75, 'Sandy Loam'),
    (9, 9, 'Balaji Homestead', 'INDIA', 90.00, 'Silty'),
    (10, 10, 'Naveen Orchard', 'INDIA', 110.25, 'Loamy');
    
-- Create the Fertilizers table
    CREATE TABLE Fertilizers (
    FertilizerID INT PRIMARY KEY,
    FertilizerName VARCHAR(255),
    Manufacturer VARCHAR(255),
    NutrientContent VARCHAR(255),
    Type VARCHAR(50),
    UsageInstructions TEXT);
INSERT INTO Fertilizers (FertilizerID, FertilizerName, Manufacturer, NutrientContent, Type, UsageInstructions)
VALUES
    (1, 'Nitrogen-based Fertilizer', 'UREA', 'NPK 10-5-5', 'Nitrogen', 'Apply evenly across the field.'),
    (2, 'Phosphorus-based Fertilizer', 'DAP', 'NPK 5-10-5', 'Phosphorus', 'Dig into soil before planting.'),
    (3, 'Potassium-based Fertilizer', 'POTASH', 'NPK 0-0-60', 'Potassium', 'Apply during flowering stage.'),
    (4, 'Organic Compost', 'Green Fields Organics', 'N/A', 'Organic', 'Spread evenly over the soil surface and mix with topsoil.'),
    (5, 'Calcium Nitrate', 'Farmers Supply Co.', 'NPK 15.5-0-0', 'Chemical', 'Dissolve in water and apply through irrigation system.'),
    (6, 'Granular Fertilizer', 'Garden Masters', 'NPK 10-10-10', 'Granular', 'Broadcast over the soil surface and water thoroughly.'),
    (7, 'Liquid Seaweed Extract', 'Seaweed Solutions', 'N/A', 'Organic', 'Dilute with water and apply directly to foliage.'),
    (8, 'Slow-release Fertilizer', 'Fertile Earth', 'NPK 14-14-14', 'Slow-release', 'Incorporate into soil or apply as a top dressing.'),
    (9, 'Fish Emulsion', 'Aquatic Organics', 'N/A', 'Organic', 'Dilute with water and apply to soil or foliage.'),
    (10, 'Bone Meal', 'Bone Grow Inc.', 'NPK 3-15-0', 'Organic', 'Mix into soil before planting for root development.');

-- Create the Inventory table
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    FertilizerID INT,
    Quantity INT,
    PurchaseDate DATE,
    ExpiryDate DATE,
    Supplier VARCHAR(255),
    Cost DECIMAL(10, 2),
    FOREIGN KEY (FertilizerID) REFERENCES Fertilizers(FertilizerID));
INSERT INTO Inventory (InventoryID, FertilizerID, Quantity, PurchaseDate, ExpiryDate, Supplier, Cost)
VALUES
    (1, 1, 50, '2023-01-15', '2024-01-15', 'Agro Supplies Inc.', 250.00),
    (2, 2, 30, '2023-02-20', '2024-02-20', 'Farmers Co-op', 150.00),
    (3, 3, 40, '2023-03-10', '2024-03-10', 'Greenfields Agro', 200.00),
    (4, 4, 60, '2023-04-05', '2024-04-05', 'Organic Solutions', 300.00),
    (5, 5, 70, '2023-05-15', '2024-05-15', 'Agro World', 350.00),
    (6, 6, 80, '2023-06-20', '2024-06-20', 'Fertilizer Depot', 400.00),
    (7, 7, 90, '2023-07-10', '2024-07-10', 'Organic Farming Supplies', 450.00),
    (8, 8, 100, '2023-08-25', '2024-08-25', 'EcoFert Solutions', 500.00),
    (9, 9, 110, '2023-09-10', '2024-09-10', 'Aquatic Organics', 550.00),
    (10, 10, 120, '2023-10-15', '2024-10-15', 'Bone Grow Inc.', 600.00);
    
-- Create the ApplicationRecords table 
CREATE TABLE ApplicationRecords (
    RecordID INT PRIMARY KEY,
    FarmID INT,
    FertilizerID INT,
    ApplicationDate DATE,
    ApplicationQuantity INT,
    ApplicationMethod VARCHAR(255),
    WeatherConditions VARCHAR(255),
    FOREIGN KEY (FarmID) REFERENCES Farms(FarmID),
    FOREIGN KEY (FertilizerID) REFERENCES Fertilizers(FertilizerID));
INSERT INTO ApplicationRecords (RecordID, FarmID, FertilizerID, ApplicationDate, ApplicationQuantity, ApplicationMethod, WeatherConditions)
VALUES
    (1, 1, 1, '2023-01-15', 50, 'Spraying', 'Sunny'),
    (2, 2, 2, '2023-02-20', 30, 'Broadcasting', 'Rainy'),
    (3, 3, 3, '2023-03-10', 40, 'Drip Irrigation', 'Cloudy'),
    (4, 4, 4, '2023-04-05', 60, 'Foliar Spray', 'Sunny'),
    (5, 5, 5, '2023-05-15', 70, 'Fertigation', 'Partly Cloudy'),
    (6, 6, 6, '2023-06-20', 80, 'Top Dressing', 'Sunny'),
    (7, 7, 7, '2023-07-10', 90, 'Injection', 'Windy'),
    (8, 8, 8, '2023-08-25', 100, 'Fertigation', 'Rainy'),
    (9, 9, 9, '2023-09-10', 110, 'Broadcasting', 'Sunny'),
    (10, 10, 10, '2023-10-15', 120, 'Foliar Spray', 'Cloudy');

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
WHERE Fertilizers.Type = 'ORGANIC';

#6. Retrieve farms and their total application cost:
SELECT Farms.FarmName, SUM(Inventory.Cost) AS TotalCost
FROM Farms
INNER JOIN ApplicationRecords ON Farms.FarmID = ApplicationRecords.FarmID
INNER JOIN Fertilizers ON ApplicationRecords.FertilizerID = Fertilizers.FertilizerID
INNER JOIN Inventory ON Fertilizers.FertilizerID = Inventory.FertilizerID
GROUP BY Farms.FarmName;

#7. Identify farms with low fertilizer quantities:
SELECT Farms.FarmName, Fertilizers.FertilizerName, Inventory.Quantity
FROM Farms
INNER JOIN ApplicationRecords ON Farms.FarmID = ApplicationRecords.FarmID
INNER JOIN Fertilizers ON ApplicationRecords.FertilizerID = Fertilizers.FertilizerID
INNER JOIN Inventory ON Fertilizers.FertilizerID = Inventory.FertilizerID
WHERE Inventory.Quantity > 50;

#8. List farms in a specific location:
SELECT * FROM Farms WHERE Location = 'INDIA';

#9. Show application records with specific weather conditions:
SELECT Farms.FarmName, ApplicationRecords.ApplicationDate, ApplicationRecords.WeatherConditions
FROM Farms
INNER JOIN ApplicationRecords ON Farms.FarmID = ApplicationRecords.FarmID
WHERE ApplicationRecords.WeatherConditions = 'SUNNY';

#10. Retrieve farms with a certain soil type:
SELECT * FROM Farms WHERE SoilType = 'SANDY';

#11. Display the oldest and newest farms:
SELECT FarmName, MIN(ApplicationDate) AS OldestApplication, MAX(ApplicationDate) AS NewestApplication
FROM ApplicationRecords
INNER JOIN Farms ON ApplicationRecords.FarmID = Farms.FarmID
GROUP BY FarmName;

#12. Calculate the average farm size:
SELECT AVG(Size) AS AverageSize FROM Farms;

#13. Show the top 5 farmers with the highest total application quantity:
SELECT Farmers.FirstName, Farmers.LastName, SUM(ApplicationRecords.ApplicationQuantity) AS TotalQuantity
FROM Farmers
INNER JOIN Farms ON Farmers.FarmerID = Farms.FarmerID
INNER JOIN ApplicationRecords ON Farms.FarmID = ApplicationRecords.FarmID
GROUP BY Farmers.FirstName, Farmers.LastName
ORDER BY TotalQuantity DESC
LIMIT 5;

#14. Retrieve details of expired fertilizers in the inventory:
SELECT FertilizerName, Quantity, ExpiryDate
FROM Fertilizers
INNER JOIN Inventory ON Fertilizers.FertilizerID = Inventory.FertilizerID
WHERE ExpiryDate < CURDATE();
