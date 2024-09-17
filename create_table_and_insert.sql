create table Products(
	ProductID int primary key,
	ProductName nvarchar(100),
	Price decimal(10,2)
);


create table Sales(
	SaleID int primary key,
	ProductID int,
	Quantity int,
	SaleDate datetime,
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
)


INSERT INTO Products (ProductID, ProductName, Price) VALUES
(1, 'Laptop', 1500.00),
(2, 'Mouse', 25.00),
(3, 'Keyboard', 45.00);


INSERT INTO Sales (SaleID, ProductID, Quantity, SaleDate) VALUES
(1, 1, 2, '2024-01-10'),
(2, 2, 5, '2024-01-15'),
(3, 1, 1, '2024-02-20'),
(4, 3, 3, '2024-03-05'),
(5, 2, 7, '2024-03-25'),
(6, 3, 2, '2024-04-12');


select * from Products
select * from Sales


