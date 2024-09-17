
-- A query that returns the total sales amount and the total number of sales.(with CTE)

with cte as(
select YEAR(S.SaleDate) AS YEAR,
	P.ProductName,
	SUM(P.Price * S.Quantity) as Total_Sales_Amount,
	SUM(Quantity) as Number_Of_Sales
from Products P
inner join Sales S on S.ProductID=P.ProductID
group by P.ProductName,YEAR(S.SaleDate)
)

select * 
from cte
order by Total_Sales_Amount desc



--Determine the product with the highest total sales amount (

-- method 1(with View)

create view highest_total_sales_amount as
	with cte as(
select YEAR(S.SaleDate) AS YEAR,
	P.ProductName,
	SUM(P.Price * S.Quantity) as Total_Sales_Amount,
	SUM(Quantity) as Number_Of_Sales
from Products P
inner join Sales S on S.ProductID=P.ProductID
group by P.ProductName,YEAR(S.SaleDate)
)

select *
from cte
where Total_Sales_Amount=(Select max(Total_Sales_Amount) from cte)


select * from highest_total_sales_amount



--method 2 (with top 1)

select top 1 
YEAR(S.SaleDate) AS YEAR,
	P.ProductName,
	SUM(P.Price * S.Quantity) as Total_Sales_Amount,
	SUM(Quantity) as Number_Of_Sales
from Products P
inner join Sales S on S.ProductID=P.ProductID
group by P.ProductName,YEAR(S.SaleDate)
order by Total_Sales_Amount desc


--method 3 (with subquery)

select YEAR(S.SaleDate) AS YEAR,
	P.ProductName,
	SUM(P.Price * S.Quantity) as Total_Sales_Amount,
	SUM(Quantity) as Number_Of_Sales
from Products P
inner join Sales S on S.ProductID=P.ProductID
group by P.ProductName,YEAR(S.SaleDate)
having SUM(P.Price * S.Quantity)  =
(
	select max(Total_Sales_Amount)
	from(
	select SUM(P2.Price * S2.Quantity) as Total_Sales_Amount
	from Products P2
	inner join Sales S2 on S2.ProductID=P2.ProductID
	group by P2.ProductName,YEAR(S2.SaleDate)
) as subq
)





	
	

