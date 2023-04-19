USE TSQL2012

CREATE TABLE  dbo.SKU
(
	ID int Primary key identity,
	Code  AS ('s' + CAST(ID AS VARCHAR)) UNIQUE,
	Name varchar(30)
);


CREATE TABLE dbo.Family 
(
	ID int Primary key identity, 
	SurName varchar(30),
	BudgetValue int
);

CREATE TABLE dbo.Basket
(
    ID INT PRIMARY KEY IDENTITY,
    ID_SKU INT FOREIGN KEY REFERENCES dbo.SKU (ID),
    ID_Family INT FOREIGN KEY REFERENCES dbo.Family (ID),
    Quantity INT CHECK (Quantity >= 0),
    Value INT CHECK (Value >= 0),
    PurchaseDate DATE DEFAULT GETDATE(),
    DiscountValue INT
);