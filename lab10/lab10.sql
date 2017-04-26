USE lab10;

GO
SET STATISTICS IO ON;
GO
SET STATISTICS TIME ON;
GO

-- For the purity of the experiment
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'ix_CustomerID_inc_ContractName_Country')
	DROP INDEX ix_CustomerID_inc_ContractName_Country ON Customers;
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'ix_cl_CustomerID')
	DROP INDEX ix_cl_CustomerID ON Customers;
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'ix_CustomerID_inc_EmployeeID')
	DROP INDEX ix_CustomerID_inc_EmployeeID ON Orders;
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'ix_CustomerID_inc_ContactName')
	DROP INDEX ix_CustomerID_inc_ContactName ON Customers;
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'ix_ProductID_UnitPrice_inc_ProductName')
	DROP INDEX ix_ProductID_UnitPrice_inc_ProductName ON Products;
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'ix_OrderID_Quantity_Discount')
	DROP INDEX ix_OrderID_Quantity_Discount ON OrderDetails;
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'ix_OrderID_OrderDate_RequiredDate_inc_ShippedDate_Freight')
	DROP INDEX ix_OrderID_OrderDate_RequiredDate_inc_ShippedDate_Freight ON Orders;
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'ix_CustomerID_CompanyName')
	DROP INDEX ix_CustomerID_CompanyName ON Customers;

-- ============================================================================================================
-- Select from Customers with filter by CustomerID and few other table fields (ContactName and Country).
-- ============================================================================================================

SELECT * FROM Customers
	WHERE CustomerID = 'ALFKI'
		AND ContactName = 'Maria Anders'
		AND Country = 'Germany';

PRINT '^^^ select from Customers without index ^^^';

CREATE NONCLUSTERED INDEX ix_CustomerID_inc_ContractName_Country ON Customers(CustomerID)
	INCLUDE (ContactName, Country);

SELECT * FROM Customers
	WHERE CustomerID = 'ALFKI'
		AND ContactName = 'Maria Anders'
		AND Country = 'Germany';

PRINT '^^^ select from Customers with unclustered index ^^^';

CREATE CLUSTERED INDEX ix_cl_CustomerID ON Customers(CustomerID);
ALTER INDEX ix_CustomerID_inc_ContractName_Country ON Customers
	REBUILD;

SELECT * FROM Customers
	WHERE CustomerID = 'ALFKI'
		AND ContactName = 'Maria Anders'
		AND Country = 'Germany';

PRINT '^^^ select from Customers with clustered and unclustered indexes ^^^';

-- Cleaning up
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'ix_CustomerID_inc_ContractName_Country')
	DROP INDEX ix_CustomerID_inc_ContractName_Country ON Customers;
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'ix_cl_CustomerID')
	DROP INDEX ix_cl_CustomerID ON Customers;

-- ============================================================================================================
-- Select from joined Customers and Orders with filtration by few columns (ContactName and EmployeeID)
-- ============================================================================================================

SELECT * 
	FROM Customers JOIN Orders ON Customers.CustomerID = Orders.CustomerID
	WHERE ContactName = 'Maria Anders'
		AND (EmployeeID BETWEEN 3 AND 6);

PRINT '^^^ select from Customers join Orders without index ^^^';

CREATE CLUSTERED INDEX ix_cl_CustomerID ON Customers(CustomerID);
CREATE NONCLUSTERED INDEX ix_CustomerID_inc_EmployeeID ON Orders(CustomerID)
	INCLUDE (EmployeeID);
CREATE NONCLUSTERED INDEX ix_CustomerID_inc_ContactName ON Customers(ContactName)
	INCLUDE (CustomerID);

SELECT Customers.CustomerID, ContactName, EmployeeID
	FROM Customers JOIN Orders ON Customers.CustomerID = Orders.CustomerID
	WHERE ContactName = 'Maria Anders'
		AND (EmployeeID BETWEEN 3 AND 6);

PRINT '^^^ select from Customers join Orders with index ^^^';

-- Cleaning up
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'ix_cl_CustomerID')
	DROP INDEX ix_cl_CustomerID ON Customers;
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'ix_CustomerID_inc_EmployeeID')
	DROP INDEX ix_CustomerID_inc_EmployeeID ON Orders;
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'ix_CustomerID_inc_ContactName')
	DROP INDEX ix_CustomerID_inc_ContactName ON Customers;

-- ============================================================================================================
-- Select from all 4 tables joined with filtration by few columns (ContactName and EmployeeID)
-- ============================================================================================================

SELECT Products.ProductName, Orders.OrderDate, Orders.RequiredDate, Orders.ShippedDate, Orders.Freight, OrderDetails.Quantity
	FROM Customers 
		JOIN Orders on Customers.CustomerID = Orders.CustomerID
		JOIN OrderDetails on Orders.OrderID = OrderDetails.OrderID
		JOIN Products on Products.ProductID = OrderDetails.ProductID
	WHERE Customers.CompanyName = 'Pericles Comidas clasicas'
		AND Orders.OrderDate < '01/01/1998'
		AND Products.UnitPrice * OrderDetails.Quantity > 200
		AND OrderDetails.Discount = 0
	ORDER BY Customers.CompanyName;

PRINT '^^^ select from all 4 tables without index ^^^';

CREATE NONCLUSTERED INDEX ix_ProductID_UnitPrice_inc_ProductName ON Products(ProductID, UnitPrice)
	INCLUDE (ProductName);
CREATE NONCLUSTERED INDEX ix_OrderID_Quantity_Discount ON OrderDetails(OrderID, Quantity, Discount);
CREATE NONCLUSTERED INDEX ix_OrderID_OrderDate_RequiredDate_inc_ShippedDate_Freight ON Orders(OrderID, OrderDate, RequiredDate) 
	INCLUDE (ShippedDate, Freight);
CREATE CLUSTERED INDEX ix_CustomerID_CompanyName ON Customers(CustomerID, CompanyName);

SELECT Products.ProductName, Orders.OrderDate, Orders.RequiredDate, Orders.ShippedDate, Orders.Freight, OrderDetails.Quantity
	FROM Customers 
		JOIN Orders on Customers.CustomerID = Orders.CustomerID
		JOIN OrderDetails on Orders.OrderID = OrderDetails.OrderID
		JOIN Products on Products.ProductID = OrderDetails.ProductID
	WHERE Customers.CompanyName = 'Pericles Comidas clasicas'
		AND Orders.OrderDate < '01/01/1998'
		AND Products.UnitPrice * OrderDetails.Quantity > 200
		AND OrderDetails.Discount = 0
	ORDER BY Customers.CompanyName;

PRINT '^^^ select from all 4 tables with index ^^^';

-- Cleaning up
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'ix_ProductID_UnitPrice_inc_ProductName')
	DROP INDEX ix_ProductID_UnitPrice_inc_ProductName ON Products;
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'ix_OrderID_Quantity_Discount')
	DROP INDEX ix_OrderID_Quantity_Discount ON OrderDetails;
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'ix_OrderID_OrderDate_RequiredDate_inc_ShippedDate_Freight')
	DROP INDEX ix_OrderID_OrderDate_RequiredDate_inc_ShippedDate_Freight ON Orders;
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'ix_CustomerID_CompanyName')
	DROP INDEX ix_CustomerID_CompanyName ON Customers;